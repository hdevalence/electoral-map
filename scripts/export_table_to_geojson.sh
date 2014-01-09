#!/usr/bin/bash

# exports data for riding with fed_num $1 to file $2

ogr2ogr -where "fed_num = $1" -f "GeoJSON" $2 -s_srs EPSG:3347 -t_srs EPSG:4326 PG:"host=localhost dbname=electoralmap" merged_pd_a
