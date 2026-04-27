# Configuration
$LogFile = Join-Path $Home ".logs/update_apr2.log"
$TargetPath = Join-Path $Home "Documents/School/Obsidian - University/Semestr 2/APR2/"
$Url = "https://owncloud.cesnet.cz/index.php/s/YJewYnBKtM5BM4p/download?path=%2F&files=APR2_2026&downloadStartSecret=e6bl01r0ohf"
$TempZip = Join-Path $env:TEMP "apr2_update.zip"

# Ensure directories exist
if (!(Test-Path (Split-Path $LogFile))) { New-Item -ItemType Directory -Path (Split-Path $LogFile) -Force }
if (!(Test-Path $TargetPath)) { New-Item -ItemType Directory -Path $TargetPath -Force }

# Logging function
function Write-Log {
    param([string]$Message)
    $Stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Stamp $Message" | Out-File -FilePath $LogFile -Append
    Write-Host "$Message"
}

Write-Log "--- Sync Started ---"

try {
    Write-Log "Downloading updates from CESNET..."
    Invoke-WebRequest -Uri $Url -OutFile $TempZip -ErrorAction Stop

    Write-Log "Extracting files to $TargetPath..."
    Expand-Archive -Path $TempZip -DestinationPath $TargetPath -Force
    Write-Log "Success: Files synchronized successfully."
}
catch {
    Write-Log "Error: $($_.Exception.Message)"
}
finally {
    if (Test-Path $TempZip) { Remove-Item $TempZip }
    Write-Log "--- Sync Finished ---"
}
