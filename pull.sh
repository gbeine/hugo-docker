#!/bin/sh

set -eux

if [ -d /hugo/.git ]; then
    cd /hugo && git pull --recurse-submodules
fi
