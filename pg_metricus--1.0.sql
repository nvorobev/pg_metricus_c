/* pg_metricus--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_metricus" to load this file. \quit

CREATE OR REPLACE FUNCTION send_metric(text)
RETURNS void
AS 'pg_metricus','send_metric'
LANGUAGE c IMMUTABLE STRICT;
