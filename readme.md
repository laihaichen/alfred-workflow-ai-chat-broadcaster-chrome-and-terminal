# AI Chat Broadcaster 🚀

An AppleScript-based **Alfred Workflow** containing two simple scripts for batch-sending messages to multiple AI chat platforms. You can easily extend this workflow to dozens or hundreds of scripts using different keyword triggers, freely combining custom prompts with various batch-sending targets to create complex automation workflows. The two scripts provided are basic demonstrations of this concept.

**Basic Idea**: Type a designated shortcut phrase (like `=go`) anywhere you can input text (Notepad, editors, documents, etc.), and the script will first locate specific AI chat interfaces, then simulate physical keyboard input to trigger Alfred's Snippet expansion. The clipboard content serves as a parameter for the template, and users can customize any needed template prompts through Snippets.

**Possible Use**: If you often need to send the same content to multiple AI chat interfaces, this script might reduce repetitive copy-pasting. You can design simple templates (like "Please explain {clipboard}", "Please translate {clipboard}", etc.) and send them to multiple chatbots at once.

**When It Might Help**: When switching between browser tabs feels tedious, or when you want to make better use of your existing AI chat service subscriptions. However, it has many limitations, requires macOS and Alfred, and may only suit specific use cases.

## ✨ Core Features

  - **🎯 Chrome Broadcasting**: The `aichatboardcaster-chrome.applescript` script can operate simultaneously on multiple AI tabs in Chrome (e.g., ChatGPT, Claude, Gemini).
  - **⌨️ Terminal Control**: The `aichatboardcaster-terminal.applescript` script can send commands to your specified terminal app (e.g., Claude Code or Gemini CLI).
  - **🔧 Highly Customizable**: You can easily modify the script to target specific AI tools, change keystroke keywords to correspond with different snippets, and customize the entire automation workflow.
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

      * Download the `aichatboardcaster.alfredworkflow` file and double-click it to import it into Alfred. This workflow includes the `aichatboardcaster-chrome.applescript`, and it's easy to add the terminal script yourself.

2.  **Configure Script Actions**:

      * In the Alfred workflow editor, create the "Run Script" actions you need.
      * Paste the content of `aichatboardcaster-chrome.applescript` into one action and connect it to a trigger (e.g., the **keyword `=go`**).
      * Paste the content of `aichatboardcaster-terminal.applescript` into another action and connect it to a different trigger (e.g., the **keyword `=term`**).

3.  **Configure the Alfred Snippet**:

      * Open Alfred Preferences → Features → Snippets.
      * Create a corresponding snippet with a keyword that is different from your workflow trigger (e.g., use `-go` as the snippet keyword for the `=go` workflow trigger).
      * **Snippet Content**: `{datetime:long}{clipboard}` — You can customize this to create a unique prompt structure. Just remember that the keystroke command in the AppleScript must be updated to match your snippet's keyword.
      * **Advanced Usage**: You can enable Alfred's clipboard history feature to use `{clipboard:0}` as the prompt and `{clipboard:1}` as the command prefix, then trigger broadcasts with any designed shortcut phrase (e.g., `=01`).

## 🚀 Usage

  - **Broadcast to Chrome**: Copy a message to your clipboard, then type `=go` anywhere and press space. The script will automatically perform its tasks on all eligible AI pages in Chrome. (Note: This must be typed in a text input field of other applications, not in Alfred's own search window)
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

## 📁 Repository Notes

The `Authors_Private_Storage` folder in this repository serves as the author's personal storage space. Since this is a niche project with limited visibility, the author uses it to store personal `.alfredworkflow` and `.alfredsnippets` files for convenience.

## 📝 License

This project is licensed under the MIT License.

-----

🤖 *Built for AI-powered productivity.*

-----

-----

# AI Chat Broadcaster 🚀

一个基于AppleScript的**Alfred工作流**，包含两个简单的脚本，用于批量向多个AI聊天平台发送消息。您完全可以利用Alfred工作流把这两个脚本扩展到几十上百个，并且使用不同的关键字触发器触发，将不同的自定义prompt和任何批量发送的目标自由组合，实现复杂的自动化流程。提供的两个脚本只是为了简单演示这个概念。

**基本想法**：在任何能输入文字的地方（记事本、编辑器、文档等）输入指定的快捷短语（如`=go`），脚本会首先定位到特定的AI聊天界面，然后模拟物理键盘输入来触发Alfred的Snippet展开功能。剪贴板内容作为模板的参数，用户可以通过Snippet自定义任何需要的模板prompt。

**可能的用途**：如果您经常需要向多个AI聊天界面发送相同的内容，这个脚本可以减少重复的复制粘贴操作。您可以设计简单的模板（如"请解释{clipboard}"、"请翻译{clipboard}"等），一次性发送给多个聊天机器人。

**适用情况**：当您觉得在浏览器标签页间切换比较麻烦，或者想要充分利用已有的AI聊天服务订阅时，这个小工具可能会有些帮助。不过它的限制较多，需要macOS和Alfred，可能只适合特定的使用场景。

## ✨ 核心功能

  - **🎯 Chrome广播**: `aichatboardcaster-chrome.applescript` 脚本可以同时在Chrome中的多个AI标签页上工作（如ChatGPT, Claude, Gemini等）。
  - **⌨️ 终端控制**: `aichatboardcaster-terminal.applescript` 脚本可以将指令发送到您指定的终端应用（Claude Code or Gemini CLI)”）。
  - **🔧 高度可定制**: 您可以轻松修改脚本，决定目标AI工具，修改keystroke关键词以对应不同的snippet，以及定制整个自动化工作流程。
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
      * 创建一个Snippet，其关键词必须与工作流触发器的关键词不同（例如，为 `=go` 工作流触发器使用 `-go` 作为Snippet关键词）。
      * **Snippet内容**: `{datetime:long}{clipboard}`——你可以任意修改这里的内容使得其变成订制prompt，唯一需要注意的是脚本里的keystroke关键词要改成和Snippet里的关键词一样
      * **高级用法**: 你可以开启Alfred中的clipboard history功能，从而实现让`{clipboard:0}`当作prompt，`{clipboard:1}`当作指令前缀，然后使用设计好的任意快捷短语（例如`=01`）触发广播

## 🚀 使用方法

  - **广播到Chrome**: 复制消息到剪贴板，然后在任何地方输入 `=go` 并按空格，脚本将自动在Chrome中所有符合条件的AI页面上执行任务。（注意：必须在其他应用程序的文本输入框中输入，不能在Alfred的搜索窗口中输入）
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

## 📁 仓库说明

本仓库中的`Authors_Private_Storage`文件夹是作者的私人存放点。由于这是一个冷门项目，作者懒得分公私，直接用这里存放个人的`.alfredworkflow`和`.alfredsnippets`文件。

## 📝 许可

本项目采用 MIT 许可。

🤖 *为AI驱动的生产力而生*