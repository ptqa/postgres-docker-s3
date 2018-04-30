#!/bin/bash
if [ -n "${S3_DUMP}" ]; then
  aws s3 cp $S3_DUMP /docker-entrypoint-initdb.d/dump.sql 1>&2 > /dev/null
  sed -i '/CREATE ROLE postgres;/d' /docker-entrypoint-initdb.d/dump.sql
  sed -i '/ALTER ROLE postgres/d' /docker-entrypoint-initdb.d/dump.sql
  chown -R postgres  /docker-entrypoint-initdb.d/dump.sql
fi
