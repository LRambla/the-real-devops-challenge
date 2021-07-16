#!/bin/bash

mongoimport --uri=mongodb://0.0.0.0:27017 \
            --db database --collection restaurant --type json --file /docker-entrypoint-initdb.d/restaurant.json
