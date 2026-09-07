# Application Installer

Windows-based installation and deployment solution.

## Features

- Core application modules
- Windows installer (NSIS)
- Command-line interface
- Configuration management
- System integration

## Installation

### Windows

1. Download `AppInstaller.exe`
2. Run the installer
3. Follow the installation wizard
4. Application will be installed to `C:\Program Files\Application`

### Building the Installer

Requirements:
- NSIS (https://nsis.sourceforge.io/)
- Windows environment

Steps:
1. Navigate to `installer/` directory
2. Run `build.bat`
3. Installer will be generated as `AppInstaller.exe`

## Usage

```bash
python src/main.py
```

## Directory Structure

```
.
├── src/                 # Source code
│   ├── main.py         # Main entry point
│   └── core.py         # Core modules
├── installer/          # Windows installer files
│   ├── installer.nsi   # NSIS script
│   └── build.bat       # Build script
└── requirements.txt    # Dependencies
```

## License

MIT
