#! /bin/bash

echo "Nightly Backup Started: $(date)" >> /tmp/mybackup.log

# make backup folder on synology share if folder not exists
if [ ! -d /mnt/backup/minecraft_backup/ ]; then
mkdir -p /mnt/backup/minecraft_backup/;
fi

# make tar.gz package and output to network share
tar -czvf "/mnt/backup/minecraft_backup/$minecraft_data_$(date +%Y%m%d).tar.gz" /projects/docker-minecraft-server/minecraft_data
zip -v -r "/mnt/backup/minecraft_backup/$minecraft_data_$(date +%Y%m%d).zip" /projects/docker-minecraft-server/minecraft_data

# remove old backup - rolling time window of 31 days
rm -f "/mnt/backup/minecraft_backup/$minecraft_data_$(date -d "$today - 31 days" +%Y%m%d).tar.gz"
rm -f "/mnt/backup/minecraft_backup/$minecraft_data_$(date -d "$today - 31 days" +%Y%m%d).zip"

echo "Nightly Backup Finished: $(date)" >> /tmp/mybackup.log
