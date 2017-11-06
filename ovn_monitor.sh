#!/bin/sh
killall ovsdb-client
IP=$(ps ax | grep ovsdb-server | grep ptcp | head -n 1 | cut -d\: -f 10 | cut -d\  -f 1)
nohup sh -c "ovsdb-client monitor tcp:$IP:6642 ALL  | while read line; do echo \"\$(date +%Y-%m-%d\ %H:%M:%S.%03N) SBDB \$line\"; done > /home/heat-admin/sbdb.log" &
nohup sh -c "ovsdb-client monitor tcp:$IP:6641 ALL  | while read line; do echo \"\$(date +%Y-%m-%d\ %H:%M:%S.%03N) NBDB \$line\"; done > /home/heat-admin/nbdb.log"
