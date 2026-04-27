# APR2 Installer

A utility script for automating the synchronization of academic materials for the APR2 course from CESNET OwnCloud to a local directory (optimized for Obsidian). Supports both Linux (Bash) and Windows (PowerShell).

## Functionality
The scripts perform the following operations:
- Verifies system dependencies (curl/unzip or PowerShell).
- Downloads the latest course materials archive from CESNET OwnCloud.
- Validates the integrity of the downloaded ZIP archive.
- Synchronizes the content into the specified target directory.
- Maintains a detailed execution log with timestamps.

## Configuration
Default paths can be overridden using environment variables or by editing the script:
- `TARGET_PATH`: Destination for the academic materials.
- `LOG_FILE`: Location of the execution log.

## Usage

### Linux (Bash)
1. Ensure the script has execution permissions: `chmod +x apr2.sh`
2. Run the script: `./apr2.sh`

### Windows (PowerShell)
1. Open PowerShell.
2. Run the script: `./apr2.ps1`
   *(Note: You might need to set execution policy: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`)*

## Requirements
- **Linux:** curl, unzip
- **Windows:** PowerShell 5.1 or higher
