-- from https://www.gaia-gis.it/fossil/libspatialite/wiki?name=writable-view
-- spatialite Updatable_Views_0.db < Updatable_Views.sql
--- without the sql for the triggers
-- spatialite Updatable_Views_1.db < Updatable_Views.sql
--- with read_only=0
-- spatialite Updatable_Views_2.db < Updatable_Views.sql
--- with read_only=1
SELECT DateTime('now'),'Updatable_Views.sql [begin]';
CREATE TABLE headquarter 
(
 hq_id INTEGER NOT NULL PRIMARY KEY,
 hq_name TEXT NOT NULL,
 hq_manager TEXT NOT NULL,
 hq_ip_addr TEXT NOT NULL
);
INSERT INTO headquarter
 (hq_id,hq_name,hq_manager,hq_ip_addr) 
 VALUES(1,'Rome','Mario Rossi','257.257.257.1');
INSERT INTO headquarter
 (hq_id,hq_name,hq_manager,hq_ip_addr) 
 VALUES(2,'London','John Smith','258.258.258.23');
INSERT INTO headquarter
 (hq_id,hq_name,hq_manager,hq_ip_addr) 
 VALUES(3,'Paris','Paul Dupont','34.17.258.259');
CREATE TABLE store 
(
 st_id INTEGER NOT NULL PRIMARY KEY,
 st_name TEXT NOT NULL,
 st_contact TEXT NOT NULL,
 st_ip_addr TEXT NOT NULL,
 hq_id INTEGER NOT NULL,
 CONSTRAINT fk_store_hq FOREIGN KEY (hq_id) REFERENCES headquarter (hq_id)
);
SELECT AddGeometryColumn('store','geom',4326,'POINT','XY');
-- the demo on https://www.gaia-gis.it/fossil/libspatialite/wiki?name=writable-view
-- does not meantion, that this too, must be done
SELECT DateTime('now'),'calling CreateSpatialIndex: needed for geopaparazzi';
SELECT CreateSpatialIndex('store','geom');
INSERT INTO store
 (st_id,st_name,st_contact,st_ip_addr,hq_id,geom) 
 VALUES(1,'ABC Srl','Paolo Bianchi','258.1.1.23',1,MakePoint(11.1,42.2,4326));
INSERT INTO store
 (st_id,st_name,st_contact,st_ip_addr,hq_id,geom) 
 VALUES(2,'Chez Marcel','Marcel Dubois','260.1.23.257',3,MakePoint(2.1,48.5,4326));
INSERT INTO store
 (st_id,st_name,st_contact,st_ip_addr,hq_id,geom) 
 VALUES(3,'ACME Plc','Janet White','251.23.258.257',2,MakePoint(-0.1,51.2,4326));
---
SELECT DateTime('now'),'creating view: store_view';
CREATE VIEW store_view AS
SELECT 
 a.ROWID AS ROWID, 
 a.st_id AS st_id,
 a.st_name AS st_name, 
 a.st_contact AS st_contact,
 a.st_ip_addr AS st_ip_addr, 
 a.hq_id AS hq_id,
 a.geom AS geom
FROM store AS a
JOIN headquarter AS b USING (hq_id);
---
-- read_only=0 ; spatialindex=0
---
SELECT DateTime('now'),'inserting view: to views_geometry_columns';
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES ('store_view','geom','rowid','store','geom',0);
-- 
SELECT DateTime('now'),'creating triggers for writable view: store_view';
CREATE TRIGGER vw_ins_store_view INSTEAD OF INSERT ON store_view
BEGIN
INSERT OR REPLACE INTO store 
 (st_id,st_name,st_contact,st_ip_addr,hq_id,geom)
 VALUES(NEW.st_id,NEW.st_name,NEW.st_contact,NEW.st_ip_addr,NEW.hq_id,NEW.geom);
END;
---
CREATE TRIGGER vw_upd_store_view 
 INSTEAD OF UPDATE OF 
 st_id,st_name,st_contact,st_ip_addr,hq_id,geom ON store_view
BEGIN
UPDATE store SET 
 st_id = NEW.st_id, 
 st_name = NEW.st_name, 
 st_contact = NEW.st_contact, 
 st_ip_addr = NEW.st_ip_addr, 
 hq_id = NEW.hq_id, 
 geom = NEW.geom
WHERE ROWID = OLD.ROWID;
END;
---
CREATE TRIGGER vw_del_store_view 
 INSTEAD OF DELETE ON 
 store_view
BEGIN
 DELETE FROM store WHERE ROWID = OLD.ROWID;
