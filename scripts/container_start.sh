#!/usr/bin/env bash

mv config/database.yml.docker config/database.yml;

bundle exec rails s -p 3000 -b '0.0.0.0' -E $RAILS_ENV;
