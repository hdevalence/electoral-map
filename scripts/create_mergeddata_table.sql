-- Create a table with merged polygons of area polls

CREATE TABLE cleaned_pd_a AS
SELECT ST_Multi(ST_Union(geom)) AS geom
     , fed_num
     , emrp_name
FROM pd_a
GROUP BY fed_num, emrp_name;

-- Update geometry
SELECT Populate_Geometry_Columns();

-- N.B. we add 0.1 to prevent div by zero on missing data
CREATE TABLE merged_pd_a AS
SELECT cleaned_pd_a.geom
     , cleanpoll.fed_num
     , cleanpoll.pollname
     , cleanpoll.libvotes / (cleanpoll.electors::float + 0.1) AS libvotes
     , cleanpoll.convotes / (cleanpoll.electors::float + 0.1) AS convotes
     , cleanpoll.ndpvotes / (cleanpoll.electors::float + 0.1) AS ndpvotes
     , cleanpoll.blqvotes / (cleanpoll.electors::float + 0.1) AS blqvotes
     , cleanpoll.grnvotes / (cleanpoll.electors::float + 0.1) AS grnvotes
     , cleanpoll.othvotes / (cleanpoll.electors::float + 0.1) AS othvotes
     , cleanpoll.nonvotes / (cleanpoll.electors::float + 0.1) AS nonvotes
FROM cleaned_pd_a LEFT OUTER JOIN cleanpoll ON
    (   cleaned_pd_a.fed_num = cleanpoll.fed_num
    AND cleaned_pd_a.emrp_name = cleanpoll.emrp_name
    );

-- Update geometry
SELECT Populate_Geometry_Columns();
