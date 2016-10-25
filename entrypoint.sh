#!/bin/bash
set -e

eval "$(rbenv init -)"

bundle

exec "$@"
