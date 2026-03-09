#!/bin/bash

# 构建iOS应用并生成IPA文件

# 设置项目路径
PROJECT_PATH="Legado"
SCHEME="Legado"
CONFIGURATION="Release"

# 设置输出目录
OUTPUT_DIR="../build/ios"

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 进入项目目录
cd "$PROJECT_PATH"

# 清理项目
xcodebuild clean -project "$SCHEME.xcodeproj" -scheme "$SCHEME" -configuration "$CONFIGURATION"

# 构建项目
xcodebuild build -project "$SCHEME.xcodeproj" -scheme "$SCHEME" -configuration "$CONFIGURATION" -archivePath "$OUTPUT_DIR/$SCHEME.xcarchive"

# 导出IPA
xcodebuild -exportArchive -archivePath "$OUTPUT_DIR/$SCHEME.xcarchive" -exportPath "$OUTPUT_DIR" -exportOptionsPlist "exportOptions.plist"

echo "构建完成，IPA文件生成在: $OUTPUT_DIR"
