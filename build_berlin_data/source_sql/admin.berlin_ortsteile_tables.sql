SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'admin.berlin_ortsteile_tables.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample (without'';''): .read ../source_sql/admin.berlin_ortsteile_tables.sql UTF8';
---
-- BEGIN/COMMIT done in script
-- the created data of this script [read_geodb_berlin_tables.sql] has been incorperated into ''admin.berlin_ortsteile_tables.sql'' and should no longer be used.
-- .read ../source_sql/read_geodb_berlin_tables.sql UTF8
---
SELECT DateTime('now'),'CREATEing bezirke_stadt with PRIMARY KEY. [bezirke belongs_to stadt]';
BEGIN;
CREATE TABLE bezirke_stadt (
 id_admin INTEGER,
 name TEXT,
 admin_level TEXT  DEFAULT '9',
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01',
 changed_type TEXT  DEFAULT '2',
 -- 1=name,2=belongs,3=borders
 id_belongs_to INTEGER DEFAULT 0,
 belongs_to TEXT  DEFAULT '',
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
--
INSERT INTO bezirke_stadt VALUES(1902010100,'Mitte (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010100,'Mitte','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010200,'Tiergarten (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010200,'Tiergarten','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010300,'Wedding (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010300,'Wedding','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010400,'Prenzlauer Tor','9','1920-10-01','1921-09-26','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010400,'Prenzlauer Berg (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010400,'Prenzlauer Berg','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010400,'Prenzlauer Berg','9','1921-09-27','2000-12-31','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010500,'Friedrichshain','9','1920-10-01','1933-09-09','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010500,'Friedrichshain (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010500,'Friedrichshain','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010500,'Horst-Wessel-Stadt','9','1933-09-10','1945-05-07','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010500,'Friedrichshain','9','1945-05-08','2000-12-31','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010600,'Hallesches Tor','9','1920-10-01','1921-09-26','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010600,'Kreuzberg (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010600,'Kreuzberg','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010600,'Kreuzberg','9','1921-09-27','2000-12-31','1',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010700,'Charlottenburg (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010700,'Charlottenburg','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010800,'Spandau (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010800,'Spandau','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010900,'Wilmersdorf (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902010900,'Wilmersdorf','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011000,'Zehlendorf (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011000,'Zehlendorf','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011100,'Schöneberg (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011100,'Schöneberg','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011200,'Steglitz (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011200,'Steglitz','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011300,'Tempelhof (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011300,'Tempelhof','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011400,'Neukölln (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011400,'Neukölln','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011500,'Treptow (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011500,'Treptow','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011600,'Köpenick (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011600,'Köpenick','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011700,'Lichtenberg (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011700,'Lichtenberg','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011800,'Weißensee (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011800,'Weißensee','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011900,'Pankow (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902011900,'Pankow','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902012000,'Reinickendorf (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1938-03-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902012000,'Reinickendorf','9','1920-10-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902012100,'Marzahn','9','1979-01-05','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902012200,'Hohenschönhausen','9','1985-01-01','2000-12-31','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1902012300,'Hellersdorf','9','1986-06-01','2000-12-31','2',1911000001,'Berlin');
-- neue Bezirke ab '2001-01-01'
INSERT INTO bezirke_stadt VALUES(1911000100,'Mitte','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000100,'Mitte (Ortsteil Hansaviertel - 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000200,'Friedrichshain-Kreuzberg','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000200,'Friedrichshain-Kreuzberg (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000300,'Pankow','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000300,'Pankow (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000400,'Charlottenburg-Wilmersdorf','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000400,'Charlottenburg-Wilmersdorf (Bezirksreform 2001-01-01)','9','2001-01-01','2004-09-29','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES('1911000400','Charlottenburg-Wilmersdorf (Ortsteile Westend,Charlottenburg-Nord,Halensee - 2004-09-30)','9','2004-09-30','3000-01-01','3','1911000001','Berlin');
INSERT INTO bezirke_stadt VALUES(1911000500,'Spandau','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000500,'Spandau (Ortsteile Falkenhagener Feld,Siemensstadt - 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000600,'Steglitz-Zehlendorf','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000600,'Steglitz-Zehlendorf (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000700,'Tempelhof-Schöneberg','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000700,'Tempelhof-Schöneberg (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000800,'Neukölln','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000800,'Neukölln (Ortsteil Gropiusstadt - 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000900,'Treptow-Köpenick','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911000900,'Treptow-Köpenick (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911001000,'Marzahn-Hellersdorf','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911001000,'Marzahn-Hellersdorf (Bezirksreform 2001-01-01)','9','2001-01-01','3000-01-01','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911001100,'Lichtenberg','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911001100,'Lichtenberg (Ortsteile Neu-Hohenschönhausen,Alt-Hohenschönhausen,Fennpfuhl - 2001-01-01)','9','2001-01-01','2001-12-31','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES('1911001100','Lichtenberg (Ortsteil Rummelsburg - 2002-01-01)','9','2002-01-01','3000-01-01','3','1911000001','Berlin');
INSERT INTO bezirke_stadt VALUES(1911001200,'Reinickendorf','9','2001-01-01','3000-01-01','2',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES(1911001200,'Reinickendorf (Bezirksreform 2001-01-01)','9','2001-01-01','2012-05-18','3',1911000001,'Berlin');
INSERT INTO bezirke_stadt VALUES('1911001200','Reinickendorf (Ortsteil Borsigwalde - 2012-05-18)','9','2012-05-18','3000-01-01','3','1911000001','Berlin');
---
SELECT DateTime('now'),'-I-> checking for unique entries in ''bezirke_stadt'' - result should be empty:';
SELECT COUNT(*),* FROM bezirke_stadt GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
SELECT DateTime('now'),'-W-> if message came they must be resoved';
COMMIT;
---
SELECT DateTime('now'),'CREATEing ortsteile_bezirke_work (building data for final table). ';
BEGIN;
CREATE TABLE ortsteile_bezirke_work(
 id_admin INT,
 name TEXT,
 admin_level,
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since NUM,
 valid_until NUM,
 changed_type,
 -- 1=name,2=belongs,3=borders
 id_belongs_to INT,
 belongs_to TEXT
);
---
INSERT INTO ortsteile_bezirke_work VALUES(1911000101,'Mitte','10','1920-10-01','2000-12-31','2',1902010100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000101,'Mitte','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000101,'Mitte (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000102,'Moabit','10','1920-10-01','2000-12-31','2',1902010200,'Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES(1911000102,'Moabit','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000102,'Moabit (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010200,'Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES(1911000103,'Hansaviertel','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000104,'Tiergarten','10','1920-10-01','2000-12-31','2',1902010200,'Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES(1911000104,'Tiergarten','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000104,'Tiergarten (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010200,'Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES(1911000105,'Wedding','10','1920-10-01','2000-12-31','2',1902010300,'Wedding');
INSERT INTO ortsteile_bezirke_work VALUES(1911000105,'Wedding','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000105,'Wedding (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010300,'Wedding');
INSERT INTO ortsteile_bezirke_work VALUES(1911000106,'Gesundbrunnen','10','1920-10-01','2000-12-31','2',1902010300,'Wedding');
INSERT INTO ortsteile_bezirke_work VALUES(1911000106,'Gesundbrunnen','10','2001-01-01','3000-01-01','2',1911000100,'Mitte');
INSERT INTO ortsteile_bezirke_work VALUES(1911000106,'Gesundbrunnen (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010300,'Wedding');
INSERT INTO ortsteile_bezirke_work VALUES(1911000201,'Friedrichshain','10','1920-10-01','2000-12-31','2',1902010500,'Friedrichshain');
INSERT INTO ortsteile_bezirke_work VALUES(1911000201,'Friedrichshain','10','2001-01-01','3000-01-01','2',1911000200,'Friedrichshain-Kreuzberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000201,'Friedrichshain (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010500,'Friedrichshain');
INSERT INTO ortsteile_bezirke_work VALUES(1911000202,'Kreuzberg','10','1920-10-01','2000-12-31','2',1902010600,'Kreuzberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000202,'Kreuzberg','10','2001-01-01','3000-01-01','2',1911000200,'Friedrichshain-Kreuzberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000202,'Kreuzberg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010600,'Kreuzberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000301,'Prenzlauer Berg','10','1920-10-01','2000-12-31','2',1902010400,'Prenzlauer Berg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000301,'Prenzlauer Berg','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000301,'Prenzlauer Berg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010400,'Prenzlauer Berg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000302,'Weißensee','10','1920-10-01','2000-12-31','2',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000302,'Weißensee','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000302,'Weißensee (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000303,'Blankenburg','10','1989-09-01','2000-12-31','2',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000303,'Blankenburg','10','1920-10-01','1989-08-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000303,'Blankenburg','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000303,'Blankenburg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000304,'Heinersdorf','10','1989-09-01','2000-12-31','2',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000304,'Heinersdorf','10','1920-10-01','1989-08-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000304,'Heinersdorf','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000304,'Heinersdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000305,'Karow','10','1989-09-01','2000-12-31','2',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000305,'Karow','10','1920-10-01','1989-08-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000305,'Karow','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000305,'Karow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000306,'Stadtrandsiedlung Malchow','10','1920-10-01','2000-12-31','2',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000306,'Stadtrandsiedlung Malchow','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000306,'Stadtrandsiedlung Malchow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011800,'Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES(1911000307,'Pankow','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000307,'Pankow','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000307,'Pankow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000308,'Blankenfelde','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000308,'Blankenfelde','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000308,'Blankenfelde (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000309,'Buch','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000309,'Buch','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000309,'Buch (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000310,'Französisch Buchholz','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000310,'Französisch Buchholz','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000310,'Französisch Buchholz (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000311,'Niederschönhausen','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000311,'Niederschönhausen','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000311,'Niederschönhausen (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000312,'Rosenthal','10','1920-10-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000312,'Rosenthal','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000312,'Rosenthal (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000313,'Wilhelmsruh','10','1938-04-01','2000-12-31','2',1902011900,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000313,'Wilhelmsruh','10','1920-10-01','1938-03-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000313,'Wilhelmsruh','10','2001-01-01','3000-01-01','2',1911000300,'Pankow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000313,'Wilhelmsruh (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000401,'Charlottenburg','10','1920-10-01','2000-12-31','2',1902010700,'Charlottenburg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000401,'Charlottenburg','10','2001-01-01','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000401,'Charlottenburg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010700,'Charlottenburg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000402,'Wilmersdorf','10','1920-10-01','2000-12-31','2',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000402,'Wilmersdorf','10','2001-01-01','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000402,'Wilmersdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000403,'Schmargendorf','10','1920-10-01','2000-12-31','2',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000403,'Schmargendorf','10','2001-01-01','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000403,'Schmargendorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000404,'Grunewald','10','1920-10-01','2000-12-31','2',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000404,'Grunewald','10','2001-01-01','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000404,'Grunewald (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010900,'Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000405,'Westend','10','2004-09-30','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000406,'Charlottenburg-Nord','10','2004-09-30','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000407,'Halensee','10','2004-09-30','3000-01-01','2',1911000400,'Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000501,'Spandau','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000501,'Spandau','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000501,'Spandau (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000502,'Haselhorst','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000502,'Haselhorst','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000502,'Haselhorst (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000503,'Siemensstadt','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000504,'Staaken','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000504,'Staaken','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000504,'Staaken (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1945-08-30','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000505,'Gatow','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000505,'Gatow','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000505,'Gatow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000506,'Kladow','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000506,'Kladow','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000506,'Kladow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000507,'Hakenfelde','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000507,'Hakenfelde','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000507,'Hakenfelde (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000508,'Falkenhagener Feld','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000509,'Wilhelmstadt','10','1920-10-01','2000-12-31','2',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000509,'Wilhelmstadt','10','2001-01-01','3000-01-01','2',1911000500,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000509,'Wilhelmstadt (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902010800,'Spandau');
INSERT INTO ortsteile_bezirke_work VALUES(1911000601,'Steglitz','10','1920-10-01','2000-12-31','2',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000601,'Steglitz','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000601,'Steglitz (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000602,'Lichterfelde','10','1920-10-01','2000-12-31','2',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000602,'Lichterfelde','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000602,'Lichterfelde (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000603,'Lankwitz','10','1920-10-01','2000-12-31','2',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000603,'Lankwitz','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000603,'Lankwitz (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011200,'Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES(1911000604,'Zehlendorf','10','1920-10-01','2000-12-31','2',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000604,'Zehlendorf','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000604,'Zehlendorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000605,'Dahlem','10','1920-10-01','2000-12-31','2',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000605,'Dahlem','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000605,'Dahlem (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000606,'Nikolassee','10','1920-10-01','2000-12-31','2',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000606,'Nikolassee','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000606,'Nikolassee (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000607,'Wannsee','10','1920-10-01','2000-12-31','2',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000607,'Wannsee','10','2001-01-01','3000-01-01','2',1911000600,'Steglitz-Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000607,'Wannsee (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011000,'Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911000701,'Schöneberg','10','1920-10-01','2000-12-31','2',1902011100,'Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000701,'Schöneberg','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000701,'Schöneberg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011100,'Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000702,'Friedenau','10','1920-10-01','2000-12-31','2',1902011100,'Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000702,'Friedenau','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000702,'Friedenau (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011100,'Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000703,'Tempelhof','10','1920-10-01','2000-12-31','2',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000703,'Tempelhof','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000703,'Tempelhof (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000704,'Mariendorf','10','1920-10-01','2000-12-31','2',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000704,'Mariendorf','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000704,'Mariendorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000705,'Marienfelde','10','1920-10-01','2000-12-31','2',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000705,'Marienfelde','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000705,'Marienfelde (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000706,'Lichtenrade','10','1920-10-01','2000-12-31','2',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000706,'Lichtenrade','10','2001-01-01','3000-01-01','2',1911000700,'Tempelhof-Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911000706,'Lichtenrade (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011300,'Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES(1911000801,'Neukölln','10','1920-10-01','2000-12-31','2',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000801,'Neukölln','10','2001-01-01','3000-01-01','2',1911000800,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000801,'Neukölln (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000802,'Britz','10','1920-10-01','2000-12-31','2',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000802,'Britz','10','2001-01-01','3000-01-01','2',1911000800,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000802,'Britz (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000803,'Buckow','10','1920-10-01','2000-12-31','2',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000803,'Buckow','10','2001-01-01','3000-01-01','2',1911000800,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000803,'Buckow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000804,'Rudow','10','1920-10-01','2000-12-31','2',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000804,'Rudow','10','2001-01-01','3000-01-01','2',1911000800,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000804,'Rudow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011400,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000805,'Gropiusstadt','10','2001-01-01','3000-01-01','2',1911000800,'Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES(1911000901,'Treptow','10','1920-10-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000901,'Alt-Treptow','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000901,'Treptow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000902,'Plänterwald','10','1997-12-18','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000902,'Plänterwald','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000903,'Baumschulenweg','10','1945-08-31','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000903,'Baumschulenweg','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000904,'Johannisthal','10','1920-10-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000904,'Johannisthal','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000904,'Johannisthal (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000905,'Niederschöneweide','10','1920-10-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000905,'Niederschöneweide','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000905,'Niederschöneweide (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000906,'Altglienicke','10','1920-10-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000906,'Altglienicke','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000906,'Altglienicke (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000907,'Adlershof','10','1920-10-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000907,'Adlershof','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000907,'Adlershof (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000908,'Bohnsdorf','10','1938-04-01','2000-12-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000908,'Bohnsdorf','10','1920-10-01','1938-03-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000908,'Bohnsdorf','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000908,'Bohnsdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000909,'Oberschöneweide','10','1920-10-01','1938-03-31','2',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000909,'Oberschöneweide','10','1938-04-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000909,'Oberschöneweide','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000909,'Oberschöneweide (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011500,'Treptow');
INSERT INTO ortsteile_bezirke_work VALUES(1911000910,'Köpenick','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000910,'Köpenick','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000910,'Köpenick (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000911,'Friedrichshagen','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000911,'Friedrichshagen','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000911,'Friedrichshagen (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000912,'Rahnsdorf','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000912,'Rahnsdorf','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000912,'Rahnsdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000913,'Grünau','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000913,'Grünau','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000913,'Grünau (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000914,'Müggelheim','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000914,'Müggelheim','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000914,'Müggelheim (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000915,'Schmöckwitz','10','1920-10-01','2000-12-31','2',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000915,'Schmöckwitz','10','2001-01-01','3000-01-01','2',1911000900,'Treptow-Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911000915,'Schmöckwitz (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011600,'Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES(1911001001,'Marzahn','10','1979-01-05','2000-12-31','2',1902012100,'Marzahn');
INSERT INTO ortsteile_bezirke_work VALUES(1911001001,'Marzahn','10','2001-01-01','3000-01-01','2',1911001000,'Marzahn-Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001002,'Biesdorf','10','1920-10-01','1979-01-04','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001002,'Biesdorf','10','1979-01-05','2000-12-31','2',1902012100,'Marzahn');
INSERT INTO ortsteile_bezirke_work VALUES(1911001002,'Biesdorf','10','2001-01-01','3000-01-01','2',1911001000,'Marzahn-Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001002,'Biesdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001003,'Kaulsdorf','10','1920-10-01','1979-01-04','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001003,'Kaulsdorf','10','1979-01-05','1986-05-31','2',1902012100,'Marzahn');
INSERT INTO ortsteile_bezirke_work VALUES(1911001003,'Kaulsdorf','10','1986-06-01','2000-12-31','2',1902012300,'Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001003,'Kaulsdorf','10','2001-01-01','3000-01-01','2',1911001000,'Marzahn-Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001003,'Kaulsdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001004,'Mahlsdorf','10','1920-10-01','1979-01-04','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001004,'Mahlsdorf','10','1979-01-05','1986-05-31','2',1902012100,'Marzahn');
INSERT INTO ortsteile_bezirke_work VALUES(1911001004,'Mahlsdorf','10','1986-06-01','2000-12-31','2',1902012300,'Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001004,'Mahlsdorf','10','2001-01-01','3000-01-01','2',1911001000,'Marzahn-Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001004,'Mahlsdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001005,'Hellersdorf','10','1920-10-01','1979-01-04','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001005,'Hellersdorf','10','1979-01-05','1986-05-31','2',1902012100,'Marzahn');
INSERT INTO ortsteile_bezirke_work VALUES(1911001005,'Hellersdorf','10','1986-06-01','2000-12-31','2',1902012300,'Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001005,'Hellersdorf','10','2001-01-01','3000-01-01','2',1911001000,'Marzahn-Hellersdorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001005,'Hellersdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001101,'Friedrichsfelde','10','1920-10-01','2000-12-31','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001101,'Friedrichsfelde','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001101,'Friedrichsfelde (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001102,'Karlshorst','10','1920-10-01','2000-12-31','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001102,'Karlshorst','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001102,'Karlshorst (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001103,'Lichtenberg','10','1920-10-01','2000-12-31','2',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001103,'Lichtenberg','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001103,'Lichtenberg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902011700,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001104,'Falkenberg','10','1920-10-01','2000-12-31','2',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001104,'Falkenberg','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001104,'Falkenberg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001105,'Hohenschönhausen','10','1920-10-01','2000-12-31','2',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001105,'Hohenschönhausen (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001106,'Malchow','10','1920-10-01','2000-12-31','2',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001106,'Malchow','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001106,'Malchow (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001107,'Wartenberg','10','1920-10-01','2000-12-31','2',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001107,'Wartenberg','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001107,'Wartenberg (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012200,'Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES(1911001109,'Neu-Hohenschönhausen','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001110,'Alt-Hohenschönhausen','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001111,'Fennpfuhl','10','2001-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001112,'Rummelsburg','10','2002-01-01','3000-01-01','2',1911001100,'Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES(1911001201,'Reinickendorf','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001201,'Reinickendorf','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001201,'Reinickendorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001202,'Tegel','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001202,'Tegel','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001202,'Tegel (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001203,'Konradshöhe','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001203,'Konradshöhe','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001203,'Konradshöhe (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1988-06-30','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001204,'Heiligensee','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001204,'Heiligensee','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001204,'Heiligensee (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001205,'Frohnau','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001205,'Frohnau','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001205,'Frohnau (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001206,'Hermsdorf','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001206,'Hermsdorf','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001206,'Hermsdorf (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001207,'Waidmannslust','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001207,'Waidmannslust','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001207,'Waidmannslust (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001208,'Lübars','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001208,'Lübars','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001208,'Lübars (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001209,'Wittenau','10','1920-10-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001209,'Wittenau','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001209,'Wittenau (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1938-03-31','3',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001210,'Wilhelmsruhe (Märkisches Viertel)','10','1938-04-01','2000-12-31','2',1902012000,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001210,'Märkisches Viertel','10','2001-01-01','3000-01-01','2',1911001200,'Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES(1911001211,'Borsigwalde','10','2012-05-18','3000-01-01','2',1911001200,'Reinickendorf');
---
COMMIT;
BEGIN;
---
SELECT DateTime('now'),'Creating Border changed entries [Ortsteile].';
---
---
-- Gebietsaustausch
---
-- 1928-11-30 1938-03-31 (Eingemeindung Düppel - 1928-11-30)
---
UPDATE ortsteile_bezirke_work SET valid_until='1928-11-29'
WHERE
(
 (valid_until='1938-03-31') AND
 (id_admin IN (1902010100,1911000604,1911000606,1911000607)) AND
 (changed_type='3')
);
--
INSERT INTO ortsteile_bezirke_work VALUES('1902011000','Zehlendorf (Eingemeindung Düppel - 1928-11-30)','9','1928-11-30','1938-03-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000604','Zehlendorf (Eingemeindung Düppel - 1928-11-30)','10','1928-11-30','1938-03-31','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000606','Nikolassee (Eingemeindung Düppel - 1928-11-30)','10','1928-11-30','1938-03-31','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000607','Wannsee (Eingemeindung Düppel - 1928-11-30)','10','1928-11-30','1938-03-31','3','1902011000','Zehlendorf');
---
-- 1938-04-01 1945-08-30  (Gebietsreform - 1938-04-01)
-- TODO 20140331: check if all of these Ortsteile are really needed - most of them have changed
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010100','Mitte (Gebietsreform - 1938-04-01)','9','1938-04-01','1988-06-30','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000101','Mitte (Gebietsreform - 1938-04-01)','10','1938-04-01','1988-06-30','3','1902010100','Mitte');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010200','Tiergarten (Gebietsreform - 1938-04-01)','9','1938-04-01','1988-06-30','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000102','Moabit (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010200','Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES('1911000104','Tiergarten (Gebietsreform - 1938-04-01)','10','1938-04-01','1988-06-30','3','1902010200','Tiergarten');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010300','Wedding (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000105','Wedding (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010300','Wedding');
INSERT INTO ortsteile_bezirke_work VALUES('1911000106','Gesundbrunnen (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010300','Wedding');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010400','Prenzlauer Berg (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000301','Prenzlauer Berg (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010400','Prenzlauer Berg');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010500','Friedrichshain (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000201','Friedrichshain (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010500','Friedrichshain');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010600','Kreuzberg (Gebietsreform - 1938-04-01)','9','1938-04-01','1988-06-30','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000202','Kreuzberg (Gebietsreform - 1938-04-01)','10','1938-04-01','1988-06-30','3','1902010600','Kreuzberg');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010700','Charlottenburg (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000401','Charlottenburg (Gebietsreform - 1938-04-01)','10','1938-04-01','2004-09-29','3','1902010700','Charlottenburg');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Gebietsreform - 1938-04-01)','9','1938-04-01','1945-08-30','3','1911000001','Berlin') ;
--
-- SELECT id_admin||''','''||name FROM berlin_admin WHERE ((changed_type=2) AND (id_belongs_to='1902010800'));
INSERT INTO ortsteile_bezirke_work VALUES('1911000501','Spandau (Gebietsreform - 1938-04-01)','10','1938-04-01','2000-12-31','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000502','Haselhorst (Gebietsreform - 1938-04-01)','10','1938-04-01','2000-12-31','3','1902010800','Spandau');
-- '1911000504','Staaken' : no changes
INSERT INTO ortsteile_bezirke_work VALUES('1911000505','Gatow (Gebietsreform - 1938-04-01)','10','1938-04-01','1945-08-30','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000506','Kladow (Gebietsreform - 1938-04-01)','10','1938-04-01','1945-08-30','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000507','Hakenfelde (Gebietsreform - 1938-04-01)','10','1938-04-01','1972-06-02','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000509','Wilhelmstadt (Gebietsreform - 1938-04-01)','10','1938-04-01','1945-08-30','3','1902010800','Spandau');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010900','Wilmersdorf (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
-- SELECT id_admin||''','''||name FROM berlin_admin WHERE ((changed_type=2) AND (id_belongs_to='1902010900'));
INSERT INTO ortsteile_bezirke_work VALUES('1911000402','Wilmersdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','2004-09-29','3','1902010900','Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000403','Schmargendorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010900','Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000404','Grunewald (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902010900','Wilmersdorf');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011000','Zehlendorf (Gebietsreform - 1938-04-01)','9','1938-04-01','1972-06-02','3','1911000001','Berlin');
-- SELECT id_admin||''','''||name FROM berlin_admin WHERE ((changed_type=2) AND (id_belongs_to='1902011000'));
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000604','Zehlendorf (Gebietsreform - 1938-04-01)','10','1938-04-01','1972-06-02','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000605','Dahlem (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000606','Nikolassee (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000607','Wannsee (Gebietsreform - 1938-04-01)','10','1938-04-01','1972-06-02','3','1902011000','Zehlendorf');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011100','Schöneberg (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000701','Schöneberg (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011100','Schöneberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911000702','Friedenau (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011100','Schöneberg') ;
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011200','Steglitz (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000601','Steglitz (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011200','Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES('1911000602','Lichterfelde (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011200','Steglitz');
INSERT INTO ortsteile_bezirke_work VALUES('1911000603','Lankwitz (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011200','Steglitz');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011300','Tempelhof (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000703','Tempelhof (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011300','Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES('1911000704','Mariendorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011300','Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES('1911000705','Marienfelde (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011300','Tempelhof');
INSERT INTO ortsteile_bezirke_work VALUES('1911000706','Lichtenrade (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011300','Tempelhof');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011400','Neukölln (Gebietsreform - 1938-04-01)','9','1938-04-01','1972-06-02','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000801','Neukölln (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011400','Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES('1911000802','Britz (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011400','Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES('1911000803','Buckow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011400','Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES('1911000804','Rudow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011400','Neukölln');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011500','Treptow (Gebietsreform - 1938-04-01)','9','1938-04-01','1972-06-02','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000901','Treptow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011500','Treptow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000904','Johannisthal (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011500','Treptow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000905','Niederschöneweide (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011500','Treptow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000906','Altglienicke (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011500','Treptow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000907','Adlershof (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011500','Treptow');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011600','Köpenick (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000908','Bohnsdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000910','Köpenick (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000911','Friedrichshagen (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000912','Rahnsdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000913','Grünau (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000914','Müggelheim (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
INSERT INTO ortsteile_bezirke_work VALUES('1911000915','Schmöckwitz (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011600','Köpenick');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011700','Lichtenberg (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911001002','Biesdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001003','Kaulsdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001004','Mahlsdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001005','Hellersdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001101','Friedrichsfelde (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001102','Karlshorst (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011700','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911001103','Lichtenberg (Gebietsreform - 1938-04-01)','10','1938-04-01','2001-12-31','3','1902011700','Lichtenberg');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011800','Weißensee (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000302','Weißensee (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011800','Weißensee');
INSERT INTO ortsteile_bezirke_work VALUES('1911000306','Stadtrandsiedlung Malchow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011800','Weißensee');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902011900','Pankow (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin') ;
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000303','Blankenburg (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000304','Heinersdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000305','Karow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000307','Pankow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000308','Blankenfelde (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000309','Buch (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000310','Französisch Buchholz (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000311','Niederschönhausen (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
INSERT INTO ortsteile_bezirke_work VALUES('1911000312','Rosenthal (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902011900','Pankow');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902012000','Reinickendorf (Gebietsreform - 1938-04-01)','9','1938-04-01','1972-06-02','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911001201','Reinickendorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001202','Tegel (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
-- '1911001203','Konradshöhe' : no changes
INSERT INTO ortsteile_bezirke_work VALUES('1911001204','Heiligensee (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001205','Frohnau (Gebietsreform - 1938-04-01)','10','1938-04-01','1972-06-02','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001206','Hermsdorf (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001207','Waidmannslust (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001208','Lübars (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012000','Reinickendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001209','Wittenau (Gebietsreform - 1938-04-01)','10','1938-04-01','2012-05-17','3','1902012000','Reinickendorf');
---
INSERT INTO ortsteile_bezirke_work VALUES('1902012200','Hohenschönhausen (Gebietsreform - 1938-04-01)','9','1938-04-01','2001-12-31','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911001104','Falkenberg (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012200','Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES('1911001105','Hohenschönhausen (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012200','Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES('1911001106','Malchow (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012200','Hohenschönhausen');
INSERT INTO ortsteile_bezirke_work VALUES('1911001107','Wartenberg (Gebietsreform - 1938-04-01)','10','1938-04-01','3000-01-01','3','1902012200','Hohenschönhausen');
---
-- 1945-08-31 1972-06-02  (Gebietsaustausch - 1945-08-31)
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Gebietsaustausch - 1945-08-31)','9','1945-08-31','1972-06-03','3','1911000001','Berlin');
--
INSERT INTO ortsteile_bezirke_work VALUES('1911000504','Staaken (Gebietsaustausch - 1945-08-31)','10','1945-08-31','1990-10-02','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000505','Gatow (Gebietsaustausch - 1945-08-31)','10','1945-08-31','2000-12-31','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000506','Kladow (Gebietsaustausch - 1945-08-31)','10','1945-08-31','1988-06-30','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000509','Wilhelmstadt (Gebietsaustausch - 1945-08-31)','10','1945-08-31','1988-06-30','3','1902010800','Spandau');
---
-- 1972-06-03 1988-06-30 (Gebietsaustausch - 1972-06-03)
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Gebietsaustausch - 1972-06-03)','9','1972-06-03','1988-06-30','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000507','Hakenfelde (Gebietsaustausch - 1972-06-03)','10','1972-06-03','1988-06-30','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1902011000','Zehlendorf (Gebietsaustausch - 1972-06-03)','9','1972-06-03','1988-06-30','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000607','Wannsee (Gebietsaustausch - 1972-06-03)','10','1972-06-03','1988-06-30','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1902012000','Reinickendorf (Gebietsaustausch - 1972-06-03)','9','1972-06-03','1988-06-30','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911001205','Frohnau (Gebietsaustausch - 1972-06-03)','10','1972-06-03','3000-01-01','3','1902012000','Reinickendorf');
---
-- 1988-07-01 1990-10-02 (Gebietsaustausch - 1988-07-01)
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010100','Mitte (Gebietsaustausch - 1988-07-01)','9','1988-07-01','2000-12-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000101','Mitte (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010100','Mitte');
INSERT INTO ortsteile_bezirke_work VALUES('1902010300','Wedding (Gebietsaustausch - 1988-07-01)','9','1988-07-01','2000-12-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000105','Wedding (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010300','Wedding');
INSERT INTO ortsteile_bezirke_work VALUES('1911000202','Kreuzberg (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010600','Kreuzberg');
INSERT INTO ortsteile_bezirke_work VALUES('1902010200','Tiergarten (Gebietsreform - 1938-04-01)','9','1988-07-01','3000-01-01','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000104','Tiergarten (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010200','Tiergarten');
INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Gebietsaustausch - 1988-07-01)','9','1988-07-01','1990-10-02','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000507','Hakenfelde (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000506','Kladow (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000509','Wilhelmstadt (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1902011000','Zehlendorf (Gebietsaustausch - 1988-07-01)','9','1988-07-01','2000-12-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000607','Wannsee (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902011000','Zehlendorf');
INSERT INTO ortsteile_bezirke_work VALUES('1902012000','Reinickendorf (Gebietsaustausch - 1988-07-01)','9','1988-07-01','2000-12-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911001203','Konradshöhe (Gebietsaustausch - 1988-07-01)','10','1988-07-01','3000-01-01','3','1902012000','Reinickendorf');
---
-- 1990-10-03 2000-12-31 (Wiedervereinigung - 1990-10-03)
---
INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Wiedervereinigung - 1990-10-03)','9','1990-10-03','2002-12-31','3','1911000001','Berlin');
INSERT INTO ortsteile_bezirke_work VALUES('1911000504','Staaken (Wiedervereinigung - 1990-10-03)','10','1990-10-03','3000-01-01','3','1902010800','Spandau');
---
-- 2001-01-01 3000-01-01 (neue Ortsteile)
---
---
-- 2001-01-01 3001-01-01 (Bezirks reform - 2001-01-01)
---
SELECT DateTime('now'),'CREATEing ortsteile_bezirke_temp. [ortsteile belongs_to new bezirke]';
CREATE TABLE ortsteile_bezirke_temp AS
SELECT * FROM ortsteile_bezirke_work
WHERE changed_type=2 AND admin_level=10 AND valid_until='2000-12-31';
--
UPDATE ortsteile_bezirke_temp SET valid_since='2001-01-01',valid_until='3000-01-01';
--
UPDATE ortsteile_bezirke_temp SET id_admin='1911000100',belongs_to='Mitte'
WHERE id_admin LIKE '19110001%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000200 ',belongs_to='Friedrichshain-Kreuzberg'
WHERE id_admin LIKE '19110002%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000300',belongs_to='Pankow'
WHERE id_admin LIKE '19110003%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000400',belongs_to='Charlottenburg-Wilmersdorf'
WHERE id_admin LIKE '19110004%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000500',belongs_to='Spandau'
WHERE id_admin LIKE '19110005%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000600',belongs_to='Steglitz-Zehlendorf'
WHERE id_admin LIKE '19110006%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000700',belongs_to='Tempelhof-Schöneberg'
WHERE id_admin LIKE '19110007%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000800',belongs_to='Neukölln'
WHERE id_admin LIKE '19110008%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911000900',belongs_to='Treptow-Köpenick'
WHERE id_admin LIKE '19110009%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911001000',belongs_to='Marzahn-Hellersdorf'
WHERE id_admin LIKE '19110010%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911001100',belongs_to='Lichtenberg'
WHERE id_admin LIKE '19110011%';
UPDATE ortsteile_bezirke_temp SET id_admin='1911001200',belongs_to='Reinickendorf'
WHERE id_admin LIKE '19110012%';
--
-- SELECT * FROM berlin_admin WHERE ((changed_type = '3') AND (admin_level = '10') AND ((belongs_to >= 1911000100) AND (belongs_to <= 1911001299)));
SELECT DateTime('now'),'INSERTINGing ortsteile_bezirke_temp to ortsteile_bezirke_work. [ortsteile belongs_to new bezirke]';
INSERT INTO ortsteile_bezirke_work
SELECT
 id_admin,name,admin_level,valid_since,valid_until,changed_type,id_admin,belongs_to
FROM ortsteile_bezirke_temp
ORDER BY id_admin,changed_type,id_admin,valid_since;
DROP TABLE ortsteile_bezirke_temp;
--
---
-- INSERT INTO ortsteile_bezirke_work VALUES('1902010800','Spandau (Ortsteil Falkenhagener Feld - 2001-01-01)','9','2001-01-01','3000-01-01','3','1911000001','Berlin');
UPDATE ortsteile_bezirke_work SET valid_until='2001-12-31'
WHERE (id_admin LIKE '1911001100' AND valid_until='3000-01-01');
CREATE TABLE ortsteile_bezirke_temp AS
SELECT * FROM ortsteile_bezirke_work
WHERE
(
 (changed_type='2' AND admin_level='10' AND valid_since>='2000-12-31') AND
 (id_admin NOT IN (SELECT id_admin FROM ortsteile_bezirke_work WHERE changed_type='2' AND admin_level='10' AND valid_until ='2000-12-31'))
)
ORDER BY valid_since,id_admin;
UPDATE ortsteile_bezirke_temp SET changed_type='3';
INSERT INTO ortsteile_bezirke_work
SELECT
 id_admin,name,admin_level,valid_since,valid_until,changed_type,belongs_to,belongs_to
FROM ortsteile_bezirke_temp
ORDER BY id_admin,changed_type,belongs_to,valid_since;
DROP TABLE ortsteile_bezirke_temp;
---
-- add older Ortsteile effected by new Ortsteile (their borders have also changed)
---
INSERT INTO ortsteile_bezirke_work VALUES('1911000104','Tiergarten (Ortsteil Hansaviertel - 2001-01-01)','10','2001-01-01','3000-01-01','3','1911000100','Mitte');
INSERT INTO ortsteile_bezirke_work VALUES('1911000803','Buckow (Ortsteil Gropiusstadt - 2001-01-01)','10','2001-01-01','3000-01-01','3','1911000800','Neukölln');
INSERT INTO ortsteile_bezirke_work VALUES('1911001103','Lichtenberg (Ortsteil Fennpfuhl - 2001-01-01)','10','2001-01-01','3000-01-01','3','1911001100','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911000501','Spandau (Ortsteil Falkenhagener Feld - 2001-01-01)','10','2001-01-01','3000-01-01','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911000502','Haselhorst (Ortsteil Siemensstadt - 2001-01-01)','10','2001-01-01','3000-01-01','3','1902010800','Spandau');
INSERT INTO ortsteile_bezirke_work VALUES('1911001103','Lichtenberg (Ortsteil Rummelsburg - 1938-04-01)','10','2002-01-01','3000-01-01','3','1911001100','Lichtenberg');
INSERT INTO ortsteile_bezirke_work VALUES('1911000401','Charlottenburg (Ortsteile Westend,Charlottenburg-Nord - 2004-09-30)','10','2004-09-30','3000-01-01','3','1911000400','Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911000402','Wilmersdorf (Ortsteil Halensee - 2004-09-30)','10','2004-09-30','3000-01-01','3','1911000400','Charlottenburg-Wilmersdorf');
INSERT INTO ortsteile_bezirke_work VALUES('1911001209','Wittenau (Ortsteile Borsigwalde - 2012-05-18)','10','2012-05-18','3000-01-01','3','1902012000','Reinickendorf');
SELECT DateTime('now'),'DROPing ortsteile_bezirke_temp [ortsteile belongs_to new bezirke]';
---
COMMIT;
SELECT DateTime('now'),'-I-> checking for unique entries in ''ortsteile_bezirke_work'' - result should be empty:';
SELECT COUNT(*),* FROM ortsteile_bezirke_work GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
SELECT DateTime('now'),'-W-> if message came they must be resoved';
SELECT DateTime('now'),'CREATEing ortsteile_bezirke with PRIMARY KEY. [ortsteile belongs_to bezirke]';
BEGIN;
CREATE TABLE ortsteile_bezirke (
 id_admin INTEGER,
 name TEXT,
 admin_level TEXT  DEFAULT '10',
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01',
 changed_type TEXT  DEFAULT '2',
 -- 1=name,2=belongs,3=borders
 id_belongs_to INTEGER DEFAULT 0,
 belongs_to TEXT  DEFAULT '',
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type,belongs_to)
);
-- FOREIGN KEY(id_belongs_to,admin_level,valid_since,valid_until,changed_type) REFERENCES bezirke_stadt)
--
SELECT DateTime('now'),'INSERTINGing ortsteile_bezirke from ortsteile_bezirke_work. [final results]';
INSERT INTO ortsteile_bezirke
 SELECT * FROM ortsteile_bezirke_work ORDER BY id_admin,changed_type,id_admin,valid_since;
---
-- SELECT COUNT(*),* FROM ortsteile_bezirke_work GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
-- 2 1911000302 Weißensee (Gebietsreform - 1938-04-01) 10 1938-04-01 3000-01-01 3 1911000306Stadtrandsiedlung Malchow
DROP TABLE ortsteile_bezirke_work;
SELECT DateTime('now'),'DROPing ortsteile_bezirke_work [ortsteile belongs_to bezirke]';
---
COMMIT;
---
BEGIN;
CREATE TABLE berlin_admin (
 id_admin INTEGER,
 name TEXT,
 admin_level TEXT  DEFAULT '9',
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01',
 changed_type TEXT  DEFAULT '2',
 -- 1=name,2=belongs,3=borders
 id_belongs_to INTEGER DEFAULT 0,
 belongs_to TEXT  DEFAULT '',
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
CREATE TABLE berlin_admin_work (
 id_admin INTEGER,
 name TEXT,
 admin_level TEXT  DEFAULT '9',
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01',
 changed_type TEXT  DEFAULT '2',
 -- 1=name,2=belongs,3=borders
 id_belongs_to INTEGER DEFAULT 0,
 belongs_to TEXT  DEFAULT '',
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
---
SELECT DateTime('now'),'reading Berlin: Städte.';
INSERT INTO berlin_admin_work
SELECT * FROM berlin_stadt ORDER BY id_admin,valid_since,valid_until,changed_type;
SELECT DateTime('now'),'reading Berlin: Stadtteile.';
INSERT INTO berlin_admin_work
SELECT * FROM berlin_stadtteile ORDER BY id_admin,valid_since,valid_until,changed_type;
SELECT DateTime('now'),'reading Berlin: belongs_to.';
INSERT INTO berlin_admin_work
SELECT *
FROM bezirke_stadt
ORDER BY id_admin,valid_since,valid_until,changed_type;
SELECT DateTime('now'),'reading Berlin: Ortsteile.';
INSERT INTO berlin_admin_work
SELECT * FROM ortsteile_bezirke ORDER BY id_admin,admin_level,valid_since,valid_until,changed_type;
SELECT DateTime('now'),'-I-> checking for unique entries in ''berlin_admin_work'' - result should be empty:';
SELECT COUNT(*),* FROM berlin_admin_work GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
SELECT DateTime('now'),'-W-> if message came they must be resoved';
SELECT DateTime('now'),'combining with sort [Städte,Landgemeinden und Gutsbezirke sowie Ost/West und Sektoren].';
-- stadt, landgemeinde, gutsbezirke, sektoren, west/ost
INSERT INTO berlin_admin
 SELECT
  *
 FROM berlin_admin_work
 WHERE
 (
  (
   (admin_level IN (4)) OR
   ((admin_level IN (9)) AND (valid_until<='1920-09-30')) OR
   ((admin_level IN (10)) AND (valid_until<='1920-09-30') AND (id_belongs_to <>'1911000001'))
  ) AND
  (id_belongs_to IN (1902000000,1911000001,1911000002,1911000003,1902040000,1902060000,1902100000))
 )
 ORDER BY CAST(admin_level AS INT),id_admin,changed_type,id_belongs_to,valid_since;
SELECT DateTime('now'),'combining with sort [Bezirke].';
-- bezirke
INSERT INTO berlin_admin
 SELECT
  *
 FROM berlin_admin_work
 WHERE
 (
  (admin_level IN (9)) AND
  (
   (id_belongs_to NOT IN (1911000002,1911000003,1902040000,1902060000,1902100000))
  ) 
 )
 ORDER BY CAST(admin_level AS INT),id_admin,changed_type,id_belongs_to,valid_since;
SELECT DateTime('now'),'combining with sort [Stadtteile,Ortsteile].';
-- stadtteile,ortsteile
INSERT INTO berlin_admin
 SELECT
  *
 FROM berlin_admin_work
 WHERE
 (
  (
   ((admin_level IN (10)) AND (id_belongs_to ='1911000001')) OR
   ((admin_level IN (10)) AND (valid_since >= '1920-10-01'))
  ) AND
  (id_belongs_to NOT IN (1911000002,1911000003,1911000004,1911000005,1911000006,1911000007))
 )
 ORDER BY CAST(admin_level AS INT),id_admin,changed_type,id_belongs_to,valid_since;
SELECT DateTime('now'),'remove temp tables.';
DROP TABLE berlin_admin_work;
SELECT DateTime('now'),'creating admin views.';
CREATE VIEW berlin_admin_changed_name AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE changed_type =1
 ORDER BY CAST(admin_level AS INT),id_admin,valid_since;
CREATE VIEW berlin_admin_changed_belongs AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE changed_type=2
 ORDER BY CAST(admin_level AS INT),id_admin,valid_since;
CREATE VIEW berlin_admin_changed_borders AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE changed_type=3
 ORDER BY CAST(admin_level AS INT),id_admin,valid_since;
-- Note: the 'ORDER BY' may not be needed since the table has been sorted
-- stadt, landgemeinde, gutsbezirke, sektoren, west/ost
CREATE VIEW berlin_borders_stadt AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE
 (
  -- border changes only
  (changed_type = 3) AND
  (
   -- Städte
   (admin_level IN (4)) OR
   -- Landgemeinden und sowie Ost/West und Sektoren
   ((admin_level IN (9)) AND (valid_until<='1920-09-30')) OR
   -- Gutsbezirke until '1920-09-30'
   ((admin_level IN (10)) AND (valid_until<='1920-09-30') AND (id_belongs_to <>'1911000001'))
  ) AND
  -- sowie Ost/West und Sektoren
  (id_belongs_to IN (1902000000,1911000001,1911000002,1911000003,1902040000,1902060000,1902100000))
 )
 ORDER BY Cast(admin_level AS INT),id_admin,valid_since;
-- bezirke
CREATE VIEW berlin_borders_bezirke AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE
 (
  -- border changes only
  (changed_type = 3) AND
  -- bezirke since '1920-09-30'
  (admin_level IN (9)) AND
  ( -- in Berlin
   (id_belongs_to NOT IN (1911000002,1911000003,1902040000,1902060000,1902100000))
  )
 )
 ORDER BY id_admin,valid_since;
-- stadtteile,ortsteile
CREATE VIEW berlin_borders_ortsteile AS
 SELECT
  id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin
 WHERE
 (
  -- border changes only
  (changed_type = 3) AND
  (
   -- stadtteile until '1920-09-30'
   ((admin_level IN (10)) AND (id_belongs_to = '1911000001')) OR
   -- ortsteile since '1920-10-01'
   ((admin_level IN (10)) AND (valid_since >= '1920-10-01'))
  ) AND
  (id_belongs_to NOT IN (1911000002,1911000003,1911000004,1911000005,1911000006,1911000007))
 )
 ORDER BY id_admin,valid_since;
---
COMMIT;
SELECT DateTime('now'),'admin.berlin_ortsteile_tables [finished]';
---



