#!/bin/bash
set -e

echo "$ adb devices"
adb devices

DEVICE=`adb devices | grep -m1 "device$" | cut -f1`

if [[ -z "$DEVICE" ]]
then
    echo "Device is not ready"
    read -rsp $'Press any key to continue...\n' -n1 key
    exit
fi

IP=`adb -d shell ifconfig wlan0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`
echo "Device's IP address: $IP"

echo ""

if [[ -z "$IP" ]]
then
    echo "Device's IP address could not be found"
    read -rsp $'Press any key to continue...\n' -n1 key
    exit
fi

echo "$ adb -s ${DEVICE} tcpip 5555"
adb -s ${DEVICE} tcpip 5555 || exit

echo ""
sleep 1

echo "$ adb connect $IP:5555"
adb connect "$IP" || exit

echo ""
sleep 1

echo "$ adb devices"
adb devices
