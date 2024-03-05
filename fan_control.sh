#!/bin/bash

echo "23" > /sys/class/gpio/export
sleep 1
echo "out" > /sys/class/gpio/gpio23/direction

while true
do
temp=$(vcgencmd measure_temp | egrep -o "[0-9]{2}")
  if [[ $temp -le 50 ]]; then
    echo "0" > /sys/class/gpio/gpio23/value
  else
    echo "1" > /sys/class/gpio/gpio23/value
    sleep 300
  fi
sleep 10
done
