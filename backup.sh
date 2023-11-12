#!/bin/bash

# Database credentials
DB_USER='your_user'
DB_PASSWORD='your_password'
DB_NAME='your_database'

# Backup directory
BACKUP_DIR='/path/to/your/backup/directory'

# Remote server SSH details
REMOTE_SSH_HOST='ssh_host'
REMOTE_SSH_USER='ssh_user'
REMOTE_SSH_DIR='remote_directory'

# Create backup file name in the current directory
TIMESTAMP=$(date +"%F")
BACKUP_FILE="$DB_NAME-$TIMESTAMP.sql"

# Dump database into SQL file in the current directory
mysqldump --user=$DB_USER --password=$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Check the dump result
if [ $? -eq 0 ]; then
  echo "Database backup successfully created"

  # Attempt to upload to another server via SCP
  scp $BACKUP_FILE $REMOTE_SSH_USER@$REMOTE_SSH_HOST:$REMOTE_SSH_DIR
  if [ $? -eq 0 ]; then
    echo "Backup successfully uploaded to remote server"
    rm $BACKUP_FILE  # Remove the file upon successful upload
  else
    echo "Error uploading to remote server, moving backup to $BACKUP_DIR"
    mv $BACKUP_FILE $BACKUP_DIR/  # Move file to backup directory on failure
  fi

else
  echo "Error creating database backup"
fi