END;
---
SELECT DateTime('now'),'SELECT data: store_view';
SELECT * FROM store_view;
SELECT DateTime('now'),'INSERT,UPDATE, DELETE: store_view';
-- Error (without trigger): near line 62: cannot modify store_view because it is a view
-- 3 records
INSERT INTO store_view 
 (st_id,st_name,st_contact,st_ip_addr,hq_id, geom)
 VALUES(4,'da Marino','Marino Neri','258.1.1.57',1,MakePoint(12.3,44.1,4326));
INSERT INTO store_view 
 (st_id,st_name,st_contact,st_ip_addr,hq_id, geom)
 VALUES(5,'F.lli Verdi','Giuseppe Verdi','258.1.1.198',1,MakePoint(11.3,43.2,4326));
-- 5 records
UPDATE store_view SET st_contact = 'Paulette Laloux' WHERE st_id = 2;
DELETE FROM store_view WHERE st_id = 1; 
-- 4 records
SELECT DateTime('now'),'SELECT data: store_view';
SELECT * FROM store_view;
---
SELECT DateTime('now'),'creating view: store_view2';
CREATE VIEW store_view2 AS
SELECT 
 a.ROWID AS ROWID,
 a.st_id AS st_id,
 a.st_name AS st_name,
 a.st_contact AS st_contact,
 a.st_ip_addr AS st_ip_addr,
 a.hq_id AS hq_id,
 a.geom AS geom,
 b.hq_name AS hq_name,
 b.hq_manager AS hq_manager,
 b.hq_ip_addr AS hq_ip_addr
FROM store AS a
JOIN headquarter AS b USING (hq_id);
---
SELECT DateTime('now'),'inserting view: to views_geometry_columns';
INSERT INTO views_geometry_columns
 (view_name,view_geometry,view_rowid,f_table_name,f_geometry_column,read_only)
 VALUES('store_view2','geom','rowid','store','geom',0);
---
SELECT DateTime('now'),'creating triggers for writable view: store_view2';
CREATE TRIGGER vw_ins_store_view2
 INSTEAD OF INSERT ON 
 store_view2
BEGIN
 INSERT OR REPLACE INTO headquarter
  (hq_id,hq_name,hq_manager,hq_ip_addr)
  VALUES(NEW.hq_id,NEW.hq_name,NEW.hq_manager,NEW.hq_ip_addr);
 INSERT INTO store 
  (st_id,st_name,st_contact,st_ip_addr,hq_id,geom)
  VALUES(NEW.st_id,NEW.st_name, NEW.st_contact,NEW.st_ip_addr,NEW.hq_id,NEW.geom);
END;
---
CREATE TRIGGER vw_upd_store_view2 
 INSTEAD OF UPDATE OF
 st_id,st_name,st_contact,st_ip_addr,hq_id,geom,hq_name,hq_manager,hq_ip_addr ON store_view2
BEGIN
 UPDATE headquarter SET    
  hq_name = NEW.hq_name,
  hq_manager = NEW.hq_manager,
  hq_ip_addr = NEW.hq_ip_addr 
 WHERE hq_id = NEW.hq_id;
 UPDATE store SET 
  st_id = NEW.st_id,
  st_name = NEW.st_name,
  st_contact = NEW.st_contact,
  st_ip_addr = NEW.st_ip_addr,
  hq_id = NEW.hq_id,geom = NEW.geom
 WHERE ROWID = OLD.ROWID;
END;
---
CREATE TRIGGER vw_del_store_view2 
 INSTEAD OF DELETE ON store_view2
BEGIN
 DELETE FROM store WHERE ROWID = OLD.ROWID;
END;
---
SELECT DateTime('now'),'SELECT data: store_view2';
SELECT * FROM store_view2;
-- 4 records
---
SELECT DateTime('now'),'INSERT,UPDATE, DELETE: store_view2';
INSERT INTO store_view2 
 (st_id, st_name,st_contact,st_ip_addr,hq_id,hq_name,hq_manager,hq_ip_addr, geom)
 VALUES (6,'SmartDevices Ltd','George Hunter','258.258.3.198',4,'Dublin','Brendan O''Hara','258.258.72.1',MakePoint(-6.3,43.2,4326));
UPDATE store_view2 SET hq_manager = 'Luisa Fabbri' WHERE hq_id = 1;
DELETE FROM store_view2 WHERE st_id = 4;
-- 4 records - with 6 added and 4 deleted
SELECT DateTime('now'),'SELECT data: store_view2';
SELECT * FROM store_view2;
---
SELECT DateTime('now'),'Updatable_Views.sql [finished]';
---
