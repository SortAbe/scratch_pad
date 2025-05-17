#!/bin/bash


mysql -e "select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA like 'DB_NAME'"


for table in $(mysql -e "select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA like 'ips'" | awk 'NR>1{print}');do
    echo $table
    mysql -e "select * from ips.$table;" | grep -i "hivelocity"
done

db='zcf_finaldata'
for table in $(mysql -e "select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA like \"$db\"" | awk 'NR>1{print}');do
    echo $table;
    mysql -e "REPAIR TABLE $db.$table;";
done

mysql -e "select TABLE_SCHEMA, TABLE_NAME from information_schema.TABLES where TABLE_NAME like \"wp_defender_lockout\"";
mysql -e "REPAIR TABLE dash240_wp_oz1yu.ngyyg_defender_lockout;";

for db in $(mysql -e "select TABLE_SCHEMA from information_schema.TABLES where TABLE_NAME like \"wp_defender_lockout\"" | awk 'NR>1{print}');do
    echo $db;
    mysql -e "REPAIR TABLE $db.wp_defender_lockout;";
done
