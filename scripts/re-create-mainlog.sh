#!/bin/sh

path=$(pwd)

sudo rm -vf /var/log/ulog/mainlog-sqlt3.db
sudo sqlite3 /var/log/ulog/mainlog-sqlt3.db < $path/sqlt3-schm/mainlog.schema
