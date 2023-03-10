#!/bin/bash

# Set the current date and time
DATE=$(date +%Y-%m-%d-%2-%0-%0)

# Backup the PostgreSQL database
pg_dump -U Test1 -d dbname > dbname_$DATE.sql

# Compress the backup file
gzip dbname_$DATE.sql

# Upload the compressed backup file to S3
aws s3 cp dbname_$DATE.sql.gz s3://bucket-name/path/to/backups/

