#!/bin/sh

set -exo pipefail

update-ca-certificates
wait-service --tcp $AWAITED_ENDPOINT -- echo "'$AWAITED_ENDPOINT' is up. Booting..."

exec "$@"
