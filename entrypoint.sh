#!/bin/bash
set -e

bundle

# rake db:migrate
# rake db:seed

if [ -e /products/tmp/pids/*.pid ]; then rm /products/tmp/pids/*.pid; fi

exec "$@"
