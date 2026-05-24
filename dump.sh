#!/bin/sh

DBUSER=root
DBPASS='4XAk~(]IWDER'
BUDATE=`date +"%Y-%m-%d-%H-%M"`
BACKHOME=/home/kvr/dbbackups/databases
LOG=/home/kvr/dbbackups/log/master_databases_`date +%Y%m%d%A`

touch $LOG

echo "Please wait... exporting:"

echo "Database Backup Started: " `date` >>$LOG

cd $BACKHOME/

mkdir db_$BUDATE

DB=kvroauth
echo "$DB ..."
echo "Dumping database: $DB" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB | gzip > $BACKHOME/db_$BUDATE/$DB.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

DB=mediakit
echo "$DB ..."
echo "Dumping database: $DB" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB | gzip > $BACKHOME/db_$BUDATE/$DB.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

DB=kvrdb
echo "$DB ..."
echo "Dumping database: $DB" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB --ignore-table=kvrdb.my_api_reports --ignore-table=kvrdb.svk_api_cache_changes --ignore-table=kvrdb.svk_orders --ignore-table=kvrdb.my_api_log --ignore-table=kvrdb.svk_searched --ignore-table=kvrdb.svk_viewed --ignore-table=kvrdb.countries_ips --ignore-table=kvrdb.type_31_emails --ignore-table=kvrdb.my_snapshots_products --ignore-table=kvrdb.my_api_version_log | gzip > $BACKHOME/db_$BUDATE/$DB.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

TBLS="my_api_reports svk_api_cache_changes svk_orders my_api_log svk_searched svk_viewed countries_ips type_31_emails my_snapshots_products my_api_version_log"

for TBL in $TBLS
do
  echo "$DB $TBL table only..."
  echo "Dumping database: $DB $TBL table only" >>$LOG 2>>$LOG
  /usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB $TBL | gzip > $BACKHOME/db_$BUDATE/$DB-$TBL-only.sql.gz
  echo "Done"
  echo "Done" >>$LOG 2>>$LOG
done

DB=phpbb
echo "$DB ..."
echo "Dumping database: $DB" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB --ignore-table=phpbb.phpbb_posts --ignore-table=phpbb.phpbb_privmsgs --ignore-table=phpbb.phpbb_qa_confirm --ignore-table=phpbb.phpbb_topics_track --ignore-table=phpbb.phpbb_notifications --ignore-table=phpbb.phpbb_user_notifications --ignore-table=phpbb.phpbb_users | gzip > $BACKHOME/db_$BUDATE/$DB.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_users table only..."
echo "Dumping database: $DB phpbb_users table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_users | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_users-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_user_notifications table only..."
echo "Dumping database: $DB phpbb_user_notifications table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_user_notifications | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_user_notifications-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_notifications table only..."
echo "Dumping database: $DB phpbb_notifications table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_notifications | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_notifications-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_topics_track table only..."
echo "Dumping database: $DB phpbb_topics_track table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_topics_track | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_topics_track-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_qa_confirm table only..."
echo "Dumping database: $DB phpbb_qa_confirm table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_qa_confirm | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_qa_confirm-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_privmsgs table only..."
echo "Dumping database: $DB phpbb_privmsgs table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_privmsgs | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_privmsgs-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

echo "$DB phpbb_posts table only..."
echo "Dumping database: $DB phpbb_posts table only" >>$LOG 2>>$LOG
/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB phpbb_posts | gzip > $BACKHOME/db_$BUDATE/$DB-phpbb_posts-only.sql.gz
echo "Done"
echo "Done" >>$LOG 2>>$LOG

#DB=kvrdb
#echo "$DB svk_api_log table only..."
#echo "Dumping database: $DB svk_api_log table only" >>$LOG 2>>$LOG
#/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB svk_api_log | gzip > $BACKHOME/db_$BUDATE/$DB-svk_api_log-only.sql.gz
#echo "Done"
#echo "Done" >>$LOG 2>>$LOG

#DB=kvrlog
#echo "$DB ..."
#echo "Dumping database: $DB" >>$LOG 2>>$LOG
#/usr/bin/mysqldump --opt --quote-names -u $DBUSER -p$DBPASS $DB | gzip > $BACKHOME/db_$BUDATE/$DB.sql.gz
#echo "Done"
#echo "Done" >>$LOG 2>>$LOG

echo "Done: " `date` >>$LOG 2>>$LOG

mail -s "KVR MASTER Databases Backup `date +%Y%m%d` `date +%A`"  ben@kvraudio.com < $LOG

echo "Done"
