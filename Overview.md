# Business Card Generator MVP - Project Overview

## MVP Scope
A simple macOS desktop application that lets users input contact details or import a CSV file to generate downloadable business card images.

## Core MVP Features

### 1. Basic Input Form
- Text fields for:
  - Full Name
  - Contact Number
  - Email Address
- Basic validation (required fields and format checking)

### 2. Simple CSV Import
- File selection button
- Support for basic CSV with headers
- Minimum columns: name, phone, email
- Simple error reporting for invalid files

### 3. Single Card Template
- One professional, clean business card design
- Fixed layout with proper spacing
- Standard business card dimensions (3.5" × 2")

### 4. Basic Image Export
- PNG export with decent resolution (300 DPI)
- Auto-named files based on person's name
- Single card export for manual input
- Folder selection for CSV batch export

## Technical Approach

### Technology Stack
- **UI Framework**: SwiftUI (simple, declarative UI)
- **Programming Language**: Swift
- **Data Handling**: Swift standard libraries
- **File Operations**: Foundation framework
- **Image Rendering**: Core Graphics basics

### Project Structure
```
BusinessCardGenerator/
├── App.swift                  # Main application entry
├── Models/
│   ├── BusinessCard.swift     # Data model for a single card
│   └── CSVImporter.swift      # Basic CSV parsing
├── Views/
│   ├── MainView.swift         # Main container view
│   ├── InputFormView.swift    # User input form
│   ├── CardPreviewView.swift  # Simple card preview
│   └── CSVImportView.swift    # Basic file picker
├── Utils/
│   ├── ImageExporter.swift    # PNG generation
│   └── Validators.swift       # Simple input validation
└── Resources/
    └── CardTemplate.swift     # Single card layout definition
```

## MVP Development Plan

### Phase 1: Basic Setup (1-2 days)
- Create Xcode project with SwiftUI macOS template
- Set up basic window and main view structure
- Define BusinessCard data model

### Phase 2: Input Form (2-3 days)
- Implement basic form with required fields
- Add simple validation (empty check, email format)
- Connect form data to preview updating

### Phase 3: Card Rendering (3-4 days)
- Design single, clean card template
- Implement basic Core Graphics rendering
- Create preview window showing current card

### Phase 4: CSV Import (2-3 days)
- Add file picker for CSV selection
- Implement basic CSV parser
- Add simple error handling for invalid files

### Phase 5: Export Feature (2-3 days)
- Implement PNG export functionality
- Add file save dialog
- Create simple batch export for CSV data

### Phase 6: Testing & Polish (2-3 days)
- Fix critical bugs
- Ensure basic error handling
- Add minimal styling to make UI presentable

## Working with Cursor
For this MVP, use Cursor to:
- Generate boilerplate SwiftUI views
- Help implement the CSV parsing logic
- Create the Core Graphics rendering code
- Debug any issues that arise

## Future Enhancements (Post-MVP)
- Multiple card templates
- Customization options (colors, fonts)
- Advanced CSV mapping
- More export formats (PDF, JPG)
- Logo/image upload capability