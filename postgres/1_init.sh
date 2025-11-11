#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD
psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    create user opalroot with encrypted password '$OPAL_PG_PASSWORD';
    create user opal with encrypted password '$OPAL_PG_PASSWORD'; 
    
    create database opal_data;
    alter database opal_data owner to opalroot;
    create database opal_id;
    alter database opal_id owner to opalroot;
    
    grant connect on database opal_id to opal;
    grant create on database opal_id to opal;
    grant connect on database opal_data to opal;
    grant create on database opal_data to opal;

    create database seeddb;
    alter database seeddb owner to opalroot;
    grant connect on database seeddb to opal;
    grant create on database seeddb to opal;
EOSQL
