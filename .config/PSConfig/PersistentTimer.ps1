$timerFile = "$env:USERPROFILE\timer_state.txt"

# Function to update the timer every second
function Start-Timer {
    if (Test-Path $timerFile) {
        # Read the last known time
        $elapsedTime = Get-Content $timerFile | Out-String
        $elapsedTime = [double]$elapsedTime
    } else {
        $elapsedTime = 0
    }

    while ($true) {
        # Increment the elapsed time by 1 second
        $elapsedTime += 1
        # Save the updated time to the file
        $elapsedTime | Out-File -FilePath $timerFile -Force
        # Wait for 1 second before updating again
        Start-Sleep -Seconds 1
    }
}

Start-Timer
