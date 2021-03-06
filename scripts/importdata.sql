-- Create the database first
-- e.g., createdb -E UTF-8 electoralmap

-- Configure PostGIS extensions
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

-- Raw data from elections canada
CREATE TABLE pollresults ( ednum integer
                         , edname_en character varying(255)
                         , edname_fr character varying(255)
                         , psnum character varying(31)
                         , psname character varying(255)
                         , voidpoll boolean
                         , nopoll boolean
                         , mergewith character varying(31)
                         , rejected integer
                         , electors integer
                         , fname character varying(255)
                         , mname character varying(255)
                         , lname character varying(255)
                         , party_en character varying(255)
                         , party_fr character varying(255)
                         , incumbent boolean
                         , elected boolean
                         , votes integer
                         );

CREATE INDEX pollresults_ednum_idx ON pollresults (ednum varchar_pattern_ops);
CREATE INDEX pollresults_psnum_idx ON pollresults (psnum varchar_pattern_ops);
CREATE INDEX pollresults_mergewith_idx ON pollresults (mergewith varchar_pattern_ops);

\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau10007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau11001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau11002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau11003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau11004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau12011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau13010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24015.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24016.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24017.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24018.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24019.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24020.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24021.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24022.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24023.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24024.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24025.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24026.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24027.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24028.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24029.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24030.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24031.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24032.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24033.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24034.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24035.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24036.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24037.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24038.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24039.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24040.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24041.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24042.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24043.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24044.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24045.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24046.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24047.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24048.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24049.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24050.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24051.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24052.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24053.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24054.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24055.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24056.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24057.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24058.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24059.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24060.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24061.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24062.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24063.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24064.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24065.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24066.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24067.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24068.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24069.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24070.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24071.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24072.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24073.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24074.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau24075.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35015.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35016.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35017.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35018.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35019.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35020.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35021.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35022.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35023.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35024.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35025.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35026.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35027.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35028.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35029.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35030.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35031.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35032.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35033.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35034.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35035.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35036.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35037.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35038.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35039.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35040.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35041.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35042.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35043.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35044.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35045.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35046.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35047.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35048.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35049.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35050.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35051.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35052.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35053.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35054.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35055.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35056.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35057.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35058.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35059.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35060.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35061.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35062.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35063.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35064.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35065.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35066.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35067.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35068.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35069.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35070.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35071.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35072.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35073.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35074.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35075.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35076.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35077.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35078.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35079.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35080.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35081.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35082.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35083.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35084.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35085.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35086.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35087.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35088.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35089.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35090.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35091.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35092.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35093.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35094.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35095.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35096.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35097.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35098.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35099.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35100.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35101.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35102.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35103.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35104.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35105.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau35106.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau46014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau47014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48015.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48016.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48017.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48018.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48019.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48020.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48021.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48022.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48023.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48024.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48025.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48026.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48027.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau48028.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59002.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59003.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59004.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59005.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59006.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59007.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59008.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59009.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59010.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59011.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59012.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59013.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59014.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59015.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59016.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59017.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59018.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59019.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59020.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59021.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59022.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59023.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59024.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59025.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59026.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59027.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59028.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59029.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59030.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59031.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59032.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59033.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59034.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59035.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau59036.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau60001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau61001.csv' CSV HEADER;
\COPY pollresults FROM 'data/pollresults/pollresults_resultatsbureau62001.csv' CSV HEADER;

-- Remove spaces from poll numbers, avoiding normalization issues
UPDATE pollresults SET psnum     = trim(both ' ' from psnum)
                     , mergewith = trim(both ' ' from mergewith);
