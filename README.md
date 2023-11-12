# MariaDB Database Backup and Remote Transfer Script

This repository contains a Bash script for backing up a MariaDB database and optionally transferring it to a remote server. The script generates a SQL dump of the specified database, can transfer it to a remote server using SCP, and stores it in a designated backup directory if the transfer fails.

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/TOSHKO003/db-bash-backup.git
```

2. Navigate to the directory:

```bash
cd db-bash-backup
```

3. Make the script executable:

```bash
chmod +x backup.sh
```

## Configuration

Edit the backup.sh script with your preferred text editor. Set your database credentials, backup directory, and remote server SSH details:

```bash
## Database credentials
DB_USER='your_user'
DB_PASSWORD='your_password'
DB_NAME='your_database'

# Backup directory (used if remote transfer fails)
BACKUP_DIR='/path/to/your/backup/directory'

# Remote server SSH details
REMOTE_SSH_HOST='ssh_host'
REMOTE_SSH_USER='ssh_user'
REMOTE_SSH_DIR='remote_directory'
```

## Running the Backup Script

Run the script manually to test the backup and remote transfer:

```bash
./backup.sh
```

## Setting Up the Cron Job

To automate the backup process:

1. Open your crontab file:

```bash
crontab -e
```

2. Add a line to schedule the job (e.g., at 3 AM daily). Replace /path/to/your/backup.sh with the actual path to the script:

```bash
0 3 * * * /path/to/your/backup.sh
```

Save and exit. Your cron job is now set up.

## Conclusion

This script provides a convenient way to back up a MariaDB database and transfer it to a remote server. It's designed to ensure data safety by keeping a local copy if the remote transfer fails. Regular automated backups via a cron job can help maintain your database's integrity.

For enhancements, issues, or contributions, feel free to open an issue or submit a pull request.