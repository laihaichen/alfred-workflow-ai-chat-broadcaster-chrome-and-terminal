# AI Chat Broadcaster 🚀

一个基于AppleScript的**Alfred工作流**，包含两个独立的脚本，分别用于将消息广播到Chrome浏览器中的多个AI聊天平台，以及将指令发送到终端应用。

## ✨ 核心功能

  - **🎯 Chrome广播**: `aichatboardcaster-chrome.applescript` 脚本可以同时在Chrome中的多个AI标签页上工作（如ChatGPT, Claude, Gemini等）。
  - **⌨️ 终端控制**: `aichatboardcaster-terminal.applescript` 脚本可以将指令发送到您指定的终端应用（如“终端”或“iTerm2”）。
  - **🔧 高度可定制**: 您可以轻松修改脚本，决定是进行“全体广播”还是仅“精确弹射”到某一个或某几个特定的AI工具。
  - **🔄 Alfred集成**: 配合Alfred的Snippet功能，可将简短关键词替换为剪贴板中的完整内容并自动执行。

## 🔧 使用前提

1.  **macOS** 操作系统。
2.  **Google Chrome** 浏览器。
3.  **Alfred** 并激活Powerpack功能。
4.  在“系统设置 \> 隐私与安全性 \> 自动化”中授予Alfred控制Chrome、终端以及System Events的权限。
5.  **【重要】开启Chrome的AppleScript权限**:
      * 在Chrome中，点击屏幕最上方的菜单栏。
      * 转到 **查看 → 开发者 → 允许 Apple 事件中的 JavaScript**，并确保该选项已被勾选。

## 📦 安装与配置

1.  **导入工作流**:

      * 下载 `aichatboardcaster.alfredworkflow` 文件并双击导入到Alfred中。这个工作流只有aichatboardcaster-chrome.applescript，但是把aichatboardcaster-terminal.applescript加进来很容易

2.  **配置脚本动作**:

      * 在Alfred工作流编辑器中，创建您需要的“Run Script”动作。
      * 将 `aichatboardcaster-chrome.applescript` 的内容粘贴到一个动作中，并为其绑定一个触发器（例如，**关键字 `=go`**）。
      * 将 `aichatboardcaster-terminal.applescript` 的内容粘贴到另一个动作中，并为其绑定另一个触发器（例如，**关键字 `=term`**）。

3.  **配置Alfred Snippet**:

      * 打开 Alfred 设置 → Features → Snippets。
      * 为您的触发关键词（如 `=go` 和 `=term`）创建一个对应的Snippet。
      * **Snippet内容**: `{datetime:long}{clipboard}`——你可以任意修改这里的内容使得其变成订制prompt，唯一需要注意的是脚本里的keystroke也要改成一样的

## 🚀 使用方法

  - **广播到Chrome**: 复制消息到剪贴板，然后在任何地方输入 `=go` 并按空格，脚本将自动在Chrome中所有符合条件的AI页面上执行任务。
  - **发送到终端**: 复制指令到剪贴板，然后在任何地方输入 `=term` 并按空格，脚本将自动在您指定的终端应用中执行命令。

## ⚙️ 定制目标AI工具

您可以轻松修改 `aichatboardcaster-chrome.applescript` 脚本，使其只对特定的AI工具生效，实现“精确弹射”而不是“全体广播”。

打开脚本，找到这一行：

```applescript
if tabURL contains "aistudio.google.com" or tabURL contains "chatgpt.com" or tabURL contains "claude.ai" or tabURL contains "gemini.google.com" then
```

**修改示例**: 如果您只想让它在ChatGPT和Claude上工作，只需删除其他部分：

```applescript
if tabURL contains "chatgpt.com" or tabURL contains "claude.ai" then
```

您可以根据需要任意组合或只保留一个。

## 📝 许可

本项目采用 MIT 许可。

-----

🤖 *为AI驱动的生产力而生*

-----

-----


# AI Chat Broadcaster 🚀

An AppleScript-based **Alfred Workflow** containing two separate scripts for broadcasting messages to multiple AI chat platforms in Google Chrome and sending commands to your terminal application.

## ✨ Core Features

  - **🎯 Chrome Broadcasting**: The `aichatboardcaster-chrome.applescript` script can operate simultaneously on multiple AI tabs in Chrome (e.g., ChatGPT, Claude, Gemini).
  - **⌨️ Terminal Control**: The `aichatboardcaster-terminal.applescript` script can send commands to your specified terminal app (e.g., Terminal or iTerm2).
  - **🔧 Highly Customizable**: You can easily modify the script to "broadcast to all" or to "target specific" AI tools.
  - **🔄 Alfred Integration**: Works with Alfred's Snippet feature to replace a short keyword with your full clipboard content and execute automatically.

## 🔧 Prerequisites

1.  A **macOS** operating system.
2.  **Google Chrome** browser.
3.  **Alfred** with the Powerpack.
4.  Permissions granted in `System Settings > Privacy & Security > Automation` for Alfred to control Chrome, your terminal app, and System Events.
5.  **[IMPORTANT] Enable AppleScript in Chrome**:
      * In Google Chrome, click on the menu bar at the very top of the screen.
      * Navigate to **View → Developer → Allow JavaScript from Apple Events** and ensure this option is checked.

## 📦 Installation & Configuration

1.  **Import the Workflow**:

      * Download the `aichatboardcaster.alfredworkflow` file and double-click it to import it into Alfred. The workflow may contain templates for one or both "Run Script" actions.

2.  **Configure Script Actions**:

      * In the Alfred workflow editor, create the "Run Script" actions you need.
      * Paste the content of `aichatboardcaster-chrome.applescript` into one action and connect it to a trigger (e.g., the **keyword `=go`**).
      * Paste the content of `aichatboardcaster-terminal.applescript` into another action and connect it to a different trigger (e.g., the **keyword `=term`**).

3.  **Configure the Alfred Snippet**:

      * Open Alfred Preferences → Features → Snippets.
      * Create a corresponding snippet for your trigger keyword (e.g., `=go`).
      * **Snippet Content**: `{datetime:long}{clipboard}`——你可以任意修改这里的内容使得其变成订制prompt，唯一需要注意的是脚本里的keystroke也要改成一样的

## 🚀 Usage

  - **Broadcast to Chrome**: Copy a message to your clipboard, then type `=go` anywhere and press space. The script will automatically perform its tasks on all eligible AI pages in Chrome.
  - **Send to Terminal**: Copy a command to your clipboard, then type `=term` anywhere and press space. The script will automatically execute the command in your terminal app.

## ⚙️ Customize Target AI Tools

You can easily modify the `aichatboardcaster-chrome.applescript` to target only specific AI tools instead of broadcasting to all.

Open the script and find this line:

```applescript
if tabURL contains "aistudio.google.com" or tabURL contains "chatgpt.com" or tabURL contains "claude.ai" or tabURL contains "gemini.google.com" then
```

**Example Modification**: If you only want it to work on ChatGPT and Claude, simply remove the other conditions:

```applescript
if tabURL contains "chatgpt.com" or tabURL contains "claude.ai" then
```

You can customize this list as needed, or leave only one to target a single platform.

## 📝 License

This project is licensed under the MIT License.

-----

🤖 *Built for AI-powered productivity.*