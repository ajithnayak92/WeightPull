# Define serial port and output file
$SerialPort = "COM4"   # Update with your serial port (e.g., COM2, COM3)
# Get the script's directory using $PSScriptRoot
$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Path $MyInvocation.MyCommand.Path }

# Define the output file path in the same directory as the script
$OutputFile = Join-Path -Path $ScriptDir -ChildPath "output.txt"

# Create a new SerialPort object
$port = New-Object System.IO.Ports.SerialPort $SerialPort, 9600, "None", 8, "One"

# Set handshake to None
$port.Handshake = [System.IO.Ports.Handshake]::None

# Try to open the port and handle exceptions
try {
    # Open the port
    $port.Open()
    Write-Host "Serial port $SerialPort opened successfully."

    # Open the output file for writing
    $fileStream = New-Object System.IO.FileStream($OutputFile, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write)
    $output = New-Object System.IO.StreamWriter($fileStream)
    Write-Host "Output file $OutputFile opened successfully."

    # Wait for data to be available
    Start-Sleep -Seconds 1  # Adjust sleep time if needed

    # Check if data is available
    if ($port.BytesToRead -gt 0) {
        # Read data from the serial port
        $data = $port.ReadExisting()  # Use ReadExisting to capture all available data

        # Debug output
        Write-Host "Data read: $data"

        # Process and clean the data
        $dataArray = $data -split "`r`n"  # Split the data into lines
        if ($dataArray.Length -gt 0) {
            $firstValue = $dataArray[0].Trim()  # Get the first value and trim whitespace

            # Remove leading '+' and leading zeros
            $cleanedValue = $firstValue -replace '^\+', ''  # Remove leading '+'
            $cleanedValue = $cleanedValue -replace '^0+', ''  # Remove leading zeros
            if ($cleanedValue -match '^[0-9]+') {
                $cleanedValue = $cleanedValue -replace '^0+', '0'  # Handle case where only zeros were present
            }

            # Debug output
            Write-Host "Cleaned data: $cleanedValue"
            
            # Write cleaned data to the output file
            $output.WriteLine($cleanedValue)
            $output.Flush()  # Ensure data is written to file immediately
        }
        else {
            Write-Host "No valid data available to process."
        }
    }
    else {
        Write-Host "No data available to read from the serial port."
    }
}
catch {
    Write-Host "An error occurred: $_"
}
finally {
    # Cleanup
    if ($port.IsOpen) {
        $port.Close()
        Write-Host "Serial port closed."
    }
    $output.Close()
    $fileStream.Close()
    Write-Host "Output file closed."
}
