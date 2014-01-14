#!/usr/bin/bash

# $1 - output directory

for fed_num in $(psql -d electoralmap -c "COPY (SELECT DISTINCT ednum FROM pollresults ORDER BY ednum) TO STDOUT"); do
    echo "Creating $1/$fed_num.geojson"
    # Export data for the given fed_num
    # N.B. EPSG:3347 -- stats canada coordinate system
    ogr2ogr -where "fed_num = $fed_num" -s_srs EPSG:3347 -t_srs EPSG:4326 \
        -f "GeoJSON" "$1/$fed_num.geojson" \
        PG:"host=localhost dbname=electoralmap" merged_pd_a
done
