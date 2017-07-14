#!/bin/bash

addgroup --gid ${GID} blynk
useradd -m -s /bin/bash -g blynk -u ${UID} blynk

chown -R blynk:blynk /blynk
chown -R blynk:blynk /data
chown -R blynk:blynk /config

chpst -u blynk:blynk -- bash -c 'java -jar /blynk/server.jar -dataFolder /data -serverConfig /config/server.properties -mailConfig /config/mail.properties'
