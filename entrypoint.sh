#!/bin/sh
set -e

sdkmanager \
--query interactive \
--logintype devzone

exec "$@"

