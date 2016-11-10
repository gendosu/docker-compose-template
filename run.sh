#!/bin/bash

bundle

db:migrate
# db:seed

rails s -b 0.0.0.0 -p 3000

