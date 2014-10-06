mysql_backups
=============
mysql_backup.sh is a bash shell script that is meant to be added to the utility linux user account 
crontab to regularly run mysqldump and also keep only the latest 5 days worth of dumps.  

Make sure your email address is correctly input into the ‘on error’ line segment in the crontab so you will 
get an email alert if mysqldump fails.
