#! /bin/bash
backup_install_path='/Users/erik/Documents'

DBUSER=$1
DBPASS=$2
DBNAME=$3
DBHOST=$4

SUFFIX=$(date +%Y-%m-%d__%H:%M:%S)


cd $backup_install_path/mysql_backup_cron/

mysqldump --opt -u $DBUSER -p$DBPASS -h $DBHOST $DBNAME > db_archive/$DBNAME.$SUFFIX.sql 
tar czvf db_archive/$DBNAME.$SUFFIX.tar.gz db_archive/$DBNAME.$SUFFIX.sql
rm db_archive/$DBNAME.$SUFFIX.sql

# now run the pruning script to remove db dumps older than 5 days.
. ./keep_5_day_files.sh
