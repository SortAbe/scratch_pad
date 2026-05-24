#!/usr/bin/env bash

db='cornish1_db';
for table in $(mysql -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA LIKE \"$db\" AND ENGINE LIKE 'MyISAM';" | awk 'NR>1{print}');do
    echo "$db.$table";
    mysql -e "ALTER TABLE $db.$table ENGINE=InnoDB";
done
