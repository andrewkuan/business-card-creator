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

# Build the executable
swift build -c release

# Copy executable
cp ".build/release/BusinessCardGenerator" "$MACOS_PATH/$APP_NAME"

# Copy Info.plist
cp "./Sources/BusinessCardGenerator/Resources/Info.plist" "$CONTENTS_PATH/Info.plist"

# Make the app executable
chmod +x "$MACOS_PATH/$APP_NAME"

echo "Application bundle created at $APP_BUNDLE_PATH" 