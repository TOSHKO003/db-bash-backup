#!/bin/bash

# Database credentials
DB_USER='your_user'
DB_PASSWORD='your_password'
DB_NAME='your_database'

# Backup directory
BACKUP_DIR='/path/to/your/backup/directory'

# Create backup file name
TIMESTAMP=$(date +"%F")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql"

# Dump database into SQL file
mysqldump --user=$DB_USER --password=$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Check the result
if [ $? -eq 0 ]; then
  echo "Database backup successfully created"
else
  echo "Error creating database backup"
fi