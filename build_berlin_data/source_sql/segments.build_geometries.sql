SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.build_geometries.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample(without'';''): .read ../source_sql/segments.build_geometries.sql UTF8';
SELECT DateTime('now'),'CREATEing berlin_geometries with PRIMARY KEY.';
--SELECT 'DROP VIEW ' || name || ';' AS drop_views FROM sqlite_master WHERE type = 'view' AND ((name LIKE 'stadt_%') OR (name LIKE 'bezirk_%') OR (name LIKE 'ortsteil_%') OR (name LIKE 'gemeinde_%') OR (name LIKE 'gutsbezirk_%'));
------------------------
-- SELECT * FROM berlin_ortsteil_segments WHERE belongs_to_02 LIKE '%'||X'09'||'%';
-- SELECT replace(belongs_to_02,X'09','') FROM berlin_ortsteil_segments WHERE belongs_to_02 LIKE '%'||X'09'||'%';
-- select replace(id,'_',cast(x'09' as text)) from bar;
SELECT DateTime('now'),'creating table berlin_geometries';
BEGIN;
DROP TABLE IF EXISTS berlin_geometries;
CREATE TABLE berlin_geometries (
 id_geometry INTEGER PRIMARY KEY,
 id_admin INTEGER DEFAULT 0,
 name TEXT,
 admin_level TEXT  DEFAULT '10',
 -- 4=stadt,9=bezirk/landgemeinden,10=ortsteil/stadtteil/gutsbezirke
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01',
 meters_area DOUBLE  DEFAULT 0,
 -- Area of ExteriorRing
 meters_length DOUBLE  DEFAULT 0,
 -- length of ExteriorRing
 changed_type TEXT  DEFAULT '3',
 -- 1=name,2=belongs,3=borders
 id_belongs_to INTEGER DEFAULT 0,
 belongs_to TEXT  DEFAULT ''
);
SELECT AddGeometryColumn('berlin_geometries','soldner_segments',3068,'MULTILINESTRING','XY');
SELECT CreateSpatialIndex('berlin_geometries','soldner_segments');
SELECT AddGeometryColumn('berlin_geometries','soldner_polygon',3068,'MULTIPOLYGON','XY');
SELECT CreateSpatialIndex('berlin_geometries','soldner_polygon');
SELECT AddGeometryColumn('berlin_geometries','soldner_ring',3068,'MULTIPOLYGON','XY');
SELECT CreateSpatialIndex('berlin_geometries','soldner_ring');
SELECT AddGeometryColumn('berlin_geometries','soldner_center',3068,'POINT','XY');
SELECT CreateSpatialIndex('berlin_geometries','soldner_center');
COMMIT;
---
BEGIN;
-- 20140318: 375 berlin_admin_changed_borders
SELECT DateTime('now'),'filling table berlin_geometries based on admin_changed_borders';
-- stadt, landgemeinde, gutsbezirke, sektoren, west/ost
INSERT INTO berlin_geometries
  (id_admin,name,admin_level,valid_since,valid_until,id_belongs_to,belongs_to)
 SELECT
  id_admin,name,admin_level,valid_since,valid_until,id_belongs_to,belongs_to
 FROM berlin_admin
 WHERE 
  -- border changes only
  (changed_type = 3) 
 ORDER BY Cast(admin_level AS INT),id_admin,valid_since;
