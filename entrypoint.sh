#!/bin/bash
set -e

eval "$(rbenv init -)"

bundle

if [ -e /products/tmp/pids/*.pid ]; then rm /products/tmp/pids/*.pid; fi

exec "$@"
