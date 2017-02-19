MODULES = pg_metricus
EXTENSION = pg_metricus
DATA = pg_metricus--1.0.sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
