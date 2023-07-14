#!/bin/sh

wait-service --tcp $AWAITED_ENDPOINT -- $@