-- 232
COMMIT;
BEGIN;
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments Multi-Linestrings';
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [Städte,Gemeinden und Gutsbezirke] outside of berlin before ''1920-10-01''';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(segments.soldner_segment)) 
 FROM berlin_ortsteil_segments AS segments INNER JOIN 
 berlin_geometries AS geometries 
 WHERE  
 ( 
  (berlin_geometries.id_geometry=geometries.id_geometry) AND
  (
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%'||geometries.id_admin||'%') 
  )
 ) 
)
WHERE 
 ((admin_level=10) OR (admin_level=4) OR ((admin_level = 9) AND (id_admin LIKE '1902%')) AND (valid_since < '1920-10-01'));
---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [Stadtteile] inside of berlin before ''1920-10-01''';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(segments.soldner_segment)) 
 FROM berlin_ortsteil_segments AS segments INNER JOIN 
 berlin_geometries AS geometries 
 WHERE  
 ( 
  (berlin_geometries.id_geometry=geometries.id_geometry) AND
  (   
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%1902010%') 
  )
 )
)
WHERE ((admin_level=4) AND (id_admin = '1911000001') AND (valid_since < '1920-10-01') AND (berlin_geometries.valid_until <> '1912-03-31'));
---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [alle Städte] area of berlin before ''1920-10-01''';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(segments.soldner_segment)) 
 FROM berlin_ortsteil_segments AS segments INNER JOIN 
 berlin_geometries AS geometries 
 WHERE  
 ( 
  (
   ('1912-03-31' BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%'||geometries.id_admin||'%') 
  )
 )
)
WHERE ((admin_level=4) AND (id_admin = '1911000001') AND (berlin_geometries.valid_since < '1920-10-01') AND (valid_until = '1912-03-31'));
--
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [single Ortsteile] of berlin after ''1920-10-01''';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(segments.soldner_segment)) 
 FROM berlin_ortsteil_segments AS segments INNER JOIN 
 berlin_geometries AS geometries 
 WHERE  
 (
  (berlin_geometries.id_geometry=geometries.id_geometry) AND 
  (
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%'||geometries.id_admin||'%') 
  )
 )
)
WHERE ((admin_level=10) AND (valid_since >= '1920-10-01'));
-- SELECT * FROM berlin_geometries WHERE id_geometry IN (286,287);
-- Polygons
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_polygon Multi-Polygons';
----
-- build geometries outside of berlin before '1920-10-01'
-- build geometries inside of berlin before '1920-10-01'
-- build geometries area of berlin before '1920-10-01'
-- build geometries of berlin after '1920-10-01'
-- ST_Polygonize  [building from multiple geometries - aggregate]
-- ST_BuildArea   [building from single geometry]
-- UPDATE berlin_geometries SET soldner_polygon=CastToMultiPolygon(ST_Polygonize(soldner_segments));
-- Note: this will create the Ortsteil Polygons from the Multi-Linestrings
-- EdgeRing::getRingInternal: IllegalArgumentException: Invalid number of points in LinearRing found 3 - must be 0 or >= 4
-- 17: EdgeRing::getRingInternal: IllegalArgumentException:
-- SELECT name,soldner_segments,CastToMultiPolygon(ST_BuildArea(soldner_segments)) FROM geometries_berlin_1920 WHERE id_geometry=21;
UPDATE berlin_geometries SET soldner_polygon=CastToMultiPolygon(ST_BuildArea(soldner_segments))
WHERE NOT ((admin_level=9) AND (valid_since >= '1920-10-01')) AND (soldner_segments IS NOT NULL);
-- this will rebuild the LINESTRING version again from the POLYGONS, leaving out unneeded LINSTRINGs
UPDATE berlin_geometries SET soldner_segments=ST_LinesFromRings(soldner_polygon) 
WHERE ((admin_level=4) AND (id_admin = '1911000001') AND (berlin_geometries.valid_since < '1920-10-01') AND (valid_until <> '1912-03-31'));
--
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [single Bezirke] of berlin after ''1920-10-01''';
UPDATE berlin_geometries SET soldner_segments=
( -- the bezirk-geometry to build in berlin_geometries
 SELECT CastToMultiLinestring(ST_Collect(geometries.soldner_segments)) 
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=10)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) AND
      -- valid time-frame
     (berlin_geometries.valid_since BETWEEN admin_ortsteile.valid_since AND admin_ortsteile.valid_until)
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (valid_since >= '1920-10-01'));
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_polygon [single Bezirke] of berlin after ''1920-10-01''';
-- Note: this must be done this way to retain the original Polygons of the Ortsteile
-- Note: this will collect the create Polygons of the Ortsteile belonging to the Bezirk at that time
UPDATE berlin_geometries SET soldner_polygon=
( -- the bezirk-geometry to build in berlin_geometries
 SELECT CastToMultiPolygon(ST_Collect(geometries.soldner_polygon))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=10)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) AND
      -- valid time-frame
     (berlin_geometries.valid_since BETWEEN admin_ortsteile.valid_since AND admin_ortsteile.valid_until)
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (valid_since >= '1920-10-01'));
---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [Berlin-Ortsteile] of berlin after ''1920-10-01''';
-- correct
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(segments.soldner_segment)) 
 FROM berlin_ortsteil_segments AS segments INNER JOIN 
 berlin_geometries AS geometries 
 WHERE  
 (
  (
   (berlin_geometries.id_geometry=geometries.id_geometry) AND 
   (geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) 
  ) AND
  (
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) 
  )
 )
)
WHERE ((admin_level=10) AND (id_admin=1911000001) AND (valid_since >= '1920-10-01'));
---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_polygons [Berlin-Ortsteile] of berlin after ''1920-10-01''';
-- correct
UPDATE berlin_geometries SET soldner_polygon=
( 
 SELECT CastToMultiPolygon(ST_Collect(geometries.soldner_polygon))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=10)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- no checking for belongs_to [ortsteile belongs to a bezirk and not to 1911000001]
      -- valid time-frame
     (berlin_geometries.valid_since BETWEEN admin_ortsteile.valid_since AND admin_ortsteile.valid_until)
    )
   )
  )
 )
)
WHERE ((admin_level=10) AND (id_admin=1911000001) AND (valid_since >= '1920-10-01'));
---
-- SELECT * FROM berlin_geometries WHERE ((admin_level IN (4)) AND (id_admin=1911000001));
-- SELECT * FROM berlin_geometries WHERE ((admin_level IN (9,10)) AND (id_admin=1911000001));
---
-- SELECT * FROM berlin_geometries WHERE name LIKE 'Schöneberg' and admin_level=9
-- 41,42
-- SELECT name,soldner_segments,soldner_polygon FROM berlin_geometries WHERE id_geometry IN (41,42);
-- SELECT CastToMultiPolygon(ST_BuildArea(soldner_segments)) AS soldner_polygon FROM berlin_geometries WHERE is_geometry IN (41,42);
-- SELECT name,soldner_segments,soldner_polygon FROM berlin_geometries WHERE id_admin IN (1911000202,1911000101);
 -- admin_level='10';
