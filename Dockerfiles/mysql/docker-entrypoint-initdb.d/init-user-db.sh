#!/bin/bash
set -e

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE example_development;
CREATE DATABASE example_test;
EOSQL

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -Dexample_development < /docker-entrypoint-initdb.d/example.dmp

