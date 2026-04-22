#!/bin/bash
set -e

# 1. 清理环境
rm -rf *.xcodeproj *.xcworkspace
rm -rf DerivedData
rm -rf ~/Library/Developer/Xcode/DerivedData/StandaloneExample-*

# 2. 生成工程
echo "⚙️  Generating project..."
xcodegen generate

# 3. 强制在命令行触发包解析（这是解决“无法自动获取”的关键技巧）
echo "🛰️  Resolving package dependencies via CLI..."
xcodebuild -resolvePackageDependencies -project StandaloneExample.xcodeproj -scheme StandaloneExample

# 4. 打开工程
echo "✅ Done! Opening project..."
open StandaloneExample.xcodeproj
