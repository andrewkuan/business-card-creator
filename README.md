# Business Card Generator

A simple command-line tool to generate beautiful text-based business cards.

## Features

- Interactive prompts for entering your information
- Clean, professional card layout with Unicode borders
- Automatic text formatting and alignment
- Emoji icons for contact information
- Name and company displayed in uppercase for emphasis

## Requirements

- macOS with Swift installed
- Terminal that supports Unicode characters and emoji

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/business-card-generator.git
   cd business-card-generator
   ```

2. Make the script executable:
   ```bash
   chmod +x generate_card.swift
   ```

3. Run the script:
   ```bash
   ./generate_card.swift
   ```
   
   Or directly with Swift:
   ```bash
   swift generate_card.swift
   ```

4. Follow the prompts to enter your information:
   - Name
   - Title
   - Company
   - Email
   - Phone number

5. Your business card will be generated and displayed in the terminal.

## Example Output

```
╔══════════════════════════════════╗
║                                  ║
║  JOHN DOE                        ║
║  Software Engineer               ║
║  ACME CORPORATION                ║
║                                  ║
║  ✉️  john.doe@example.com          ║
║  📱  (555) 123-4567               ║
║                                  ║
╚══════════════════════════════════╝
```

## Tips

- For best results, view the generated card in a monospace font
- Copy and paste the card into a text editor to ensure proper formatting
- The card is designed to fit standard terminal widths

## License

This project is open source and available under the MIT License. 