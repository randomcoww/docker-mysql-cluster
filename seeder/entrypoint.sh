#!/usr/bin/env bash

[[ ! -z $SQL ]] || exit 1

echo -en "$SQL" > /tmp/seed.sql

mysql \
  "$@" \
  --no-auto-rehash \
  --batch \
  < /tmp/seed.sql
