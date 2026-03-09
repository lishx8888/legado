# Legado iOS 构建指南

## 项目结构

- `Legado/` - iOS应用主目录
  - `Legado/` - 应用代码
    - `Models/` - 数据模型
    - `Views/` - 视图
    - `Controllers/` - 控制器
    - `Utils/` - 工具类
    - `Services/` - 服务类
  - `LegadoTests/` - 单元测试
  - `LegadoUITests/` - UI测试
  - `Legado.xcodeproj/` - Xcode项目文件

## 构建步骤

1. **安装依赖**
   - 安装Xcode 13.0或更高版本
   - 安装CocoaPods（如果需要）

2. **配置项目**
   - 打开 `Legado.xcodeproj` 文件
   - 在Xcode中配置开发者账号和证书
   - 更新 `exportOptions.plist` 文件中的团队ID和配置文件

3. **构建应用**
   - 使用Xcode构建应用
   - 或使用命令行脚本：
     ```bash
     cd ios
     ./build.sh
     ```

4. **生成IPA文件**
   - 构建完成后，IPA文件会生成在 `build/ios/` 目录中

## 注意事项

- 需要有效的Apple开发者账号和证书才能构建和打包应用
- 首次构建可能需要下载依赖和配置环境
- 确保网络连接正常，以便下载依赖和证书

## 功能说明

- **书架** - 展示已添加的书籍
- **阅读器** - 阅读书籍内容，支持翻页和章节切换
- **书源管理** - 管理书籍来源
- **本地阅读** - 支持本地TXT、EPUB文件阅读
- **网络阅读** - 支持从网络书源获取内容
