SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.import_berlin_segments.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample(without'';''): .read ../source_sql/segments.import_berlin_segments.sql UTF8';
SELECT DateTime('now'),'ATTACH DATABASE: berlin_segments.db';
ATTACH DATABASE "../source_db/berlin_segments.db" AS seg_ort;
SELECT DateTime('now'),'importing and rebuilding geometries of berlin_ortsteil_segments';
BEGIN;
SELECT DateTime('now'),'remove unneeded ''T'' in Date-Fields, caused by QGIS.';
UPDATE seg_ort.berlin_ortsteil_segments SET valid_since=REPLACE(valid_since,'T','') WHERE valid_since LIKE '%T';
UPDATE seg_ort.berlin_ortsteil_segments SET valid_until=REPLACE(valid_until,'T','') WHERE valid_until LIKE '%T';
-- UPDATE seg_ort.berlin_ortsteil_segments SET belongs_to_02=REPLACE(belongs_to_02,'\t','') WHERE belongs_to_02 LIKE '%\t%';
SELECT DateTime('now'),'creating berlin_ortsteil_segments';
CREATE TABLE berlin_ortsteil_segments (
 id_segment INTEGER PRIMARY KEY,
 name TEXT,
 comment TEXT  DEFAULT '',
 belongs_to_01 TEXT DEFAULT '',
 belongs_to_02 TEXT DEFAULT '',
 valid_since DATE DEFAULT '0001-01-01',
 valid_until DATE DEFAULT '3000-01-01'
 -- LINESTRING : to build POLOYGONS
);
SELECT AddGeometryColumn('berlin_ortsteil_segments','soldner_segment',3068,'LINESTRING','XY');
SELECT CreateSpatialIndex('berlin_ortsteil_segments','soldner_segment');
COMMIT;
SELECT DateTime('now'),'INSERTing berlin_ortsteil_segments';
BEGIN;
INSERT INTO berlin_ortsteil_segments
  (name,comment,belongs_to_01,belongs_to_02,valid_since,valid_until,soldner_segment)
 SELECT 
  name,comment,belongs_to_01,belongs_to_02,valid_since,valid_until,soldner_segment 
 FROM seg_ort.berlin_ortsteil_segments 
 ORDER BY belongs_to_01,name,belongs_to_02,valid_since,valid_until;
COMMIT;
SELECT DateTime('now'),'DETACH DATABASE: berlin_ortsteil_segments.db';
DETACH DATABASE seg_ort;
---
SELECT DateTime('now'),'segments.import_berlin_segments.sql [finished]';
---
