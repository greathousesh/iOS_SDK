# MySDK and Example App Setup Guide

This project contains a Swift SDK (`MySDK`) and source files for an iOS Example App (`ExampleApp`). Follow these steps to set up and run the example.

## Project Structure
- `MySDK/`: The Swift Package containing the SDK code.
- `ExampleApp/`: Swift source files for the iOS example application.

## Prerequisites
- macOS with Xcode installed.
- Swift 5.10 or later.

## Automated Project Generation with XcodeGen

This project uses **XcodeGen** to automatically generate the `.xcodeproj` file. This ensures that the SDK and Example App targets are correctly configured and linked.

### Step 1: Install XcodeGen
If you don't have it already, install XcodeGen via Homebrew:
```bash
brew install xcodegen
```

### Step 2: Generate the Project
In the root directory of this repository, run:
```bash
xcodegen generate
```

### Step 3: Open and Run
1. Open the newly generated `MySDK.xcodeproj`.
2. Select the `MySDKExample` target.
3. Select an iOS Simulator.
4. Press **Cmd + R** to run.

## Project Structure
- `MySDK/`: The SDK framework source and configuration.
- `ExampleApp/`: The Example iOS application source.
- `project.yml`: The XcodeGen configuration file.

