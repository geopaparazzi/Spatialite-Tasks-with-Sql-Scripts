SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'admin.berlin_stadtteile_tables.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample (without'';''): .read ../source_sql/admin.berlin_stadtteile_tables.sql UTF8';
SELECT DateTime('now'),'CREATEing berlin_stadt with PRIMARY KEY.';
BEGIN;
---
CREATE TABLE berlin_stadt_work (
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
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
---
CREATE TABLE berlin_stadt (
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
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
---
SELECT DateTime('now'),'INSERTing berlin_stadt data.';
---
-- Landkreisen
-- 1902040000=Niederbarnim
-- http://de.wikipedia.org/wiki/Landkreis_Niederbarnim#Gro.C3.9F-Berlin-Gesetz
-- 1902060000=Osthavelland
--    die Landgemeinden Cladow, Gatow, Pichelsdorf, Staaken und Tiefwerder,
--    die Gutsbezirke Pichelswerder, Potsdamer Forst – nördlicher Teil bis zum Griebnitzsee und Kohlhasenbrück – und Spandau.
-- 1902100000=Teltow
---
-- SELECT * FROM berlin_admin WHERE valid_until='1920-09-30' AND id_belongs_to <> 1911000001 AND changed_type=2 AND admin_level=9 ORDER BY name;
INSERT INTO berlin_stadt_work VALUES('1902040101','Schloß','10','1237-10-28','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902040101','Schloß','10','1237-10-28','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041502','Oberschöneweide','9','1598-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041502','Oberschöneweide','9','1598-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041602','Friedrichshagen','9','1753-05-29','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041602','Friedrichshagen','9','1753-05-29','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041603','Rahnsdorf','9','1375-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041603','Rahnsdorf','9','1375-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041701','Lichtenberg','4','1288-05-24','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041701','Lichtenberg','4','1288-05-24','1878-03-29','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041701','Lichtenberg (Zentralviehof)','4','1878-03-30','1912-03-31','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041701','Lichtenberg (Boxhagen-Rummelsburg)','4','1912-04-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041702','Friedrichsfelde','9','1265-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041702','Friedrichsfelde','9','1265-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041703','Biesdorf','9','1375-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041703','Biesdorf','9','1375-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041704','Kaulsdorf','9','1285-01-21','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041704','Kaulsdorf','9','1285-01-21','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041705','Mahlsdorf','9','1345-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041705','Mahlsdorf','9','1345-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041706','Marzahn','9','1300-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041706','Marzahn','9','1300-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041707','Biesdorf','10','1288-05-24','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041707','Biesdorf','10','1288-05-24','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041708','Hellersdorf/Wuhlgarten','10','1375-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041708','Hellersdorf/Wuhlgarten','10','1375-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041709','Boxhagen-Rummelsburg','10','1669-01-01','1912-03-31','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041709','Boxhagen-Rummelsburg','10','1669-01-01','1912-03-31','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041801','Weißensee','9','1242-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041801','Weißensee','9','1242-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041802','Malchow','9','1288-05-24','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041802','Malchow','9','1288-05-24','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041803','Wartenberg','9','1288-05-24','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041803','Wartenberg','9','1288-05-24','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041804','Falkenberg','9','1288-05-24','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041804','Falkenberg','9','1288-05-24','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041805','Hohenschönhausen','9','1284-08-19','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041805','Hohenschönhausen','9','1284-08-19','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041806','Falkenberg','10','1370-06-26','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041806','Falkenberg','10','1370-06-26','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041807','Malchow','10','1344-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041807','Malchow','10','1344-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041808','Wartenberg','10','1250-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041808','Wartenberg','10','1250-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041901','Pankow','9','1311-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041901','Pankow','9','1311-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041902','Niederschönhausen','9','1250-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041902','Niederschönhausen','9','1250-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041903','Blankenfelde','9','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041903','Blankenfelde','9','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041904','Buchholz','9','1242-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041904','Buchholz','9','1242-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041905','Buch','9','1289-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041905','Buch','9','1289-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041906','Karow','9','1375-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041906','Karow','9','1375-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041907','Blankenburg','9','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041907','Blankenburg','9','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041908','Heinersdorf','9','1319-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041908','Heinersdorf','9','1319-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041910','Niederschönhausen mit Schönholz','10','1752-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041910','Niederschönhausen mit Schönholz','10','1752-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041911','Rosenthal','9','1356-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041911','Rosenthal','9','1356-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041912','Blankenfelde','10','1284-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041912','Blankenfelde','10','1284-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041913','Buch','10','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041913','Buch','10','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041914','Blankenburg','10','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041914','Blankenburg','10','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041915','Rosenthal','10','1356-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902041915','Rosenthal','10','1356-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042001','Reinickendorf','9','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042001','Reinickendorf','9','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042002','Lübars','9','1322-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042002','Lübars','9','1322-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042003','Hermsdorf','9','1349-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042003','Hermsdorf','9','1349-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042004','Heiligensee','9','1308-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042004','Heiligensee','9','1308-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042005','Tegel','9','1237-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042005','Tegel','9','1237-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042006','Wittenau','9','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042006','Wittenau','9','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042007','Tegel-Forst','10','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042007','Tegel-Forst','10','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042008','Tegel-Schloß','10','1558-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042008','Tegel-Schloß','10','1558-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042009','Frohnau','10','1908-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042009','Frohnau','10','1908-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042010','Jungfernheide','10','1230-01-01','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042010','Jungfernheide','10','1230-01-01','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042011','Konradshöhe','10','1865-11-22','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042011','Konradshöhe','10','1865-11-22','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042012','Waidmannslust','10','1875-01-22','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042012','Waidmannslust','10','1875-01-22','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042013','Wilhelmsruh','10','1894-02-07','1920-09-30','2','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902042013','Wilhelmsruh','10','1894-02-07','1920-09-30','3','1902040000','Niederbarnim');
INSERT INTO berlin_stadt_work VALUES('1902060801','Spandau','4','1197-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060801','Spandau','4','1197-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060802','Staaken','9','1273-03-26','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060802','Staaken','9','1273-03-26','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060803','Tiefwerder','9','1815-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060803','Tiefwerder','9','1815-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060804','Pichelsdorf','9','1375-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060804','Pichelsdorf','9','1375-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060805','Gatow','9','1258-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060805','Gatow','9','1258-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060806','Kladow','9','1590-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060806','Kladow','9','1590-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060807','Zitadelle','10','1197-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060807','Zitadelle','10','1197-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060808','Pichelswerder','10','1879-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060808','Pichelswerder','10','1879-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060809','Hakenfelde','10','1730-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060809','Hakenfelde','10','1730-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060810','Haselhorst (ab 1910 zu Spandau)','10','1590-01-01','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060810','Haselhorst (ab 1910 zu Spandau)','10','1590-01-01','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060811','Wilhelmstadt','10','1897-03-22','1920-09-30','2','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902060811','Wilhelmstadt','10','1897-03-22','1920-09-30','3','1902060000','Osthavelland');
INSERT INTO berlin_stadt_work VALUES('1902100701','Charlottenburg','4','1239-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100701','Charlottenburg','4','1239-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100702','Plötzensee','10','1800-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100702','Plötzensee','10','1800-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100703','Heerstraße','10','1239-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100703','Heerstraße','10','1239-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100901','Wilmersdorf','4','1293-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100901','Wilmersdorf','4','1293-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100902','Schmargendorf','9','1220-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100902','Schmargendorf','9','1220-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100903','Grunewald','9','1880-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100903','Grunewald','9','1880-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100904','Grunewald-Forst','10','1220-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902100904','Grunewald-Forst','10','1220-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101001','Zehlendorf','9','1242-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101001','Zehlendorf','9','1242-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101002','Nikolassee','9','1901-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101002','Nikolassee','9','1901-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101003','Wannsee','9','1898-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101003','Wannsee','9','1898-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101004','Dahlem','10','1375-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101004','Dahlem','10','1375-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101005','Klein-Glienicke','10','1220-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101005','Klein-Glienicke','10','1220-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101006','Pfaueninsel','10','1843-05-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101006','Pfaueninsel','10','1843-05-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101007','Potsdamer Forst','10','1220-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101007','Potsdamer Forst','10','1220-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101101','Schöneberg','4','1264-11-03','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101101','Schöneberg','4','1264-11-03','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101102','Friedenau','9','1871-07-09','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101102','Friedenau','9','1871-07-09','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101201','Steglitz','9','1242-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101201','Steglitz','9','1242-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101202','Lichterfelde','9','1250-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101202','Lichterfelde','9','1250-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101203','Lankwitz','9','1239-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101203','Lankwitz','9','1239-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101301','Tempelhof','9','1200-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101301','Tempelhof','9','1200-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101302','Mariendorf','9','1337-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101302','Mariendorf','9','1337-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101303','Marienfelde','9','1344-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101303','Marienfelde','9','1344-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101304','Lichtenrade','9','1375-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101304','Lichtenrade','9','1375-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101401','Rixdorf/Neukölln','4','1200-06-26','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101401','Rixdorf/Neukölln','4','1200-06-26','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101401','Rixdorf','4','1200-06-26','1912-01-26','1','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101401','Neukölln','4','1912-01-27','1920-09-30','1','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101402','Britz','9','1237-06-26','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101402','Britz','9','1237-06-26','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101403','Buckow','9','1230-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101403','Buckow','9','1230-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101404','Rudow','9','1373-06-26','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101404','Rudow','9','1373-06-26','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101501','Treptow','9','1261-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101501','Treptow','9','1261-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101503','Niederschöneweide','9','1598-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101503','Niederschöneweide','9','1598-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101504','Johannisthal','9','1753-11-16','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101504','Johannisthal','9','1753-11-16','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101505','Adlershof','9','1754-04-14','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101505','Adlershof','9','1754-04-14','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101506','Alt-Glienicke','9','1754-04-14','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101506','Alt-Glienicke','9','1754-04-14','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101507','Wuhlheide','10','1586-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101507','Wuhlheide','10','1586-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101601','Cöpenick','4','1210-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101601','Cöpenick','4','1210-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101604','Müggelheim','9','1747-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101604','Müggelheim','9','1747-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101605','Schmöckwitz','9','1375-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101605','Schmöckwitz','9','1375-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101606','Bohnsdorf','9','1375-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101606','Bohnsdorf','9','1375-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101607','Grünau','9','1747-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101607','Grünau','9','1747-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101608','Cöpenick-Forst','10','1210-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101608','Cöpenick-Forst','10','1210-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101609','Grünau-Dahmer Forst','10','1210-01-01','1920-09-30','2','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1902101609','Grünau-Dahmer Forst','10','1210-01-01','1920-09-30','3','1902100000','Teltow');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin','4','1237-10-28','3000-01-01','2','1902000000','Preußen');
-- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
UPDATE berlin_stadt_work SET name=name||' [Stadt]' WHERE ((admin_level=4) AND (valid_until<='1920-09-30'));
UPDATE berlin_stadt_work SET name=name||' [Landgemeinde]' WHERE ((admin_level=9) AND (valid_until<='1920-09-30'));
UPDATE berlin_stadt_work SET name=name||' [Gutsbezirk]' WHERE ((admin_level=10) AND (valid_until<='1920-09-30'));
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Zusammenführung Alt-Cölln,Alt-Berlin)','4','1307-01-01','1659-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Friedrichswerder,Neukölln am Wasser,Dorotheenstadt (Innen))','4','1660-01-01','1684-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Spandauer Vorstadt,Stralauer Vorstadt (Innen),Friedrichstadt)','4','1685-01-01','1709-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Luisenstadt (Innen),Königsviertel (Innen))','4','1710-01-01','1736-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Friedrich-Wilhelm-Stadt)','4','1737-01-01','1829-05-10','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Oranienburger Vorstadt,Rosenthaler Vorstadt)','4','1829-05-11','1830-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Königsviertel (Außen),Stralauer Vorstadt (Außen))','4','1831-01-01','1841-06-20','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Friedrichsvorstadt,Luisenstadt (Außen))','4','1841-06-21','1860-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Wedding,Gesundbrunnen,Moabit,Schöneberger/Tempelhofer Vorstadt)','4','1861-01-01','1878-03-29','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Zentralviehhof)','4','1878-03-30','1881-01-14','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Tiergarten)','4','1881-01-15','1915-01-28','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (mit Umgebung 1912-03-31)','4','1881-01-15','1912-03-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin (Eingemeindung Plötzensee)','4','1915-01-29','1920-09-30','3','1902000000','Preußen');
-- major changes since 1920-10-01 [Bezirke and Ortsteile]
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Gründung von Groß Berlin - 1920-10-01)','9','1920-10-01','1928-11-29','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Gründung von Groß Berlin - 1920-10-01)','10','1920-10-01','1928-11-29','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Eingemeindung Düppel - 1928-11-30)','9','1928-11-30','1938-03-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Eingemeindung Düppel - 1928-11-30)','10','1928-11-30','1938-03-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Gebietsreform - 1938-04-01)','9','1938-04-01','1945-08-30','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Gebietsreform - 1938-04-01)','10','1938-04-01','1945-08-30','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Gebietsaustausch - 1945-08-31)','9','1945-08-31','1972-06-02','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Gebietsaustausch 1945)','10','1945-08-31','1972-06-02','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Gebietsaustausch - 1972-06-03)','9','1972-06-03','1979-01-04','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Gebietsaustausch - 1972-06-03)','10','1972-06-03','1985-08-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Bezirk Marzahn - 1979-01-05)','9','1979-01-05','1985-08-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Bezirk Marzahn - 1979-01-05)','10','1979-01-05','1985-08-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Bezirk Hohenschönhausen - 1985-09-01)','9','1985-09-01','1986-05-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Bezirk Hohenschönhausen - 1985-09-01)','10','1985-09-01','1986-05-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Bezirk Hellersdorf - 1986-06-01)','9','1986-06-01','1988-06-30','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Bezirk Hellersdorf - 1986-06-01)','10','1986-06-01','1988-06-30','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Gebietsaustausch - 1988-07-01)','9','1988-07-01','1990-10-02','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Gebietsaustausch - 1988-07-01)','10','1988-07-01','1990-10-02','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Wiedervereinigung - 1990-10-03)','9','1990-10-03','2000-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Wiedervereinigung - 1990-10-03)','10','1990-10-03','2000-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Bezirksreform - 2001-01-01)','9','2001-01-01','2001-12-31','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Bezirksreform - 2001-01-01)','10','2001-01-01','2001-12-31','3','1902000000','Preußen');
---
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Ortsteil Rummelsburg - 2002-01-01)','9','2002-01-01','2004-09-29','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Ortsteil Rummelsburg - 2002-01-01)','10','2002-01-01','2004-09-29','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Ortsteile Westend,Charlottenburg-Nord,Halensee - 2004-09-30)','9','2004-09-30','2012-05-17','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Ortsteile Westend,Charlottenburg-Nord,Halensee - 2004-09-30)','10','2004-09-30','2012-05-17','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Bezirke (Ortsteil Borsigwalde - 2012-05-18)','9','2012-05-18','3000-01-01','3','1902000000','Preußen');
INSERT INTO berlin_stadt_work VALUES('1911000001','Berlin Ortsteile (Ortsteil Borsigwalde - 2012-05-18)','10','2012-05-18','3000-01-01','3','1902000000','Preußen');
---
INSERT INTO berlin_stadt_work VALUES('1911000002','Berlin (West) [Selbständige politische Einheit Westberlin] - Bezirke','9','1945-08-31','1990-10-02','3','1911000001','Berlin');
INSERT INTO berlin_stadt_work VALUES('1911000003','Berlin (Ost) [Hauptstadt der DDR] - Bezirke','9','1945-08-31','1990-10-02','3','1911000001','Berlin');
-- Neukölln, Kreuzberg, Tempelhof, Schöneberg, Steglitz und Zehlendorf
INSERT INTO berlin_stadt_work VALUES('1911000004','amerikanische Sektor - Bezirke','9','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1911000004','amerikanische Sektor - Ortsteile','10','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1902011400','Neukölln','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011300','Tempelhof','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010600','Kreuzberg','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011100','Schöneberg','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011200','Steglitz','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011000','Zehlendorf','9','1945-08-31','1990-10-02','2','1911000004','amerikanische Sektor');
-- Charlottenburg, Spandau, Tiergarten und Wilmersdorf
INSERT INTO berlin_stadt_work VALUES('1911000005','britische Sektor - Bezirke','9','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1911000005','britische Sektor - Ortsteile','10','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1902010700','Charlottenburg','9','1945-08-31','1990-10-02','2','1911000005','britische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010800','Spandau','9','1945-08-31','1990-10-02','2','1911000005','britische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010200','Tiergarten','9','1945-08-31','1990-10-02','2','1911000005','britische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010900','Wilmersdorf','9','1945-08-31','1990-10-02','2','1911000005','britische Sektor');
-- Wedding und Reinickendorf
INSERT INTO berlin_stadt_work VALUES('1911000006','französische Sektor - Bezirke','9','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1911000006','französische Sektor - Ortsteile','10','1945-08-31','1990-10-02','3','1911000002','Berlin (West)');
INSERT INTO berlin_stadt_work VALUES('1902012000','Reinickendorf','9','1945-08-31','1990-10-02','2','1911000006','französische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010300','Wedding','9','1945-08-31','1990-10-02','2','1911000006','französische Sektor');
-- Pankow, Weißensee, Prenzlauer Berg, Mitte, Friedrichshain, Lichtenberg, Köpenick und Treptow
INSERT INTO berlin_stadt_work VALUES('1911000007','sowjetische Sektor [demokratischer Sektor] - Bezirke','9','1945-08-31','1990-10-02','3','1911000003','Berlin (Ost)');
INSERT INTO berlin_stadt_work VALUES('1911000007','sowjetische Sektor [demokratischer Sektor] - Ortsteile','10','1945-08-31','1990-10-02','3','1911000003','Berlin (Ost)');
INSERT INTO berlin_stadt_work VALUES('1902011900','Pankow','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011800','Weißensee','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010400','Prenzlauer Berg','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010100','Mitte','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902010500','Friedrichshain','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011700','Lichtenberg','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011600','Köpenick','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
INSERT INTO berlin_stadt_work VALUES('1902011500','Treptow','9','1945-08-31','1990-10-02','2','1911000007','sowjetische Sektor');
--
-- SELECT * FROM berlin_geometries WHERE ((admin_level IN (4,9,10)) AND (id_admin IN (1911000001,1911000002,1911000003,1911000004,1911000005,1911000006,1911000007)));
---
SELECT DateTime('now'),'-I-> checking for unique entries in ''berlin_stadt_work'' - result should be empty:';
SELECT COUNT(*),* FROM berlin_stadt_work GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
SELECT DateTime('now'),'-W-> if message came they must be resoved';
-- ---
INSERT INTO berlin_stadt
SELECT
 id_admin,name,admin_level,valid_since,valid_until,changed_type,id_belongs_to,belongs_to
FROM berlin_stadt_work
ORDER BY id_admin,changed_type,id_belongs_to,valid_since;
DROP TABLE berlin_stadt_work;
---
SELECT DateTime('now'),'CREATEing berlin_stadtteile with PRIMARY KEY.';
---
CREATE TABLE berlin_stadtteile (
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
 PRIMARY KEY (id_admin,admin_level,valid_since,valid_until,changed_type)
);
---
SELECT DateTime('now'),'INSERTing berlin_stadtteile data.';
---
INSERT INTO berlin_stadtteile VALUES('1902010101','Alt-Cölln',10,'1237-10-12','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010101','Alt-Cölln',10,'1237-10-12','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010102','Alt-Berlin','10','1244-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010102','Alt-Berlin','10','1244-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010103','Friedrichswerder','10','1660-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010103','Friedrichswerder','10','1660-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010104','Neukölln am Wasser','10','1662-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010104','Neukölln am Wasser','10','1662-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010105','Dorotheenstadt (Innen)','10','1674-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010105','Dorotheenstadt (Innen)','10','1674-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010106','Friedrichstadt','10','1691-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010106','Friedrichstadt','10','1691-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010107','Luisenstadt (Innen)','10','1710-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010107','Luisenstadt (Innen)','10','1710-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010108','Stralauer Vorstadt (Innen)','10','1690-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010108','Stralauer Vorstadt (Innen)','10','1690-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010109','Königsviertel (Innen)','10','1710-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010109','Königsviertel (Innen)','10','1710-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010110','Spandauer Vorstadt','10','1685-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010110','Spandauer Vorstadt','10','1685-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010111','Friedrich-Wilhelm-Stadt','10','1737-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010111','Friedrich-Wilhelm-Stadt','10','1737-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010112','Oranienburger Vorstadt','10','1829-05-11','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010112','Oranienburger Vorstadt','10','1829-05-11','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010113','Rosenthaler Vorstadt','10','1829-05-11','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010113','Rosenthaler Vorstadt','10','1829-05-11','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010114','Königsviertel (Außen)','10','1831-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010114','Königsviertel (Außen)','10','1831-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010115','Stralauer Vorstadt (Außen)','10','1831-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010115','Stralauer Vorstadt (Außen)','10','1831-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010116','Friedrichsvorstadt','10','1841-06-21','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010116','Friedrichsvorstadt','10','1841-06-21','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010117','Luisenstadt (Außen)','10','1841-06-21','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010117','Luisenstadt (Außen)','10','1841-06-21','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010118','Wedding-Gesundbrunnen','10','1861-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010118','Wedding-Gesundbrunnen','10','1861-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010119','Moabit','10','1861-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010119','Moabit','10','1861-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010120','Tempelhofer Vorstadt','10','1861-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010120','Tempelhofer Vorstadt','10','1861-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010121','Schöneberger Vorstadt','10','1861-01-01','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010121','Schöneberger Vorstadt','10','1861-01-01','1920-09-30','3','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010122','Tiergartenviertel','10','1881-01-15','1920-09-30','2','1911000001','Berlin');
INSERT INTO berlin_stadtteile VALUES('1902010122','Tiergartenviertel','10','1881-01-15','1920-09-30','3','1911000001','Berlin');
SELECT DateTime('now'),'-I-> checking for unique entries in ''berlin_stadtteile'' - result should be empty:';
SELECT COUNT(*),* FROM berlin_stadtteile GROUP BY id_admin,admin_level,valid_since,valid_until,changed_type HAVING COUNT(*) > 1;
SELECT DateTime('now'),'-W-> if message came they must be resoved';
---
COMMIT;
SELECT DateTime('now'),'admin.berlin_stadtteile_tables [finished]';
---



