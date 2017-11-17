#!/bin/bash

NAME=bacula-$(date +%Y-%m-%d_%H-%M-%S).sql.gz

/usr/bin/mysqldump -f --opt -uroot -p******* bacula | /usr/bin/gzip > /home/bacula/$NAME

#Copy to DC1
/usr/bin/smbclient //SRV-DC1.ROOST.LOCAL/BACKUP_LINUX$ -A /home/bacula/.smbclient -c "cd bacula; lcd /root; prompt; recurse; mput $NAME; exit;"
#/usr/bin/smbclient //SRV-DC1.ROOST.LOCAL/BACKUP_LINUX$ -A /root/.smbclient -c "cd bacula; lcd /root; prompt; recurse; mput 123.txt; exit;"

rm /home/bacula/$NAME
