# Business Card Generator

A macOS application for generating business cards from manual input or CSV files.

## Features

- Create business cards with basic contact information
- Import multiple cards from CSV files
- Export cards as high-quality PNG images (300 DPI)
- Live preview of card design
- Batch export support for CSV imports

## Requirements

- macOS 13.0 or later
- Xcode 15.0 or later (for development)

## Installation

### Option 1: Build from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/andrewkuan/business-card-creator.git
   cd business-card-creator/BusinessCardGenerator
   ```

2. Build the application:
   ```bash
   ./build_app.sh
   ```

3. The application will be created in `build/Business Card Generator.app`

4. Move the application to your Applications folder:
   ```bash
   mv "build/Business Card Generator.app" /Applications/
   ```

### Option 2: Development in Xcode

1. Clone the repository as shown above
2. Open the project in Xcode:
   ```bash
   open Package.swift
   ```
3. Build and run the project (⌘R)

## CSV Import Format

The CSV file should have the following headers:
- name
- phone
- email

Example:
```csv
name,phone,email
John Doe,+1-234-567-8900,john@example.com
Jane Smith,+1-234-567-8901,jane@example.com
```

## Development

The project uses SwiftUI and follows the MVVM architecture. Key components:

- `Models/`: Data models and business logic
- `Views/`: SwiftUI views and UI components
- `Utils/`: Helper utilities for image export and validation

## License

MIT License 