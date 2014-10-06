#! /bin/bash

backup_install_path='/Users/erik/Documents' # no slash at the end of this string
delete_files_after_x_days='4'

if /usr/bin/find $backup_install_path/mysql_backup_cron/db_archive/. -mtime +$delete_files_after_x_days -name '*.tar.gz' -exec /bin/rm -fv '{}' ';'
	then /usr/bin/touch -am $backup_install_path/mysql_backup_cron/db_archive/cronstatus
fi

echo '\nSupport Backup Directory Listing:\n'
ls -lh $backup_install_path/mysql_backup_cron/db_archive/

if ! find $backup_install_path/mysql_backup_cron/db_archive/. -iname '*.tar.gz' -mtime 0
	then echo 'No mysql backup file found for today'
fi


