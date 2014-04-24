SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.build_geometries_ortsteil_segments.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample(without'';''): .read ../source_sql/segments.build_geometries_ortsteil_segments.sql UTF8';
SELECT DateTime('now'),'CREATEing berlin_geometries with PRIMARY KEY.';
--SELECT 'DROP VIEW ' || name || ';' AS drop_views FROM sqlite_master WHERE type = 'view' AND ((name LIKE 'stadt_%') OR (name LIKE 'bezirk_%') OR (name LIKE 'ortsteil_%') OR (name LIKE 'gemeinde_%') OR (name LIKE 'gutsbezirk_%'));
------------------------
-- SELECT * FROM berlin_ortsteil_segments WHERE belongs_to_02 LIKE '%'||X'09'||'%';
-- SELECT replace(belongs_to_02,X'09','') FROM berlin_ortsteil_segments WHERE belongs_to_02 LIKE '%'||X'09'||'%';
-- select replace(id,'_',cast(x'09' as text)) from bar;
SELECT DateTime('now'),'creating geometries_ortsteil_segments';
---
CREATE TABLE geometries_ortsteil_segments (
 id_segment INTEGER PRIMARY KEY,
 name TEXT,
 comment TEXT  DEFAULT '',
 belongs_to_01 TEXT DEFAULT '',
 belongs_to_02 TEXT DEFAULT '',
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01'
 -- LINESTRING : to build POLOYGONS
);
SELECT AddGeometryColumn('geometries_ortsteil_segments','soldner_segment',3068,'LINESTRING','XY');
SELECT CreateSpatialIndex('geometries_ortsteil_segments','soldner_segment');
---
DROP TABLE IF EXISTS berlin_geometries_segments;
CREATE TABLE berlin_geometries_segments 
(
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
SELECT AddGeometryColumn('berlin_geometries_segments','soldner_segments',3068,'MULTILINESTRING','XY');
SELECT CreateSpatialIndex('berlin_geometries_segments','soldner_segments');
SELECT AddGeometryColumn('berlin_geometries_segments','soldner_polygon',3068,'MULTIPOLYGON','XY');
SELECT CreateSpatialIndex('berlin_geometries_segments','soldner_polygon');
SELECT AddGeometryColumn('berlin_geometries_segments','soldner_ring',3068,'MULTIPOLYGON','XY');
SELECT CreateSpatialIndex('berlin_geometries_segments','soldner_ring');
SELECT AddGeometryColumn('berlin_geometries_segments','soldner_center',3068,'POINT','XY');
SELECT CreateSpatialIndex('berlin_geometries_segments','soldner_center');
---
INSERT INTO berlin_geometries_segments
  (id_geometry,id_admin,name,admin_level,valid_since,valid_until,id_belongs_to,belongs_to)
 SELECT
  id_geometry,id_admin,name,admin_level,valid_since,valid_until,id_belongs_to,belongs_to
 FROM berlin_geometries
 WHERE 
 (
  (admin_level = 10) AND 
  (id_admin NOT IN (1911000001,1911000004,1911000005,1911000006,1911000007)) AND
  (soldner_polygon NOT NULL)
 );
---
---
DROP TABLE IF EXISTS temp_segments;
CREATE TABLE temp_segments AS
SELECT
 polygon.id_geometry AS id_geometry,
 ( -- read name of the first POLYGON
  SELECT admin.name 
  FROM berlin_admin AS admin 
  WHERE 
   (admin.changed_type = 2) AND 
   (polygon.id_admin=admin.id_admin) AND
   (polygon.valid_since BETWEEN admin.valid_since AND admin.valid_until)
 )||','||
 ( -- read name of the second POLYGON
  SELECT admin.name 
  FROM berlin_admin AS admin 
  WHERE 
   (admin.changed_type = 2) AND 
   (segments.id_admin=admin.id_admin) AND
   (segments.valid_since BETWEEN segments.valid_since AND admin.valid_until)
  )||' - '||
 -- add the Date to this description
 polygon.valid_since AS name,'' AS comment,
 -- the id of the first POLYGON
 polygon.id_admin AS belongs_to_01,
 -- the id of the second POLYGON
 segments.id_admin AS belongs_to_02, 
 polygon.valid_since,
 polygon.valid_until,
 ST_LineMerge
 ( -- attempt to create 1 LINESTRING
  ST_Intersection
  ( -- from the common portion of both POLYGONs
   (polygon.soldner_polygon),
   (segments.soldner_polygon)
  )
 )
 AS soldner_segment,
 ST_GeometryType
 (
  ST_LineMerge
  (
   ST_Intersection
   (
    (polygon.soldner_polygon),
    (segments.soldner_polygon)
   )
  )
 )
 AS geometry_type,
 0 AS linestring_count
FROM 
 berlin_geometries AS polygon
 INNER JOIN 
 berlin_geometries AS segments 
WHERE 
(
 -- skip the POLYGON being splitted (would otherwise return itsself)
 (polygon.id_geometry <> segments.id_geometry) AND 
 -- check for Date - only used POLYGONS valid for the timeframe
 (polygon.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
 -- Ortsteil Geometries only
 (segments.admin_level = 10) AND 
 -- skip known Geometries not needed (City Overviews)
 (segments.id_admin NOT IN (1911000001,1911000004,1911000005,1911000006,1911000007)) AND
 -- skip any non-existing POLYGONs
 (segments.soldner_polygon NOT NULL) AND
 ST_Intersects
 ( -- create a segment as extraction where both POLYGONs meet
  (polygon.soldner_polygon),
  (segments.soldner_polygon)
 ) AND
 (
  ST_GeometryType
  ( -- LINESTRING or MULTILINESTRINGs could be possible
   ST_Intersection
   (
    (polygon.soldner_polygon),
    (segments.soldner_polygon)
   )
   -- avoid creating LINSTRINGs with 1 POINT - 
  ) <> 'POINT'
 )
) AND
(
 (polygon.admin_level = 10) AND 
 (polygon.id_admin NOT IN (1911000001,1911000004,1911000005,1911000006,1911000007)) AND
 (polygon.soldner_polygon NOT NULL)
)
ORDER BY polygon.id_geometry;
---
-- delete duplicate records
---
DELETE
FROM
 temp_segments
WHERE EXISTS
(
 SELECT 1 
 FROM
  temp_segments AS temp_segments_tmp_02
 WHERE 
 (
  -- compare if the geometries are the same (ST_Equals is NOT needed)
  (temp_segments.soldner_segment = temp_segments_tmp_02.soldner_segment) AND
  -- ignore duplicates from othe data areas, we must retain these
  (temp_segments.valid_since = temp_segments_tmp_02.valid_since) AND
  -- check that the belongs_to logic is correct
  (temp_segments.belongs_to_01=temp_segments_tmp_02.belongs_to_02) OR
  (temp_segments.belongs_to_02=temp_segments_tmp_02.belongs_to_01) AND
  -- will delete the higher number - will not work the other way around
  (temp_segments.rowid > temp_segments_tmp_02.rowid)
 )
 GROUP BY temp_segments_tmp_02.soldner_segment
);
---
UPDATE berlin_geometries_segments SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_LineMerge(ST_Collect(segments.soldner_segment))) 
 FROM temp_segments AS segments INNER JOIN 
 berlin_geometries_segments AS geometries 
 WHERE  
 (
  (berlin_geometries_segments.id_geometry=geometries.id_geometry) AND 
  (
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%'||geometries.id_admin||'%') 
  )
 )
);
---
UPDATE berlin_geometries_segments SET soldner_polygon=CastToMultiPolygon(ST_BuildArea(soldner_segments));
UPDATE temp_segments SET linestring_count=ST_NumGeometries(soldner_segment);
UPDATE temp_segments SET linestring_count=0 WHERE linestring_count IS NULL;
---
DROP TABLE IF EXISTS temp_segments_error;
CREATE TABLE temp_segments_error AS
 SELECT *
 FROM temp_segments
 WHERE comment= '' AND linestring_count <> 1
 ORDER BY id_geometry;
