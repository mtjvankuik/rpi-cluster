#! /bin/bash

backup_folder_name=$(date +%Y%m%d)

mkdir /mnt/synology/volume1/backup/minecraft_backup/$backup_folder_name
cp -rf /projects/docker-minecraft-server/minecraft_data /mnt/synology/volume1/backup/minecraft_backup/$backup_folder_name
