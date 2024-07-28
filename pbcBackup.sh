#!/bin/bash

# Variables
PBS_REPOSITORY='' # Format: <username>@<hostname>:<port>:<repository>
PBS_BACKUP_PATH='' # Format: <backup-name>:<path>
PBS_NS='' # Namespace
PBS_PASSWORD_FILE='' # Path to the password file

# Check if password File Exists
if [[ ! -f "$PBS_PASSWORD_FILE" ]]; then
    echo "Error: Password file not found!"
    exit 1
fi

# Set PBS_PASSWORD to the content of the password file
PBS_PASSWORD=$(<"$PBS_PASSWORD_FILE")

# Check if the Proxmox Backup Client is installed
if ! command -v proxmox-backup-client &> /dev/null; then
    echo "Error: Proxmox Backup Client is not installed!"
    exit 1
fi

# Check if variables are set
if [[ -z "$PBS_REPOSITORY" ]] || [[ -z "$PBS_BACKUP_PATH" ]] || [[ -z "$PBS_NS" ]] || [[ -z "$PBS_PASSWORD" ]]; then
    echo "Error: Variables are not set!"
    exit 1
fi

# Execute the backup
echo Running Backup...
sudo proxmox-backup-client backup $PBS_BACKUP_PATH PBS_PASSWORD=$PBS_PASSWORD --repository $PBS_REPOSITORY --ns $PBS_NS

# Exit
if [[ $? -ne 0 ]]; then
    echo "Backup failed!"
    exit 1
else
    echo "Backup completed successfully."
fi
