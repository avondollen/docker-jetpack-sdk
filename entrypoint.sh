#!/bin/sh
set -e

sdkmanager \
--cli install \
--logintype devzone \
--product Jetson \
--version 4.3 \
--targetos Linux \
--host \
--target P3310 \
--flash \
--license accept

exec "$@"

