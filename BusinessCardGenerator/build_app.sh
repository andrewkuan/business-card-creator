#!/bin/bash

# Set variables
APP_NAME="Business Card Generator"
APP_BUNDLE_PATH="./build/$APP_NAME.app"
CONTENTS_PATH="$APP_BUNDLE_PATH/Contents"
MACOS_PATH="$CONTENTS_PATH/MacOS"
RESOURCES_PATH="$CONTENTS_PATH/Resources"

# Clean previous build
rm -rf "./build"

# Create directory structure
mkdir -p "$MACOS_PATH" "$RESOURCES_PATH"

# Compile Swift files
swiftc \
    -sdk $(xcrun --show-sdk-path) \
    -target arm64-apple-macosx13.0 \
    -O \
    -framework AppKit \
    -framework SwiftUI \
    BusinessCardGenerator/App.swift \
    BusinessCardGenerator/Models/*.swift \
    BusinessCardGenerator/Views/*.swift \
    BusinessCardGenerator/Utils/*.swift \
    -o "$MACOS_PATH/$APP_NAME"

# Copy Info.plist
cat > "$CONTENTS_PATH/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleIdentifier</key>
    <string>com.andrewkuan.businesscardgenerator</string>
    <key>CFBundleName</key>
    <string>Business Card Generator</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>LSApplicationCategoryType</key>
    <string>public.app-category.business</string>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>LSUIElement</key>
    <false/>
</dict>
</plist>
EOF

# Create empty Assets.xcassets
mkdir -p "$RESOURCES_PATH/Assets.xcassets"
cat > "$RESOURCES_PATH/Assets.xcassets/Contents.json" << EOF
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

# Make the app executable
chmod +x "$MACOS_PATH/$APP_NAME"

echo "Application bundle created at $APP_BUNDLE_PATH"
echo "To install, run: mv \"$APP_BUNDLE_PATH\" /Applications/" 