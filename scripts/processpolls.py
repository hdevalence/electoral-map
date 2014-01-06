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

def process_poll(cur, fednum, emrp_name):
    """
    Adds a new entry to the cleanpoll table for the specified poll.
    """
    cur.execute("INSERT INTO cleanpoll (fednum, emrp_name) VALUES (%s,%s)",
                (fednum, emrp_name))
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
                       AND NOT voidpoll
                       AND NOT nopoll
                       AND (   (   mergewith = ''
                               AND (psnum = %(psnum)s OR psnum LIKE %(psnum_letter)s)
                               )
                           OR  mergewith = %(psnum)s OR mergewith LIKE %(psnum_letter)s
                           )
                       AND party_en LIKE %(partypattern)s;""",
                    { 'fednum' : fednum
                    , 'psnum' : emrp_name
                    , 'psnum_letter' : emrp_name + '_'
                    , 'partypattern' : partypattern
                    })
        partyvotes, = cur.fetchone()
        add_votes(cur, fednum, emrp_name, party, partyvotes)
    # This duplication is quite ugly.
    # Also, it would be best to build the query string from the parties dict.
    # But psycopg does its own query building and it's a mess.
    # Find the number of votes for independent candidates.
    params = { 'fednum' : fednum
             , 'psnum' : emrp_name
             , 'psnum_letter' : emrp_name + '_'
             }
    params.update(parties)
    cur.execute("""SELECT sum(votes) FROM pollresults WHERE
                       ednum = %(fednum)s
                   AND NOT voidpoll
                   AND NOT nopoll
                   AND (   (   mergewith = ''
                           AND (psnum = %(psnum)s OR psnum LIKE %(psnum_letter)s)
                           )
                       OR  mergewith = %(psnum)s OR mergewith LIKE %(psnum_letter)s
                       )
                   AND NOT (   party_en LIKE %(libvotes)s
                           OR  party_en LIKE %(convotes)s
                           OR  party_en LIKE %(ndpvotes)s
                           OR  party_en LIKE %(blqvotes)s
                           OR  party_en LIKE %(grnvotes)s
                           )
                   ;""", params)
    othervotes, = cur.fetchone()
    add_votes(cur, fednum, emrp_name, 'othvotes', othervotes)

