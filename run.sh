#!/bin/bash

bundle

db:migrate
# db:seed

rm /products/tmp/pids/*.pid

rails s -b 0.0.0.0 -p 3000

