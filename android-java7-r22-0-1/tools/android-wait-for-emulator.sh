#!/bin/bash

# Originally written by Ralf Kistner <ralf@embarkmobile.com>, but placed in the public domain

set +e

bootanim=""
failcounter=0
until [[ "$bootanim" =~ "running" ]]; do
   bootanim=`adb -e shell getprop init.svc.bootanim 2>&1`
   echo "Just try one time"
   echo "$bootanim"
   if [[ "$bootanim" =~ "not found" ]]; then
      let "failcounter += 1"
      if [[ $failcounter -gt 600 ]]; then
        echo "Failed to start your emulator"
        exit 1
      fi
   fi
   sleep 1
done
echo "Done"
