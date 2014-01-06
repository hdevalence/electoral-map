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
    cur.execute("""CREATE TABLE cleanpoll ( fednum integer
                                          , emrp_name character varying(31)
                                          , pollname  character varying(255)
                                          , valid boolean DEFAULT False
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

def add_votes(cur, fednum, emrp_name, party, votes):
    """Updates cleanpoll vote totals."""
    if not votes:
        return
    # SQL injection: use party as column name
    query = "UPDATE cleanpoll SET " + party + " = " + party + " + %(votes)s WHERE fednum = %(fednum)s AND emrp_name = %(emrp_name)s;"
    cur.execute(query,
                { 'fednum' : fednum
                , 'party' : party
                , 'votes' : votes
                , 'emrp_name' : emrp_name
                })

def get_psnums(cur, fednum, emrp_name):
    """
    Get all polling station numbers from pollresults which
    should be combined into the row for emrp_name.
    """
    cur.execute("""SELECT array_agg(DISTINCT psnum) FROM pollresults WHERE
                           ednum = %(fednum)s
                   AND NOT voidpoll
                   AND NOT nopoll
                   AND (   (   mergewith = ''
                           AND (psnum = %(psnum)s OR psnum LIKE %(psnum_letter)s)
                           )
                       OR  mergewith = %(psnum)s OR mergewith LIKE %(psnum_letter)s
                       );""",
                { 'psnum' : emrp_name
                , 'psnum_letter' : emrp_name + '_' # Matches, e.g., '26A'
                , 'fednum' : fednum
                })
    return cur.fetchone()[0]

def process_poll(cur, fednum, emrp_name):
    """
    Adds a new entry to the cleanpoll table for the specified poll.
    """
    # Create row
    cur.execute("INSERT INTO cleanpoll (fednum, emrp_name) VALUES (%s,%s)",
                (fednum, emrp_name))

    psnums = get_psnums(cur, fednum, emrp_name)
    # Map of party columns to search patterns
    parties = { 'libvotes' : '%Liberal%'
              , 'ndpvotes' : '%NDP%'
              , 'convotes' : '%Conservative%'
              , 'blqvotes' : '%Bloc%'
              , 'grnvotes' : '%Green%'
              }
    # For each party, calculate its vote total for all polls
    # merging into the given poll.
    for party, partypattern in parties.items():
        cur.execute("""SELECT sum(votes) FROM pollresults WHERE
                           ednum = %(fednum)s
                       AND psnum = ANY(%(psnums)s)
                       AND party_en LIKE %(partypattern)s;""",
                    { 'fednum' : fednum
                    , 'psnums' : psnums
                    , 'partypattern' : partypattern
                    })
        partyvotes, = cur.fetchone()
        add_votes(cur, fednum, emrp_name, party, partyvotes)
    # Find the number of votes for independent candidates.
    params = parties
    params['fednum'] = fednum
    params['psnums'] = psnums
    cur.execute("""SELECT sum(votes) FROM pollresults WHERE
                       ednum = %(fednum)s
                   AND psnum = ANY(%(psnums)s)
                   AND NOT (   party_en LIKE %(libvotes)s
                           OR  party_en LIKE %(convotes)s
                           OR  party_en LIKE %(ndpvotes)s
                           OR  party_en LIKE %(blqvotes)s
                           OR  party_en LIKE %(grnvotes)s
                           )
                   ;""", params)
    othervotes, = cur.fetchone()
    add_votes(cur, fednum, emrp_name, 'othvotes', othervotes)

