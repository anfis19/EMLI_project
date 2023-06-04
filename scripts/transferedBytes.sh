#!/bin/bash
recieve=$(cat /proc/net/dev | awk '/wlan0/{print $2}')
transmit=$(cat /proc/net/dev | awk '/wlan0/{print $10}')
echo -n $(($recieve + $transmit))
