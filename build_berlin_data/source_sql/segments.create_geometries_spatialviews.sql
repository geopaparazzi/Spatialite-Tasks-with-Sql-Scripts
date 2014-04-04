SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.create_geometries_spatialviews.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample(without'';''): .read ../source_sql/segments.create_geometries_spatialviews.sql UTF8';
--SELECT 'DROP VIEW ' || name || ';' AS drop_views FROM sqlite_master WHERE type = 'view' AND ((name LIKE 'stadt_%') OR (name LIKE 'bezirk_%') OR (name LIKE 'ortsteil_%') OR (name LIKE 'gemeinde_%') OR (name LIKE 'gutsbezirk_%'));
------------------------
-- SELECT * FROM berlin_soldner_segments WHERE name LIKE '%%';
BEGIN;
SELECT DateTime('now'),'CreateViews: Normal-Views of berlin_geometries of specific types';
CREATE VIEW berlin_borders_stadt AS
 SELECT 
  id_geometry,id_admin,valid_since,valid_until,name,
  soldner_polygon,soldner_segments,soldner_ring,soldner_center,
  meters_area,meters_length,
  id_belongs_to,belongs_to,admin_level
 FROM berlin_geometries
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
CREATE VIEW berlin_borders_bezirke AS
 SELECT 
  id_geometry,id_admin,valid_since,valid_until,name,
  soldner_polygon,soldner_segments,soldner_ring,soldner_center,
  meters_area,meters_length,
  id_belongs_to,belongs_to,admin_level
 FROM berlin_geometries
 WHERE 
 (
  -- border changes only
  (changed_type = 3) AND
  -- bezirke since '1920-09-30'
  (admin_level IN (9)) AND
  (id_belongs_to NOT IN (1911000002,1911000003,1902040000,1902060000,1902100000))
 )
 ORDER BY id_admin,valid_since;
-- stadtteile,ortsteile
CREATE VIEW berlin_borders_ortsteile AS
 SELECT 
  id_geometry,id_admin,valid_since,valid_until,name,
  soldner_polygon,soldner_segments,soldner_ring,soldner_center,
  meters_area,meters_length,
  id_belongs_to,belongs_to,admin_level
 FROM berlin_geometries
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
SELECT DateTime('now'),'CreateViews: Spatial-Views of berlin_geometries of specific years';
---
CREATE VIEW geometries_berlin_1307 AS
-- 'Berlin (Zusammenführung Alt-Cölln,Alt-Berlin) (Landgemeinde)' AS name,
-- '1307-01-01' AS valid_from --- '1659-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1659-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1307','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1660 AS
-- 'Berlin (Eingemeindung Friedrichswerder,Neukölln am Wasser,Dorotheenstadt (Innen)) (Landgemeinde)' AS name,
-- '1660-01-01' AS valid_from --- '1684-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1684-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1660','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1685 AS
-- 'Berlin (Eingemeindung Spandauer Vorstadt,Stralauer Vorstadt (Innen),Friedrichstadt) (Landgemeinde)' AS name,
-- '1685-01-01' AS valid_from --- '1709-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1709-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1685','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
--
CREATE VIEW geometries_berlin_1710 AS
-- 'Berlin (Eingemeindung Luisenstadt (Innen),Königsviertel (Innen)) (Landgemeinde)' AS name,
-- '1710-01-01' AS valid_from --- '1736-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1736-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1710','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1737 AS
-- 'Berlin (Eingemeindung Friedrich-Wilhelm-Stadt) (Landgemeinde)' AS name,
-- '1737-01-01' AS valid_from --- '1829-05-10' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1829-05-10' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1737','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1829 AS
-- 'Berlin (Eingemeindung Oranienburger Vorstadt,Rosenthaler Vorstadt) (Landgemeinde)' AS name,
-- '1829-05-11' AS valid_from --- '1830-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1830-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1829','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1831 AS
-- 'Berlin (Eingemeindung Königsviertel (Außen),Stralauer Vorstadt (Außen)) (Landgemeinde)' AS name,
-- '1831-01-01' AS valid_from --- '1841-06-20' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1841-06-20' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1831','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1841 AS
-- 'Berlin (Eingemeindung Friedrichsvorstadt,Luisenstadt (Außen)) (Landgemeinde)' AS name,
-- '1841-06-21' AS valid_from --- '1860-12-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1860-12-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1841','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1861 AS
-- 'Berlin (Eingemeindung Wedding,Gesundbrunnen,Moabit,Schöneberger/Tempelhofer Vorstadt) (Landgemeinde)' AS name,
-- '1861-01-01' AS valid_from --- '1878-03-29' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1878-03-29' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1861','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1878 AS
-- 'Berlin (Eingemeindung Zentralviehhof) (Landgemeinde)' AS name,
-- '1878-03-30' AS valid_from --- '1881-01-14' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1881-01-14' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1878','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1881 AS
-- 'Berlin (Eingemeindung Tiergarten) (Landgemeinde)' AS name,
-- '1881-01-15' AS valid_from --- '1915-01-28' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1915-01-28' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1881','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1915 AS
-- 'Berlin (Eingemeindung Plötzensee, letzte vor Gründung von Groß Berlin)' AS name,
-- '1915-01-29' AS valid_from --- '1920-09-30' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 (segments.id_admin LIKE '%19020101%') AND
 ('1920-09-30' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1915','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_umgebung_1912 AS
-- 'Berlin (Gründung von Groß Berlin)' AS name,
-- '1920-10-01' AS valid_from --- '1912-04-01' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1912-03-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_umgebung_1912','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1920 AS
-- 'Berlin (Gründung von Groß Berlin)' AS name,
-- '1920-10-01' AS valid_from --- '1928-11-29' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1928-11-29' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1920','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1928 AS
-- 'Berlin (Eingemeindung Düppel)' AS name,
-- '1928-11-30' AS valid_from --- '1938-03-31' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1938-03-31' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1928','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1938 AS
-- 'Berlin (Gebietsreform)' AS name,
-- '1938-04-01' AS valid_from --- '1945-08-30' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1945-08-30' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1938','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1945 AS
-- 'Berlin (Gebietsaustausch 1945)' AS name,
-- '1945-08-31' AS valid_from --- '1972-06-02' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1972-06-02' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1945','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1972 AS
-- 'Berlin (Gebietsaustausch 1972)' AS name,
-- '1972-06-03' AS valid_from --- '1988-06-30' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1988-06-30' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1972','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1988 AS
-- 'Berlin (Gebietsaustausch 1988)' AS name,
-- '1988-07-01' AS valid_from --- '1990-10-02' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('1990-10-02' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1988','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
-- --
CREATE VIEW geometries_berlin_1990 AS
-- 'Berlin (Wiedervereinigung 1990)' AS name,
-- '1990-10-03' AS valid_from --- '2012-05-17' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('2012-05-17' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_1990','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
---
-- --
CREATE VIEW geometries_berlin_2012 AS
-- 'Berlin (Ortsteil Borsigwalde)' AS name,
-- '2012-05-18' AS valid_from --- '3000-01-01' AS valid_to
SELECT *
FROM berlin_geometries segments
WHERE
(
 ('3000-01-01' BETWEEN segments.valid_since AND segments.valid_until)
) AND
soldner_segments IS NOT NULL
ORDER BY name;
---
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('geometries_berlin_2012','soldner_segments','id_geometry','berlin_geometries','soldner_segments',1);
---
COMMIT;
---
SELECT DateTime('now'),'segments.create_geometries_spatialviews.sql [finished]';
---
