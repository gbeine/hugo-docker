#!/bin/sh

set -eux

if [ -z ${HUGO_REPO+x} ]; then
    echo "Please set HUGO_REPO to cloneable git repository URL"
    exit 1
fi

if [ ! -d /hugo/.git ]; then
    cd /hugo && git clone --recurse-submodules "${HUGO_REPO}" .
fi

cd /hugo && exec hugo "$@"
