#!/usr/bin/env bash

mkdir -p /var/lib/mysql-cluster

echo -en "$CONFIG" > /var/lib/mysql-cluster/config.ini
unset CONFIG

## start
exec ndb_mgmd \
  --nodaemon \
  --config-file=/var/lib/mysql-cluster/config.ini \
  "$@"
