#!/bin/bash

set -e

GENEREATE_CREDO_CHECK="lib/my_first_credo_check.ex"

mix compile --force --warnings-as-errors

mix credo --mute-exit-status
mix credo list --mute-exit-status
mix credo suggest --mute-exit-status

mix credo lib/credo/sources.ex:1:11 --mute-exit-status
mix credo explain lib/credo/sources.ex:1:11 --mute-exit-status

mix credo.gen.check $GENEREATE_CREDO_CHECK
rm $GENEREATE_CREDO_CHECK

mix credo.gen.config

mix credo categories
mix credo info
mix credo info --verbose
mix credo info --format=json
mix credo info --verbose --format=json
mix credo version
mix credo help

mix credo -v
mix credo -h


echo ""
echo "Smoke test succesful."
