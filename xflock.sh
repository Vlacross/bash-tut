#!/bin/bash

(
 flock -xn 200
 trap 'rm /var/lock/lockfile' 0
 REVAL=$?
 if [ $RETVAL -eq 1 ]; then
  echo $RETVAL
  exit 1
 else
  echo "sleeping"
  sleep 10
fi
) 200>/var/lock/lockfile

