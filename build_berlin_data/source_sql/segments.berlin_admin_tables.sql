SELECT DateTime('now'),'-I-> ignore: *** charset ERROR *** cannot convert from ''UTF8;'' to ''UTF-8''';
SELECT DateTime('now'),'segments.berlin_admin_tables.sql [begin] -with "BEGIN" and "COMMIT"';
SELECT DateTime('now'),'sample(without'';''): .read ../source_sql/segments.berlin_admin_tables.sql UTF8';
BEGIN;
SELECT DateTime('now'),'DROPING tables/views IF EXISTS.';
DROP TABLE IF EXISTS berlin_admin;
DROP VIEW IF EXISTS berlin_admin_changed_name;
DROP VIEW IF EXISTS berlin_admin_changed_belongs;
DROP VIEW IF EXISTS berlin_admin_changed_borders;
SELECT DateTime('now'),'CREATEing berlin_admin tables with PRIMARY KEY.';
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
COMMIT;
--note: this MUST be done after any possible DROPS,otherwise the original ATTACHED.table will be DROPed
SELECT DateTime('now'),'ATTACH DATABASE "../source_db/berlin_administration.db" AS admin;';
ATTACH DATABASE "../source_db/berlin_administration.db" AS admin;
SELECT DateTime('now'),'2014-01-22: Path to db is relative from where the script is called from - NOT where is read from.';
SELECT DateTime('now'),'INSERTing data from admin.berlin_admin INTO berlin_admin table.';
BEGIN;
INSERT INTO berlin_admin
SELECT * FROM admin.berlin_admin ORDER BY id_admin,valid_since,valid_until,changed_type;
COMMIT;
-- cannot DETACH database within transaction
SELECT DateTime('now'),'DETACH DATABASE: ../source_db/berlin_administration.db';
DETACH DATABASE admin;
BEGIN;
SELECT DateTime('now'),'CREATEing admin views.';
CREATE VIEW berlin_admin_changed_name AS
 SELECT 
 id_admin,valid_since,valid_until,name,id_belongs_to,belongs_to,admin_level,changed_type
 FROM berlin_admin 
 WHERE changed_type =1 
 ORDER BY id_admin,valid_since;
CREATE VIEW berlin_admin_changed_belongs AS
 SELECT * FROM berlin_admin 
 WHERE
 (
  (changed_type=2) AND
  (id_belongs_to NOT IN (1911000004,1911000005,1911000006,1911000009))
 )
 ORDER BY id_admin,valid_since;
CREATE VIEW berlin_admin_changed_borders AS
 SELECT * FROM berlin_admin WHERE changed_type=3 ORDER BY id_admin,valid_since;
---
COMMIT;
SELECT DateTime('now'),'segments.berlin_admin_tables.sql [finished]';
---
