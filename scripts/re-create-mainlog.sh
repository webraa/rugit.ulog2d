#!/bin/sh

sudo rm -vf /var/log/ulog/mainlog-sqlt3.db
sudo sqlite3 /var/log/ulog/mainlog-sqlt3.db < ./sqlt3-schm/mainlog.schema
