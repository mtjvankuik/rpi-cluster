#! /bin/bash

echo "Nightly Backup Started: $(date)" >> /tmp/mybackup.log

# make backup folder on synology share if folder not exists
if [ ! -d /mnt/backup/terraria_backup/ ]; then
mkdir -p /mnt/backup/terraria_backup/;
fi

# make tar.gz package and output to network share
tar -czvf "/mnt/backup/terraria_backup/$terraria_data_$(date +%Y%m%d).tar.gz" /root/terraria
zip -r "/mnt/backup/terraria_backup/$terraria_data_$(date +%Y%m%d).zip" /root/terraria

# remove old backup - rolling time window of 31 days
rm -f "/mnt/backup/terraria_backup/$terraria_data_$(date -d "$today - 31 days" +%Y%m%d).tar.gz"
rm -f "/mnt/backup/terraria_backup/$terraria_data_$(date -d "$today - 31 days" +%Y%m%d).zip"

echo "Nightly Backup Finished: $(date)" >> /tmp/mybackup.log
