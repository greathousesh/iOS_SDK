#!/bin/bash

# 确保脚本发生任何错误时立即停止
set -e

PROJECT_NAME="MySDKBuild"
SCHEME="MySDK-Release"
FRAMEWORK_NAME="MySDK"
OUTPUT_DIR="./dist"

# 清理旧产物
rm -rf "$OUTPUT_DIR"
rm -rf "archives"
mkdir -p "$OUTPUT_DIR"

echo "🚀 Generating build project..."
xcodegen generate --spec project-build.yml

echo "📦 Archiving for iOS Device..."
xcodebuild archive \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -destination "generic/platform=iOS" \
    -archivePath "archives/${FRAMEWORK_NAME}-iOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "📦 Archiving for iOS Simulator..."
xcodebuild archive \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "archives/${FRAMEWORK_NAME}-iOS_Simulator" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "💎 Creating XCFramework..."
xcodebuild -create-xcframework \
    -framework "archives/${FRAMEWORK_NAME}-iOS.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "archives/${FRAMEWORK_NAME}-iOS_Simulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "${OUTPUT_DIR}/${FRAMEWORK_NAME}.xcframework"

echo "📦 Zipping XCFramework..."
cd "$OUTPUT_DIR"
zip -r "${FRAMEWORK_NAME}.xcframework.zip" "${FRAMEWORK_NAME}.xcframework"
cd ..

echo "🔍 Calculating Checksum..."
CHECKSUM=$(swift package compute-checksum "${OUTPUT_DIR}/${FRAMEWORK_NAME}.xcframework.zip")
echo "Checksum: $CHECKSUM"
echo "$CHECKSUM" > "${OUTPUT_DIR}/checksum.txt"

echo "✅ Build Completed!"
echo "XCFramework: ${OUTPUT_DIR}/${FRAMEWORK_NAME}.xcframework.zip"
echo "Checksum: $CHECKSUM"