COMMIT;
BEGIN;
-- DELETE FROM berlin_geometries WHERE soldner_polygon IsNull;
-- SELECT * FROM berlin_geometries WHERE soldner_polygon IS NULL AND soldner_segments IS NOT NULL;
-- build geometries outside of berlin before '1920-10-01'
-- build geometries inside of berlin before '1920-10-01'
-- build geometries area of berlin before '1920-10-01'
-- build geometries of berlin after '1920-10-01'
-- Outer Borders Polygons
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_ring Ring-Polygons';
UPDATE berlin_geometries SET soldner_ring=CastToMultiPolygon(ST_UnaryUnion(soldner_polygon));
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_segments [Berlin-Bezirke] of berlin after ''1920-10-01''';
-- correct: must run after Ring-Polygons

---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_polygons [Berlin-Bezirke] of berlin after ''1920-10-01''';
--
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT ST_LineMerge(ST_Collect(geometries.soldner_segments))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) AND
      -- valid time-frame
     (berlin_geometries.valid_since BETWEEN admin_ortsteile.valid_since AND admin_ortsteile.valid_until)
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (id_admin=1911000001) AND (valid_since >= '1920-10-01'));
-- correct : must run after Ring-Polygons
UPDATE berlin_geometries SET soldner_polygon=
(
 SELECT CastToMultiPolygon(ST_Collect(geometries.soldner_ring))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) AND
      -- valid time-frame
     (berlin_geometries.valid_since BETWEEN admin_ortsteile.valid_since AND admin_ortsteile.valid_until)
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (id_admin=1911000001) AND (valid_since >= '1920-10-01'));
---
UPDATE berlin_geometries SET soldner_ring=CastToMultiPolygon(ST_UnaryUnion(soldner_polygon))
WHERE ((admin_level=9) AND (id_admin=1911000001) AND (valid_since >= '1920-10-01'));
---
SELECT DateTime('now'),'Creating: [Berlin-Bezirke] of Sektoren ';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(soldner_segments)) 
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) 
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (id_admin IN (1911000004,1911000005,1911000006,1911000007)) AND (valid_since >= '1920-10-01'));
---
UPDATE berlin_geometries SET soldner_polygon=
(
 SELECT CastToMultiPolygon(ST_Collect(geometries.soldner_ring))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) AND
  (
   geometries.id_admin IN
   ( -- select ortsteil-geometry where ortsteil belongs to bezirk
     -- when created, the ortsteil-geometry may not have belonged to this bezirk, check admin_table
    SELECT 
     id_admin
    FROM berlin_admin AS admin_ortsteile
    WHERE 
    ( -- same ortsteil in admin as polygon
     (admin_ortsteile.id_admin=geometries.id_admin) AND
      -- only belongs_to record
     (admin_ortsteile.changed_type=2) AND
      -- same admin_level
     (admin_ortsteile.admin_level=geometries.admin_level) AND
      -- check of ortsteil now belongs to this bezirk
     (berlin_geometries.id_admin=admin_ortsteile.id_belongs_to) 
    )
   )
  )
 )
)
WHERE ((admin_level=9) AND (id_admin IN (1911000004,1911000005,1911000006,1911000007)) AND (valid_since >= '1920-10-01'));
--
UPDATE berlin_geometries SET soldner_ring=CastToMultiPolygon(ST_UnaryUnion(soldner_polygon))
WHERE ((admin_level=9) AND (id_admin IN (1911000004,1911000005,1911000006,1911000007)) AND (valid_since >= '1920-10-01'));
---
SELECT DateTime('now'),'Creating: [Berlin-Bezirke] of West/Ost ';
UPDATE berlin_geometries SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_Collect(soldner_segments)) 
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.id_admin=geometries.id_belongs_to) AND
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) 
 )
)
WHERE ((admin_level=9) AND (id_admin IN (1911000002,1911000003)) AND (valid_since >= '1920-10-01'));
---
UPDATE berlin_geometries SET soldner_polygon=
(
 SELECT CastToMultiPolygon(ST_Collect(geometries.soldner_polygon))
 FROM berlin_geometries AS geometries
 WHERE 
 ( 
  ( -- valid time-frame 
   (berlin_geometries.id_admin=geometries.id_belongs_to) AND
   (berlin_geometries.valid_since BETWEEN geometries.valid_since AND geometries.valid_until) AND
    -- admin_level (ortsteil)
   (geometries.admin_level=9)
  ) 
 )
)
WHERE ((admin_level=9) AND (id_admin IN (1911000002,1911000003)) AND (valid_since >= '1920-10-01'));
--
UPDATE berlin_geometries SET soldner_ring=CastToMultiPolygon(ST_UnaryUnion(soldner_polygon))
WHERE ((admin_level=9) AND (id_admin IN (1911000002,1911000003)) AND (valid_since >= '1920-10-01'));
---
SELECT DateTime('now'),'Creating: berlin_geometries.soldner_center Center - Length and Areas of Polygon';
UPDATE berlin_geometries SET soldner_center=ST_Centroid(soldner_polygon);
UPDATE berlin_geometries SET meters_area=ST_Area(soldner_polygon);
-- result in meters of ExteriorRing- the result of soldner_segments is longer (all lines)
UPDATE berlin_geometries SET meters_length=ST_Perimeter(soldner_ring);
-- SELECT ST_Area(soldner_polygon) AS meters_area_polygon,ST_Area(soldner_ring) AS meters_area_ring FROM berlin_geometries WHERE id_geometry=101;
-- SELECT ST_Length(soldner_segments) AS meters_length_linestring,ST_Perimeter(soldner_ring) AS meters_length_ring,ST_Perimeter(soldner_polygon) AS meters_length_polygon FROM berlin_geometries WHERE id_geometry=101;
COMMIT;
---
SELECT DateTime('now'),'Creating: berlin_geometries_null - where Polygons could not be created';
SELECT 
 'segments_null='||(SELECT Count(*) FROM berlin_geometries WHERE ((soldner_segments IS NULL))) AS segments_null,
 'polygons_null='||(SELECT Count(*) FROM berlin_geometries WHERE ((soldner_segments IS NOT NULL) AND (soldner_polygon IS NULL))) AS polygons_null,
 'count_null='||(SELECT Count(*) FROM berlin_geometries WHERE ((soldner_segments IS NULL) OR (soldner_polygon IS NULL))) AS count_null,
 'not_null='||(SELECT Count(*) FROM berlin_geometries WHERE ((soldner_segments IS NOT NULL) AND (soldner_polygon IS NOT NULL))) AS not_null,
 'count_geometries='||(SELECT Count(*) FROM berlin_geometries ) AS count_geometries;
