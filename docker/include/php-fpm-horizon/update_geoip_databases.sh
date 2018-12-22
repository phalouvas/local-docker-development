#!/bin/bash
#
#
#


DAT_DIR="/code_smsto/storage/app/geoip2"
DAT_URLS="http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz"

# Create directory if not exist
mkdir -p $DAT_DIR

# Run Backup
#for FILE in $DAT_DIR/*.dat; do
#    cp $FILE $FILE.bak
#done;

# Download geoip database
for URL in $DAT_URLS; do
    FILE=${URL##*/}
    curl $URL | gunzip > $DAT_DIR/${FILE%.gz}
    #echo $URL $DAT_DIR/${FILE%.gz}
done;