DELETE FROM temp_segments
 WHERE comment= '' AND linestring_count <> 1;
---
-- INSERT into [attempt to resolve City Limits]
---
INSERT INTO temp_segments 
 SELECT
 -- so that we know where it comes from
 polygon.id_geometry AS id_geometry,
 ( -- read name of the first POLYGON
  SELECT admin.name 
  FROM berlin_admin AS admin 
  WHERE 
   (admin.changed_type = 2) AND 
   (polygon.id_admin=admin.id_admin) AND
   (polygon.valid_since BETWEEN admin.valid_since AND admin.valid_until)
 )||','||
 ( -- read name of the second POLYGON
  SELECT admin.name 
  FROM berlin_admin AS admin 
  WHERE 
   (admin.changed_type = 2) AND 
   -- hard code with Berlin-City Limits
   ('1911000001'=admin.id_admin) AND
   (segments.valid_since BETWEEN segments.valid_since AND admin.valid_until)
  )||' - '||
 -- add the Date to this description
 polygon.valid_since AS name,'City Limits' AS comment,
 -- the id of the first POLYGON
 polygon.id_admin AS belongs_to_01,
 -- hard code with Berlin-City Limits
 '1911000001' AS belongs_to_02, 
 polygon.valid_since,
 polygon.valid_until,
 (
  SELECT
   CASE 
    WHEN 
     (ST_Equals
      ( -- check if the portions that we have are the SAME as the Left half
       ( -- split the given POLYGON, as LINESTRING) into a Left half
        ST_SplitLeft
        ( -- the geometry to split [from the original table]
         (SELECT ST_LinesFromRings(soldner_ring) FROM berlin_geometries WHERE id_geometry=polygon.id_geometry),
         ( -- create a LINESTRING from 2 POINTs
          MakeLine
          (-- select the StartPoint from the LINESTRING that we have
           (ST_StartPoint(polygon.soldner_segments)),
           -- select the EndPoint from the LINESTRING that we have
           (ST_EndPoint(polygon.soldner_segments))
          )
         )
        )
        ),
       -- the portion of the segments that we have
       (polygon.soldner_segments)
      ) = 1
      -- 0 = it is NOT the same - 1 = it is the same
     ) 
     THEN 
      -- split the given POLYGON, as LINESTRING into a Right half, that is what we want - that which is missing
      ST_SplitRight
      ( -- the geometry to split  [from the original table]
       (SELECT ST_LinesFromRings(soldner_ring) FROM berlin_geometries WHERE id_geometry=polygon.id_geometry),
       ( -- create a LINESTRING from 2 POINTs
        MakeLine
        (-- select the StartPoint from the LINESTRING that we have
         (ST_StartPoint(polygon.soldner_segments)),
         -- select the EndPoint from the LINESTRING that we have
         (ST_EndPoint(polygon.soldner_segments))
        )
       )
      )
     ELSE 
      -- split the given POLYGON, as LINESTRING into a Left half, that is what we want - that which is missing
      ST_SplitLeft
      ( -- the geometry to split [from the original table]
       (SELECT ST_LinesFromRings(soldner_ring) FROM berlin_geometries WHERE id_geometry=polygon.id_geometry),
       ( -- create a LINESTRING from 2 POINTs
        MakeLine
        (-- select the StartPoint from the LINESTRING that we have
         (ST_StartPoint(polygon.soldner_segments)),
         -- select the EndPoint from the LINESTRING that we have
         (ST_EndPoint(polygon.soldner_segments))
        )
       )
      )
    END
   AS result
 ) AS soldner_segment,
 -- will be done later
 '' AS geometry_type,
 0 AS linestring_count
