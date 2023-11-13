#!/bin/sh


echo 'lets.. do it!!'

sudo sqlite3 /var/log/ulog/main-sqlt3.db < ./sqlt3-schm/field-set.schema
sudo sqlite3 /var/log/ulog/bootlog-sqlt3.db < ./sqlt3-schm/field-set.schema
