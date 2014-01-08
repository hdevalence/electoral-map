#!/usr/bin/bash

# exports table given as $1 to file $2.

ogr2ogr -f "GeoJSON" $2 -s_srs EPSG:4269 -t_srs EPSG:4326 PG:"host=localhost dbname=electoralmap" $1
