#!/bin/sh

addgroup -g ${GID} blynk
adduser -h /data -s /bin/sh -D -G blynk -u ${UID} blynk

chown -R blynk:blynk /blynk
chown -R blynk:blynk /data
chown -R blynk:blynk /config

chpst -u blynk -U blynk -- sh -c 'java -jar /blynk/server.jar -dataFolder /data -serverConfig /config/server.properties -mailConfig /config/mail.properties'
