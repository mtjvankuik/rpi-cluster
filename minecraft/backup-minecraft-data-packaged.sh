#! /bin/bash

echo "Nightly Backup Started: $(date)" >> /tmp/mybackup.log

# make backup folder on synology share if folder not exists
if [ ! -d /mnt/synology/volume1/backup/minecraft_backup/ ]; then
mkdir -p /mnt/synology/volume1/backup/minecraft_backup/;
fi

# make tar.gz package and output to network share
tar -czvf "/mnt/synology/volume1/backup/minecraft_backup/$minecraft_data_$(date +%Y%m%d).tar.gz" /projects/docker-minecraft-server/minecraft_data

# remove old backup - rolling time window of 31 days
rm -f "/mnt/synology/volume1/backup/minecraft_backup/$minecraft_data_$(date -d "$today - 31 days" +%Y%m%d).tar.gz"

echo "Nightly Backup Finished: $(date)" >> /tmp/mybackup.log
