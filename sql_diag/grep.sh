#!/bin/bash


mysql -e "select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA like 'DB_NAME'"


for table in $(mysql -e "select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA like 'ips'" | awk 'NR>1{print}');do
    echo $table
    mysql -e "select * from ips.$table;" | grep -i "hivelocity"
done

