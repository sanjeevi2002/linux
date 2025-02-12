#!/bin/bash

# Directory to scan
DIR_TO_SCAN="/home/user"  # Change this to your target directory

# Log directory
LOG_DIR="/home/user/logs"  # Change this to your desired log directory

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Get current date
CURRENT_DATE=$(date +"%Y-%m-%d")

# Output CSV file
OUTPUT_FILE="$LOG_DIR/file_list_$CURRENT_DATE.csv"

# CSV Header
echo "File/Folder Name,Location,Type,Last Modified" > "$OUTPUT_FILE"

# Find all files and directories modified today
find "$DIR_TO_SCAN" -newermt "$CURRENT_DATE" -printf "%f,%h,%y,%TY-%Tm-%Td %TH:%TM:%TS\n" >> "$OUTPUT_FILE"

# Print success message
echo "File and folder list saved to $OUTPUT_FILE"