---
CREATE TABLE berlin_geometries_null AS
 SELECT id_geometry,id_admin,name,
 ST_LineMerge(soldner_segments) AS line_merge, 
 ST_IsSimple
 (
  ST_LineMerge(soldner_segments)
 ) AS is_simple,
 ST_IsClosed
 (
  ST_LineMerge(soldner_segments)
 ) AS is_closed,
 AsEWKT
 (
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_start,
 AsEWKT
 (
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_end,
 ST_Equals
 ( 
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  ),
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS is_equal,
 admin_level,valid_since,valid_until,
 soldner_polygon
 FROM berlin_geometries 
 WHERE 
 ((soldner_segments IS NOT NULL) AND (soldner_polygon IS NULL) AND (ST_IsSimple(ST_LineMerge(soldner_segments))));
INSERT INTO berlin_geometries_null 
 SELECT id_geometry,id_admin,name,
 ST_LineMerge(soldner_segments) AS line_merge, 
 ST_IsSimple
 (
  ST_LineMerge(soldner_segments)
 ) AS is_simple,
 ST_IsClosed
 (
  ST_LineMerge(soldner_segments)
 ) AS is_closed,
 AsEWKT
 (
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_start,
 AsEWKT
 (
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_end,
 ST_Equals
 ( 
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  ),
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS is_equal,
 admin_level,valid_since,valid_until,
 soldner_polygon
 FROM berlin_geometries 
 WHERE 
 ((soldner_segments IS NOT NULL) AND (soldner_polygon IS NULL) AND (NOT ST_IsSimple(ST_LineMerge(soldner_segments))));
INSERT INTO berlin_geometries_null 
 SELECT id_geometry,id_admin,name,
 ST_LineMerge(soldner_segments) AS line_merge, 
 ST_IsSimple
 (
  ST_LineMerge(soldner_segments)
 ) AS is_simple,
 ST_IsClosed
 (
  ST_LineMerge(soldner_segments)
 ) AS is_closed,
 AsEWKT
 (
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_start,
 AsEWKT
 (
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS point_end,
 ST_Equals
 ( 
  (
   SELECT ST_StartPoint
   (
    ST_LineMerge(soldner_segments)
   )
  ),
  (
   SELECT ST_EndPoint
   (
    ST_LineMerge(soldner_segments)
   )
  )
 ) AS is_equal,
 admin_level,valid_since,valid_until,
 soldner_polygon
 FROM berlin_geometries 
 WHERE 
 (soldner_segments IS NULL);
SELECT DateTime('now'),'segments.build_geometries.sql [finished]';
---
