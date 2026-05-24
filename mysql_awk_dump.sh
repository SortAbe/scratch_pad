#!/bin/bash

mysql -e 'select table_name, (data_length+index_length) as "size" from information_schema.tables where table_schema = "learning_mood150" order by size;' \
    | awk '{print "echo dumping " $1";"} \
     $2<24834473984{print "mysqldump learning_mood150 " $1 " >>/root/small_tables.sql;"}\
     $2>=24834473984{print "mysqldump --max_allowed_packet=512M learning_mood150 " $1 " >/root/"$1".sql;"}'
