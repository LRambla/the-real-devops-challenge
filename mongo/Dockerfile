FROM mongo:4.4.6

USER root

#Copy init script
COPY init.sh /docker-entrypoint-initdb.d/init.sh

# Copy data to our container
COPY /data/restaurant.json /docker-entrypoint-initdb.d/restaurant.json

# Expose DB port
EXPOSE 27017