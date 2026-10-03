$processId = 39076
$durationSeconds = 70
$intervalSeconds = 1

$outputDir = ".\results\monitoring"
$outputFile = "$outputDir\resource-monitor.csv"

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

"Timestamp,CPUPercent,MemoryMB" | Set-Content $outputFile

$process = Get-Process -Id $processId

$previousCpu = $process.CPU
$previousTime = Get-Date

for ($i = 0; $i -lt $durationSeconds; $i++) {

    Start-Sleep -Seconds $intervalSeconds

    try {
        $process.Refresh()

        $currentCpu = $process.CPU
        $currentTime = Get-Date

        $cpuSeconds = $currentCpu - $previousCpu
        $elapsedSeconds = ($currentTime - $previousTime).TotalSeconds

        # CPU count is used to normalize process CPU to approximately one-machine percentage.
        $cpuPercent = ($cpuSeconds / $elapsedSeconds) / [Environment]::ProcessorCount * 100

        $memoryMB = [math]::Round($process.WorkingSet64 / 1MB, 2)

        $timestamp = $currentTime.ToString("yyyy-MM-dd HH:mm:ss")

        "$timestamp,$([math]::Round($cpuPercent,2)),$memoryMB" |
            Add-Content $outputFile

        $previousCpu = $currentCpu
        $previousTime = $currentTime

        Write-Host "$timestamp | CPU: $([math]::Round($cpuPercent,2))% | Memory: $memoryMB MB"
    }
    catch {
        Write-Host "Process monitoring failed: $($_.Exception.Message)"
        break
    }
}

Write-Host ""
Write-Host "Monitoring completed."
Write-Host "Results saved to: $outputFile"