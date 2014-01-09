#!/usr/bin/python3

"""
Compute approximate percentiles for poll data.

We want to have a legend that's roughly scaled to the percentiles of the data,
so we compute that using this script.
"""

import psycopg2
from scipy.stats import scoreatpercentile

conn = psycopg2.connect("dbname=electoralmap")
cur = conn.cursor()

votes = []
cur.execute("""SELECT libvotes::float / (electors::float +0.1) FROM cleanpoll;""")
votes += [x for x, in cur.fetchall()]
cur.execute("""SELECT convotes::float / (electors::float +0.1) FROM cleanpoll;""")
votes += [x for x, in cur.fetchall()]
cur.execute("""SELECT ndpvotes::float / (electors::float +0.1) FROM cleanpoll;""")
votes += [x for x, in cur.fetchall()]
cur.execute("""SELECT blqvotes::float / (electors::float +0.1) FROM cleanpoll WHERE blqvotes > 0;""")
votes += [x for x, in cur.fetchall()]
cur.execute("""SELECT nonvotes::float / (electors::float +0.1) FROM cleanpoll WHERE nonvotes > 0;""")
votes += [x for x, in cur.fetchall()]
# We don't count the Green party since they'll skew the data

# This gives a conditional on which 9-ile the data is in
conditions = ["val < %f ? colors[%d] :" % (scoreatpercentile(votes, 11.1*(i+1)), i)
              for i in range(9)]

for cond in conditions:
    print(cond)


