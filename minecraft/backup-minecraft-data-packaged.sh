#! /bin/bash

# make backup folder on synology share if folder not exists
if [ ! -d /mnt/synology/volume1/backup/minecraft_backup/ ]; then
mkdir -p /mnt/synology/volume1/backup/minecraft_backup/;
fi

# make tar.gz package and output to network share
tar -czvf "/mnt/synology/volume1/backup/minecraft_backup/$minecraft_data_$(date +%Y%m%d).tar.gz" /projects/docker-minecraft-server/minecraft_data

