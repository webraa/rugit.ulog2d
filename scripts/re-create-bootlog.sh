#!/bin/sh

sudo rm -vf /var/log/ulog/bootlog-sqlt3.db
sudo ls
sudo sqlite3 /var/log/ulog/bootlog-sqlt3.db < ./sqlt3-schm/bootlog-table.schema
