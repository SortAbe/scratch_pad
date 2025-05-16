#!/usr/bin/env bash

for table in $(mysql -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA LIKE 'lostakey_157' AND ENGINE LIKE 'MyISAM';" | awk 'NR>1{print}');do
    mysql -e "ALTER TABLE lostakey_157.$table ENGINE=InnoDB"
done
