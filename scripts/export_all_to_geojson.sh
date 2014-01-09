#!/usr/bin/bash

for fed_num in $(psql -d electoralmap -c "COPY (SELECT DISTINCT ednum FROM pollresults ORDER BY ednum) TO STDOUT"); do
    echo $fed_num
    ogr2ogr -where "fed_num = $fed_num" -f "GeoJSON" "$fed_num.geojson" -s_srs EPSG:3347 -t_srs EPSG:4326 PG:"host=localhost dbname=electoralmap" merged_pd_a
done