FROM 
 berlin_geometries_segments AS polygon
 INNER JOIN 
 berlin_geometries_segments AS segments 
WHERE 
(
 (polygon.ROWID=segments.ROWID) AND
 (polygon.soldner_segments IS NOT NULL) AND
 (polygon.soldner_polygon IS NULL)
)
ORDER BY polygon.id_geometry;
---
UPDATE temp_segments SET geometry_type=ST_GeometryType(soldner_segment);
UPDATE temp_segments SET linestring_count=ST_NumGeometries(soldner_segment);
UPDATE temp_segments SET linestring_count=0 WHERE linestring_count IS NULL;
---
---
UPDATE berlin_geometries_segments SET soldner_segments=
(
 SELECT CastToMultiLinestring(ST_LineMerge(ST_Collect(segments.soldner_segment))) 
 FROM temp_segments AS segments INNER JOIN 
 berlin_geometries_segments AS geometries 
 WHERE  
 (
  (berlin_geometries_segments.id_geometry=geometries.id_geometry) AND 
  (
   (geometries.valid_since BETWEEN segments.valid_since AND segments.valid_until) AND
   (segments.belongs_to_01||','||segments.belongs_to_02 LIKE '%'||geometries.id_admin||'%') 
  )
 )
);
---
UPDATE berlin_geometries_segments SET soldner_polygon=CastToMultiPolygon(ST_BuildArea(soldner_segments));
UPDATE berlin_geometries_segments SET soldner_ring=CastToMultiPolygon(ST_UnaryUnion(soldner_polygon));
UPDATE berlin_geometries_segments SET soldner_center=ST_Centroid(soldner_polygon);
UPDATE berlin_geometries_segments SET meters_area=ST_Area(soldner_polygon);
-- result in meters of ExteriorRing- the result of soldner_segments is longer (all lines)
UPDATE berlin_geometries_segments SET meters_length=ST_Perimeter(soldner_ring);
---
-- Move records into temp_segments_correct considered correct
---
DROP TABLE IF EXISTS temp_segments_correct;
CREATE TABLE temp_segments_correct AS
 SELECT 
  segments.id_geometry,
  segments.name,
  segments.comment,
  segments.belongs_to_01,
  segments.belongs_to_02,
  segments.valid_since,
  segments.valid_until,
  segments.soldner_segment,
  segments.geometry_type,
  segments.linestring_count 
 FROM 
  temp_segments AS segments
  INNER JOIN berlin_geometries_segments AS polygon ON
  segments.id_geometry=polygon.id_geometry
 WHERE
 (
  (polygon.soldner_polygon IS NOT NULL) AND
  (segments.linestring_count = 1)
 )
 ORDER BY segments.id_geometry;
---
-- DELETE records stored in temp_segments_correct
---
DELETE FROM temp_segments 
WHERE ROWID IN
(
 SELECT segments.ROWID
 FROM 
  temp_segments AS segments
  INNER JOIN berlin_geometries_segments AS polygon ON
  segments.id_geometry=polygon.id_geometry
 WHERE
 (
  (polygon.soldner_polygon IS NOT NULL) AND
  (segments.linestring_count = 1)
 )
);

---
SELECT DateTime('now'),'segments.build_geometries_ortsteil_segments.sql [finished]';
---
