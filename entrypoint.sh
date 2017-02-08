#!/bin/bash
# set -eu

#
# check Gemfile and Gemfile.lock update
#
GEMFILEPREV=`cat .gemfile.sha`
GEMFILELOCKPREV=`cat .gemfilelock.sha`
GEMFILESHA=`shasum Gemfile | awk '{print($1)}'`
GEMFILELOCKSHA=`shasum Gemfile.lock | awk '{print($1)}'`

echo "$GEMFILEPREV *Gemfile" | shasum -c -s -;
GEMFILESTATUS=$?
echo "$GEMFILELOCKPREV *Gemfile.lock" | shasum -c -s -;
GEMFILELOCKSTATUS=$?

if [ $GEMFILESTATUS -ne 0 -o $GEMFILELOCKSTATUS -ne 0 ] ; then
  echo fail
  bundle
fi

echo $GEMFILESHA > .gemfile.sha
echo $GEMFILELOCKSHA > .gemfilelock.sha

rake db:migrate

if [ -e /products/tmp/pids/*.pid ]; then rm /products/tmp/pids/*.pid; fi

exec "$@"
