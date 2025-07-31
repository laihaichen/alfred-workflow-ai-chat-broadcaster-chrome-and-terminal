# AI Chat Broadcaster 🚀

一个基于AppleScript的**Alfred工作流**，可以将一条消息广播到在Chrome浏览器中打开的多个AI聊天平台。

## ✨ 核心功能

  - **🎯 多平台操作**: 脚本目前可以在Chrome浏览器中打开的ChatGPT, Claude, Gemini, Google AI Studio, Hugging Face, LMArena等标签页上工作。您可以修改此脚本以支持更多AI聊天网站。
  - **🤖 自动化流程**: 自动在多个标签页间切换、聚焦输入框、清空内容、并点击发送按钮。
  - **🔄 Alfred集成**: 配合Alfred的Snippet（文本片段）功能使用，可以将您输入的简短关键词（例如 `-go`）替换为剪贴板中的完整内容。
  - **🖥️ 批量处理**: 自动识别并处理所有预先配置好的AI聊天标签页。

## 🎬 演示

## 🔧 使用前提

  - macOS 操作系统
  - **Google Chrome** 浏览器
  - Alfred 并激活Powerpack功能
  - 在“系统设置 \> 隐私与安全性 \> 自动化”中授予Alfred控制Chrome的权限

## 📦 安装与配置

1.  **导入工作流**:

      * 下载 `aichatboardcaster.alfredworkflow` 文件。
      * 双击该文件，将其导入到Alfred中。

2.  **配置Alfred Snippet**:

      * 打开 Alfred 设置 → Features → Snippets。
      * 创建一个新的Snippet，内容如下：
          * **Name**: AI Prompt (或任何您喜欢的名字)
          * **Keyword**: `-go` (这个关键词必须与脚本中 `keystroke` 的命令完全一致)
          * **Snippet**: `{datetime:long} {clipboard}`

## 🚀 使用方法

1.  **准备消息**: 复制您想发送的消息到系统剪贴板。
2.  **准备浏览器**: 在Chrome中打开一个或多个受支持的AI聊天网站的标签页。
3.  **运行脚本**: 在macOS的**任何地方**（例如桌面、文本编辑器等），直接输入您的关键词 `-go` 并按空格。
4.  **自动执行**: Alfred会捕捉到您的输入并触发展开，然后脚本会自动完成后续所有操作（切换标签页、粘贴内容、点击发送）。

## ⚙️ 技术说明

### 按钮识别策略

脚本通过一个预设的CSS选择器列表来识别不同网站上的“发送”按钮。您可以编辑工作流中的脚本，轻松扩展这个列表以支持更多网站。

```javascript
var sendButtonSelectors = [
    'button[aria-label="Run"]',                  // Google AI Studio
    'button[data-testid="send-button"]',           // ChatGPT
    'button[aria-label="Send message"]',         // Gemini
    'button[aria-label="Send Message"]',         // Claude
    'button[type="submit"]:not([disabled])',       // LMArena
    'button[class*="send"]'                        // 通用后备方案
];
```

## 🤝 贡献

欢迎通过提交Pull Request来为这个项目做出贡献。

## 📝 许可

本项目采用 MIT 许可。

-----

🤖 *为AI驱动的生产力而生*


# AI Chat Broadcaster 🚀

An AppleScript-based **Alfred Workflow** that broadcasts a single message to multiple AI chat platforms open in the Chrome browser.

## ✨ Core Features

  - **🎯 Multi-Platform Operation**: The script currently works with tabs in Chrome for ChatGPT, Claude, Gemini, Google AI Studio, Hugging Face, and LMArena. You can modify the script to support additional AI chat websites.
  - **🤖 Automated Actions**: Automatically switches between tabs, focuses the input field, clears existing content, and clicks the send button.
  - **🔄 Alfred Integration**: Best used with Alfred's Snippet feature, which replaces your short typed keyword (e.g., `-go`) with the content from your clipboard.
  - **🖥️ Batch Processing**: Automatically finds and processes all pre-configured AI chat tabs.

## 🎬 Demo

## 🔧 Prerequisites

  - macOS operating system
  - **Google Chrome** browser
  - Alfred with the Powerpack
  - Permissions granted in `System Settings > Privacy & Security > Automation` for Alfred to control Google Chrome.

## 📦 Installation & Configuration

1.  **Import the Workflow**:

      * Download the `aichatboardcaster.alfredworkflow` file.
      * Double-click the file to import it into Alfred.

2.  **Configure the Alfred Snippet**:

      * Open Alfred Preferences → Features → Snippets.
      * Create a new snippet with the following:
          * **Name**: AI Prompt (or any name you prefer)
          * **Keyword**: `-go` (this must exactly match the `keystroke` command in the script)
          * **Snippet**: `{datetime:long} {clipboard}`

## 🚀 Usage

1.  **Prepare your message**: Copy the message you want to send to your clipboard.
2.  **Prepare your browser**: Open one or more of the supported AI chat tabs in Chrome.
3.  **Run the script**: Type your keyword `-go` **anywhere** in macOS (e.g., on your desktop, in a text editor) and press space.
4.  **Automation in Action**: Alfred will detect your keyword, expand the snippet, and the script will then automatically handle the rest (switching tabs, pasting content, and clicking send).

## ⚙️ How It Works

### Button Detection Strategy

The script uses a pre-defined list of CSS selectors to identify the 'Send' button on various websites. You can easily edit the script within the workflow to extend this list and support more sites.

```javascript
var sendButtonSelectors = [
    'button[aria-label="Run"]',                  // Google AI Studio
    'button[data-testid="send-button"]',           // ChatGPT
    'button[aria-label="Send message"]',         // Gemini
    'button[aria-label="Send Message"]',         // Claude
    'button[type="submit"]:not([disabled])',       // LMArena
    'button[class*="send"]'                        // Generic Fallback
];
```

## 🤝 Contributing

Contributions are welcome\! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License.

-----

🤖 *Built for AI-powered productivity.*