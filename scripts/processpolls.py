#!/usr/bin/python3

"""Script to process poll results from Elections Canada."""

import psycopg2

# Ugly global db connection
conn = psycopg2.connect("dbname=electoralmap")

def create_cleanpoll():
    """
    Creates a new table called cleanpoll for cleaned polling data.
    """
    cur = conn.cursor()
    cur.execute("""CREATE TABLE cleanpoll ( fed_num integer
                                          , emrp_name character varying(31)
                                          , pollname  character varying(1023)
                                          , electors integer DEFAULT 0
                                          , libvotes integer DEFAULT 0
                                          , convotes integer DEFAULT 0
                                          , ndpvotes integer DEFAULT 0
                                          , blqvotes integer DEFAULT 0
                                          , grnvotes integer DEFAULT 0
                                          , othvotes integer DEFAULT 0
                                          , nonvotes integer DEFAULT 0
                                          );""")
    conn.commit()

def add_to_column(cur, fed_num, emrp_name, column, value):
    """
    Adds 'value' to 'column' in cleanpoll table.

    Note: This function uses the column parameter to build the query.
    Only call it with known inputs.
    """
    if not value:
        return
    # SQL injection: use column as column name
    query = "UPDATE cleanpoll SET " + column + " = " + column + \
            " + %(value)s WHERE fed_num = %(fed_num)s AND emrp_name = %(emrp_name)s;"
    cur.execute(query,
                { 'fed_num' : fed_num
                , 'column' : column
                , 'value' : value
                , 'emrp_name' : emrp_name
                })

def get_psnums(cur, fed_num, emrp_name):
    """
    Get all polling station numbers from pollresults which
    should be combined into the row for emrp_name.
    """
    cur.execute("""SELECT array_agg(DISTINCT psnum) FROM pollresults WHERE
                           ednum = %(fed_num)s
                   AND NOT voidpoll
                   AND NOT nopoll
                   AND (   (   mergewith = ''
                           AND (psnum = %(psnum)s OR psnum LIKE %(psnum_letter)s)
                           )
                       OR  mergewith = %(psnum)s OR mergewith LIKE %(psnum_letter)s
                       );""",
                { 'psnum' : emrp_name
                , 'psnum_letter' : emrp_name + '_' # Matches, e.g., '26A'
                , 'fed_num' : fed_num
                })
    return cur.fetchone()[0]

def process_poll(cur, fed_num, emrp_name):
    """
    Adds a new entry to the cleanpoll table for the specified poll.
    """
    # Create row
    cur.execute("INSERT INTO cleanpoll (fed_num, emrp_name) VALUES (%s,%s)",
                (fed_num, emrp_name))

    psnums = get_psnums(cur, fed_num, emrp_name)
    if not psnums:
        pollname = "No data"
    elif len(psnums) == 1:
        pollname = "Poll " + psnums[0]
    else:
        pollname = "Polls " + "+".join(psnums)
    cur.execute("""UPDATE cleanpoll SET pollname = %(pollname)s WHERE
                   fed_num = %(fed_num)s AND emrp_name = %(emrp_name)s;""",
                { 'fed_num' : fed_num
                , 'emrp_name' : emrp_name
                , 'pollname' : pollname
                })
    if not psnums:
        return # No data to process

    # Map of party columns to search patterns
    parties = { 'libvotes' : '%Liberal%'
              , 'ndpvotes' : '%NDP%'
              , 'convotes' : '%Conservative%'
              , 'blqvotes' : '%Bloc%'
              , 'grnvotes' : '%Green%'
              }
    votetotals = []
    # For each party, calculate its vote total for all polls
    # merging into the given poll.
    for party, partypattern in parties.items():
        cur.execute("""SELECT sum(votes) FROM pollresults WHERE
                           ednum = %(fed_num)s
                       AND psnum = ANY(%(psnums)s)
                       AND party_en LIKE %(partypattern)s;""",
                    { 'fed_num' : fed_num
                    , 'psnums' : psnums
                    , 'partypattern' : partypattern
                    })
        partyvotes, = cur.fetchone()
        add_to_column(cur, fed_num, emrp_name, party, partyvotes)
        votetotals.append(partyvotes)

    # Find the number of votes for independent candidates.
    params = parties
    params['fed_num'] = fed_num
    params['psnums'] = psnums
    cur.execute("""SELECT sum(votes) FROM pollresults WHERE
                       ednum = %(fed_num)s
                   AND psnum = ANY(%(psnums)s)
                   AND NOT (   party_en LIKE %(libvotes)s
                           OR  party_en LIKE %(convotes)s
                           OR  party_en LIKE %(ndpvotes)s
                           OR  party_en LIKE %(blqvotes)s
                           OR  party_en LIKE %(grnvotes)s
                           )
                   ;""", params)
    othervotes, = cur.fetchone()
    add_to_column(cur, fed_num, emrp_name, 'othvotes', othervotes)
    votetotals.append(othervotes)

    # Count electors
    cur.execute("""SELECT sum(electors) FROM (
                        SELECT DISTINCT psnum, electors FROM pollresults
                        WHERE ednum = %(fed_num)s AND psnum = ANY(%(psnums)s)
                   ) AS rows;""",
                params);
    electors, = cur.fetchone()
    add_to_column(cur, fed_num, emrp_name, 'electors', electors)

    # Calculate nonvoters
    nonvotes = electors - sum((x for x in votetotals if x))
    add_to_column(cur, fed_num, emrp_name, 'nonvotes', nonvotes)

    # Commit changes
    cur.connection.commit()

def process_all_polls():
    """
    Map process_polls over all needed values from the shapefiles
    to get the cleaned data
    """
    cur = conn.cursor()
    cur.execute("""SELECT fed_num, emrp_name FROM pd_a;""")
    polls = cur.fetchall()
    cur.execute("""SELECT fed_num, emrp_name FROM pd_p;""")
    polls += cur.fetchall()
    print(len(polls))
    for fed_num, emrp_name in polls:
        process_poll(cur, fed_num, emrp_name)


