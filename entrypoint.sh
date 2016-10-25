#!/bin/bash
set -e

eval "$(rbenv init -)"

exec "$@"
