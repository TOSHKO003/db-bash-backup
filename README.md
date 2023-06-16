# MariaDB Database Backup Script

This repository contains a Bash script to backup a MariaDB database. The script generates a SQL dump of the specified database and stores it in a designated backup directory. Also included are instructions for setting up a cron job to run this script at specific hours.

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

Open the `backup.sh` script with your preferred text editor. Replace `DB_USER`, `DB_PASSWORD`, `DB_NAME`, and `BACKUP_DIR` with your actual database username, password, database name, and the path to your backup directory, respectively.

```bash
# Database credentials
DB_USER='your_user'
DB_PASSWORD='your_password'
DB_NAME='your_database'

# Backup directory
BACKUP_DIR='/path/to/your/backup/directory'
```

## Run the Backup Script

Run the script manually to test the backup:

```bash
./backup.sh
```

## Setting Up the Cron Job

To set up a cron job to automate the backup process:

1. Open your crontab file:

```bash
crontab -e
```

2. Add the following line to schedule the job to run at 3 AM every day (replace `/path/to/your/backup.sh` with the actual path to the script):

```bash
0 3 * * * /path/to/your/backup.sh
```

Save and exit the editor. The cron job is now set up.

## Conclusion

This script simplifies the process of backing up a MariaDB database. By scheduling a cron job, you can automate this process to ensure that your database is backed up regularly. For further automation, consider adding script that removes backups older than a certain date to prevent storage overflow.

If you encounter any issues or have any improvements, feel free to create an issue or submit a pull request.