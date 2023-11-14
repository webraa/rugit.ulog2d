#!/bin/sh

path=$(pwd)

sudo rm -vf /var/log/ulog/bootlog-sqlt3.db
sudo cat $path/sqlt3-schm/bootlog-table.schema
sudo sqlite3 /var/log/ulog/bootlog-sqlt3.db < $path/sqlt3-schm/bootlog-table.schema
