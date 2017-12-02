#!/usr/bin/env bash

rm -rf /var/run/mysqld/*
mysqld --initialize || true

echo -en "$INIT" > /etc/init.sql
unset INIT

## start
exec mysqld \
  --init-file=/etc/init.sql \
  "$@"
