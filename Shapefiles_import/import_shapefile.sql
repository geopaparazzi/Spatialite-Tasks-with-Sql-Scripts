SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.build_geometries_segments_result.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),' spatialite import_shapefile.db < import_shapefile.sql';
--
SELECT DateTime('now'),'CREATE VIRTUAL TABLE shp_plz_segments';
CREATE VIRTUAL TABLE shp_plz_segments 
USING VirtualShape('/media/gb_1500/maps/geo_tiff/berlin_maps_db/build_berlin_data/berlin_shapes/berlin_plz_segments/berlin_plz_segments','UTF-8', 3068);
--
SELECT DateTime('now'),'CREATE TABLE berlin_plz_segments';
CREATE TABLE berlin_plz_segments 
(
 id_segment INTEGER PRIMARY KEY,
 name TEXT,
 notes TEXT  DEFAULT '',
 admin_level TEXT  DEFAULT '3',
 belongs_to_01 TEXT DEFAULT '',
 belongs_to_02 TEXT DEFAULT '',
 valid_since DATE DEFAULT '1851-05-01',
 valid_until DATE DEFAULT '3000-01-01'
 -- LINESTRING : to build POLOYGONS
);
SELECT AddGeometryColumn('berlin_plz_segments','soldner_segment',3068,'LINESTRING','XY');
SELECT CreateSpatialIndex('berlin_plz_segments','soldner_segment');
--
SELECT DateTime('now'),'INSERT INTO berlin_plz_segments TABLE';
INSERT INTO berlin_plz_segments 
SELECT 
 PKUID AS id_segment,
 name,
 notes,
 admin_leve AS admin_level,
 belongs_to AS belongs_to_01,
 belongs__1 AS belongs_to_02,
 valid_sinc AS valid_since,
 valid_unti AS valid_until,
 Geometry AS soldner_segment
FROM shp_plz_segments;
SELECT count(id_segment)||' records imported from : shp_plz_segments' FROM berlin_plz_segments;
--
SELECT DateTime('now'),'DROP TABLE shp_plz_segments';
DROP TABLE shp_plz_segments;
SELECT DateTime('now'),'after DROP TABLE shp_plz_segments: vector_layers_statistics still has an entry, only in happens script, not spatialite_gui.';
SELECT * FROM vector_layers_statistics WHERE table_name='shp_plz_segments';
SELECT DateTime('now'),'DELETE in vector_layers_statistics entry for shp_plz_segments - not possible because it is a view';
-- Error: near line 44: cannot modify vector_layers_statistics because it is a view
-- DELETE FROM vector_layers_statistics WHERE table_name='shp_plz_segments';
--
SELECT DateTime('now'),'finalize berlin_plz_segments: UpdateLayerStatistics(''berlin_plz_segments'',''soldner_segment'')';
SELECT UpdateLayerStatistics('berlin_plz_segments','soldner_segment');
--
SELECT DateTime('now'),'show Layer-Statistics: ONLY when all value are NOT empty, is this a valid table for geopaparazzi!';
SELECT * FROM vector_layers_statistics WHERE ((table_name='berlin_plz_segments') AND (geometry_column = 'soldner_segment'));
----
SELECT DateTime('now'),'import_shapefile.sql [finished] [Habe fertig!]';
----
