#!/usr/bin/env bash

mkdir -p /var/lib/mysql-cluster

## start
exec ndbd \
  --nodaemon \
  "$@"
