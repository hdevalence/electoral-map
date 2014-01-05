#!/usr/bin/bash
pd_a_file="tmp-$(date -Ins)-pd_a.sql"
shp2pgsql -W LATIN1 -D -I data/shapefiles/pd_a.simp.shp pd_a electoralmap > $pd_a_file
psql electoralmap < $pd_a_file
rm -v $pd_a_file
pd_p_file="tmp-$(date -Ins)-pd_p.sql"
shp2pgsql -W LATIN1 -D -I data/shapefiles/pd_p.shp pd_p electoralmap > $pd_p_file
psql electoralmap < $pd_p_file
rm -v $pd_p_file
