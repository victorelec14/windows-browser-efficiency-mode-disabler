# Windows Browser Efficiency Mode Disabler

A PowerShell script that continuously monitors and disables Windows Efficiency Mode for web browsers, ensuring optimal performance even when running in the background.


## The Problem

Windows 11 introduced an "Efficiency Mode" feature that automatically reduces CPU priority and resource usage for background applications. While this feature aims to improve system efficiency, it can negatively impact web browsers by:

1. Reducing video playback quality (e.g., YouTube videos playing with lag or poor quality)
2. Causing stuttering in background tabs
3. Affecting overall browser performance
4. Limiting CPU resources unnecessarily

Some Chromium-based browsers previously supported the `--disable-features=UseEcoQoSForBackgroundProcess` flag to prevent this behavior, but this option has been removed in recent versions, making it necessary to use alternative methods to maintain optimal performance.

## Features

- Continuously monitors and disables Efficiency Mode for:
    - Brave Browser (Stable, Beta, Nightly)  
    - Google Chrome
    - Vivaldi Browser
    - Microsoft Edge
- Sets energy efficiency mode processes to normal priority
- Removes CPU affinity restrictions
- Checks every second that browser processes remain in normal mode without impacting system performance
- Shows real-time status of optimized processes

## Requirements

- Windows 10/11
- PowerShell 7 or higher
- Administrator privileges

## Installation and Usage

1. Clone or download this repository
2. Right-click on `disable-browser-efficiency-mode.ps1` and select "Run with PowerShell"


## Performance Notes

- The script checks and corrects browser processes every second
- There might be a minimal delay when switching between tabs or starting video playback
- The performance impact is practically imperceptible in normal usage
- The benefits of having full CPU access outweigh any minimal delays

## Contributing

Feel free to contribute to this project by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

If you encounter any issues or have suggestions for improvements, please open an issue in the repository.

## License

This project is open source and available under the MIT License.

## Disclaimer

This script modifies system behavior and process priorities. While it's designed to be safe, use it at your own risk. Always ensure you have administrator privileges and understand the implications of modifying process priorities. 