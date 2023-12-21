#!/bin/sh
set -e

while true; do
	clear
	sudo sqlite3 $1 < $2
	sleep 1
done

