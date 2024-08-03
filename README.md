# Serial Port Data Reader

## Overview

This project includes a PowerShell script and a batch file to read data from a serial port (e.g., a weighing scale), process the data, and write it to a file. The batch file allows you to run the PowerShell script with a single click.

## Components

1. **`scale_interface.ps1`**: PowerShell script to read data from the serial port, process it, and write it to an output file.
2. **`get_current_weight.bat`**: Batch file to execute the PowerShell script with a single click.

## Prerequisites

- **Windows Operating System**: The script is designed to run on Windows.
- **PowerShell**: The script uses PowerShell to execute the tasks. Ensure PowerShell is installed.
- **Serial Port Access**: Ensure that the serial port (e.g., COM4) is correctly configured and connected to the device (e.g., weighing scale).

## Setup

1. **Download the Files:**
   - Download or create the following files:
     - `read_scale.ps1`: The PowerShell script.
     - `run_read_scale.bat`: The batch file to run the script.

2. **Place Files in the Same Directory:**
   - Ensure that both `read_scale.ps1` and `run_read_scale.bat` are in the same directory.

3. **Modify the Script (if necessary):**
   - Open `read_scale.ps1` with a text editor (e.g., Notepad).
   - Update the `$SerialPort` and `$OutputFile` variables if needed:
     ```powershell
     $SerialPort = "COM4"  # Update with your serial port
     $OutputFile = "output.txt"  # Update with your desired output file name
     ```

## Running the Script

1. **Double-Click the Batch File:**
   - Double-click `run_read_scale.bat` to execute the PowerShell script.

2. **View the Output:**
   - After execution, check `output.txt` (or the file specified in the `$OutputFile` variable) in the same directory for the processed data.

3. **Check Console Output:**
   - The command prompt window will display any messages or errors encountered during execution. It will pause so you can review the output before closing.

## Troubleshooting

- **PowerShell Execution Policy:**
  - If you encounter execution policy errors, ensure you have the `Bypass` policy set or adjust according to your security settings.
  - Modify the batch file if needed to include:
    ```batch
    powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
    ```

- **Serial Port Issues:**
  - Ensure the serial port specified in the script matches the actual port used by your device.
  - Verify the device is properly connected and transmitting data.

- **File Access Permissions:**
  - Ensure you have permission to write to the specified output file directory.

## License

This project is provided as-is. You may use it according to your needs. No warranties are provided.

## Contact

For further assistance, please contact Ajith Nayak or refer to [repo(https://github.com/ajithnayak92/WeightPull)] for updates and additional support.

