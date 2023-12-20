#!/bin/sh

sudo rm -vf /var/log/ulog/alterlog-sqlt3.db
sudo sqlite3 /var/log/ulog/alterlog-sqlt3.db < ./sqlt3-schm/alterlog-table.schema
