-- DROP USER sec1;

CREATE USER sec1 WITH
  LOGIN
  SUPERUSER
  NOINHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION;

CREATE DATABASE app_security1
    WITH 
    OWNER = sec1
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

	-- DROP SCHEMA security1 ;

CREATE SCHEMA security1
    AUTHORIZATION sec1;

GRANT ALL ON SCHEMA security1 TO sec1;	

ALTER USER sec1 SET search_path TO security1;

