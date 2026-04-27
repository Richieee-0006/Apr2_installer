#!/bin/bash

# Configuration
LOG_FILE="${LOG_FILE:-$HOME/.logs/update_apr2.log}"
TARGET_PATH="${TARGET_PATH:-$HOME/Documents/School/Obsidian - University/Semestr 2/APR2/}"
URL="https://owncloud.cesnet.cz/index.php/s/YJewYnBKtM5BM4p/download?path=%2F&files=APR2_2026&downloadStartSecret=e6bl01r0ohf"
TEMP_ZIP="/tmp/apr2_update.zip"

# Ensure directories exist
mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$TARGET_PATH"

# Logging setup
exec > >(while read line; do echo "$(date \"+%Y-%m-%d %H:%M:%S\") $line"; done >>"$LOG_FILE") 2>&1

echo "--- Sync Started ---"

# Check dependencies
for cmd in curl unzip file; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: Required command \"$cmd\" is not installed."
        exit 1
    fi
done

# Download logic
if curl -L -f -sS "$URL" -o "$TEMP_ZIP"; then
    if file "$TEMP_ZIP" | grep -q "Zip archive"; then
        unzip -o -q "$TEMP_ZIP" -d "$TARGET_PATH"
        echo "Success: Files synchronized to $TARGET_PATH"
        rm "$TEMP_ZIP"
    else
        echo "Error: Downloaded file is not a valid ZIP. Check the URL or access permissions."
        rm "$TEMP_ZIP"
        exit 1
    fi
else
    echo "Error: Network download failed."
    exit 1
fi

echo "--- Sync Finished ---"
