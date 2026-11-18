# APR2 Installer

Bash and PowerShell scripts that sync APR2 course materials from CESNET OwnCloud to a local directory (such as an Obsidian vault).

## Functionality
The scripts:
- Check required tools (`curl`/`unzip` on Linux, PowerShell 5.1+ on Windows).
- Download the latest course archive from CESNET OwnCloud.
- Verify the downloaded ZIP archive before extracting.
- Sync extracted files into the target directory.
- Append timestamped entries to an execution log.

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
