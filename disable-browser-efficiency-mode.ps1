# List of browsers to process with their process names
$browsers = @{
    "Brave Browser"  = "brave"
    "Brave Beta"     = "brave-beta"
    "Brave Nightly"  = "brave-nightly"
    "Google Chrome"  = "chrome"
    "Vivaldi"        = "vivaldi"
    "Microsoft Edge" = "msedge"
}

Write-Host "=== WINDOWS BROWSER EFFICIENCY MODE DISABLER ===" -ForegroundColor Cyan
Write-Host "This script will disable the Efficiency Mode for background (Idle) processes of the web browsers in Windows 10/11." -ForegroundColor White
Write-Host "Supported browsers: $($browsers.Keys -join ', ')" -ForegroundColor White
Write-Host ""
Write-Host "Starting monitoring... (Press Ctrl+C to stop)" -ForegroundColor Green

# Monitoring
while ($true) {
    Start-Sleep -Seconds 1

    foreach ($browser in $browsers.GetEnumerator()) {
        $processes = Get-Process -Name $browser.Value -ErrorAction SilentlyContinue

        foreach ($process in $processes) {
            if (-not $process.HasExited -and $process.PriorityClass -eq [System.Diagnostics.ProcessPriorityClass]::Idle) {

                $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::Normal

                Write-Host "$(Get-Date -Format 'HH:mm:ss') - $($browser.Key) (PID: $($process.Id)) $($process.MainWindowTitle)" -ForegroundColor Yellow
            }
        }
    }
}
