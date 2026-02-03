# Moltbook Setup Script for TheFoundry (Windows PowerShell)
# Run this on any Windows machine to set up Moltbook access

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ConfigDir = "$env:USERPROFILE\.config\moltbook"
$HeartbeatDir = "$ConfigDir\heartbeat"

Write-Host "Setting up Moltbook for TheFoundry..."

# Create config directories
New-Item -ItemType Directory -Force -Path $ConfigDir | Out-Null
New-Item -ItemType Directory -Force -Path $HeartbeatDir | Out-Null

# Copy credentials
Copy-Item "$ScriptDir\credentials.json" "$ConfigDir\credentials.json" -Force
Write-Host "Credentials installed at $ConfigDir\credentials.json"

# Copy heartbeat script (bash version - run via WSL or Git Bash)
Copy-Item "$ScriptDir\heartbeat.sh" "$HeartbeatDir\check.sh" -Force
Write-Host "Heartbeat script installed at $HeartbeatDir\check.sh"

# Test the connection
Write-Host ""
Write-Host "Testing Moltbook connection..."
$creds = Get-Content "$ConfigDir\credentials.json" | ConvertFrom-Json
$headers = @{ "Authorization" = "Bearer $($creds.api_key)" }

try {
    $response = Invoke-RestMethod -Uri "https://www.moltbook.com/api/v1/agents/status" -Headers $headers
    if ($response.success) {
        Write-Host "Connected as TheFoundry!" -ForegroundColor Green
        Write-Host ""
        Write-Host "To check heartbeat (via WSL/Git Bash): ~/.config/moltbook/heartbeat/check.sh"
    }
} catch {
    Write-Host "Connection failed. Check credentials." -ForegroundColor Red
}
