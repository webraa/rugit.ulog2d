#!/bin/sh

sudo sqlite3 /var/log/ulog/mainlog-sqlt3.db < ./sqlt3-schm/mainlog.schema
