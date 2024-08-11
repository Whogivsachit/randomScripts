#!/bin/bash

# Define variables
BACKUP_DIR="/mnt/gdrive" # Local backup directory
REMOTE_NAME="gdrive" # Rclone remote name
REMOTE_DIR="proxmox-backups" # Google Drive directory
DATE=$(date +'%Y-%m-%d')

# Create a backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Back up all VMs to the local directory
vzdump --compress zstd --dumpdir $BACKUP_DIR --all

# Upload the backup to Google Drive
rclone copy $BACKUP_DIR $REMOTE_NAME:$REMOTE_DIR/$DATE

# Optional: Delete local backups after uploading
rm -rf $BACKUP_DIR/*