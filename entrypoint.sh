#!/bin/sh

echo "Calling update-ca-certificates..."
update-ca-certificates
echo "Waiting for $AWAITED_ENDPOINT to become available..."
wait-service --tcp $AWAITED_ENDPOINT -- echo "'$AWAITED_ENDPOINT' is now available. Continuing..."

exec "$@"
