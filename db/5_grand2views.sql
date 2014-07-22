-- перед выполнением обновить базу в pgAdmin
GRANT SELECT ON TABLE geography_columns TO openlandusers;
GRANT SELECT ON TABLE geography_columns TO openlandadmin;

GRANT SELECT ON TABLE geometry_columns TO openlandusers;
GRANT SELECT ON TABLE geometry_columns TO openlandadmin;

GRANT SELECT ON TABLE raster_columns TO openlandusers;
GRANT SELECT ON TABLE raster_columns TO openlandadmin;

GRANT SELECT ON TABLE raster_overviews TO openlandusers;
GRANT SELECT ON TABLE raster_overviews TO openlandadmin;
