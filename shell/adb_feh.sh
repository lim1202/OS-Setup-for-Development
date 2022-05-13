#!/bin/bash
set -e

# using adb.exe (windows version) in WSL 
# function adb() {
#  /mnt/c/Apps/platform-tools/adb.exe $*
# }

printf "Auto Tap for Fire Emblem Heros v4.4.1 2020-04-25\n"

# $1: Map Type is grand or rival(default)
# $2: Device IP if use wifi debug

# Screen Resolution: 1080 x 1920
CENTER_X=540
CENTER_Y=960
SKIP_X=900
SKIP_Y=60
RB_X=1060
RB_Y=1660
GRAND_RESULT_Y=1660
AUTO_BATTLE_X=840
AUTO_BATTLE_Y=1820

printf "\n"

if [[ -z "$2" ]]
then
    adb devices
else
    adb connect "$2:5555"
    printf "\n"
    sleep 3
fi

DEVICE=`adb devices | grep -m1 "device$" | cut -f1`

if [[ -z "$DEVICE" ]]
then
    printf "Device not found!\n"
    exit
fi

TYPE=${1:-"RIVAL"}
TYPE=${TYPE^^}

if [[ $TYPE == "GRAND" ]]
then
    printf "Grand Hero Battle\n"
    CONFIRM_MAP_POS_Y=1160
    CANCEL_MAP_POS_Y=1320
elif [[ $TYPE == "RIVAL" ]]
then
    printf "Rival Domains\n"
    CONFIRM_MAP_POS_Y=1460
    CANCEL_MAP_POS_Y=1560
else
    printf "Map type missing or invalid!\n"
    exit
fi

COUNTER=0

while : 
do
    COUNTER=$((COUNTER+1))

    printf "Stage $COUNTER\n"
    printf "================\n"

    sleep 1

    adb -s ${DEVICE} shell input tap $CENTER_X $CENTER_Y || exit
    printf "Select Map\n"

    adb -s ${DEVICE} shell input tap $CENTER_X $CONFIRM_MAP_POS_Y || exit
    # printf "Confirm"

    printf "Now Loading... "
    sleep 10 # time interval base on network status

    if [[ $TYPE == "GRAND" ]]
    then
        adb -s ${DEVICE} shell input tap $SKIP_X $SKIP_Y || exit
        printf "Skip\n"
    fi
        
    sleep 5 # Loading map

    printf "Done\n"

    adb -s ${DEVICE} shell input tap $AUTO_BATTLE_X $AUTO_BATTLE_Y || exit
    printf "Auto Battle\n"

    # sleep 1

    adb -s ${DEVICE} shell input tap $CENTER_X $CENTER_Y || exit
    # printf "Confirm\n"

    printf "Now Loading... "
    sleep 10
    printf "Done\n"

    adb -s ${DEVICE} shell input tap $SKIP_X $SKIP_Y || exit
    printf "Stage Clear!\n"

    printf "Now Loading... "
    sleep 5 # time interval base on network status
    printf "Done\n"

    if [[ $TYPE == "RIVAL" ]]
    then
        adb -s ${DEVICE} shell input tap $CENTER_X $GRAND_RESULT_Y || exit
        printf "Confirm Result\n"
    fi

    printf "================\n"

    sleep 1
done

printf "Done\n"
