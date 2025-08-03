![AI Chatbot Broadcaster](pic_in_readme.png)

# Alfred Workflow: AI Chatbot Broadcaster
*One-Click Automated Prompt Sender for Chrome AI Chatbots and Terminal AI Agents*

An AppleScript-based **Alfred Workflow** containing two simple scripts for batch-sending messages to multiple AI chat platforms. You can easily extend this workflow to dozens or hundreds of scripts using different triggers (hotkeys, keywords, shortcuts, etc.), freely combining custom prompts with various batch-sending targets to create complex automation workflows. The two scripts provided are basic demonstrations of this concept.

**Basic Idea**: Use Alfred workflow's various triggers (hotkeys, keyword input, shortcuts, etc.) to launch the script, which will first locate specific AI chat interfaces, then send preset template content to multiple AI platforms based on your configuration (can be Alfred's Snippet expansion, direct clipboard content insertion, or other methods). You can flexibly choose trigger methods and content templates to suit different usage scenarios.

**Possible Use**: If you often need to send the same content to multiple AI chat interfaces, this script might reduce repetitive copy-pasting. You can design simple templates (like "Please explain {clipboard}", "Please translate {clipboard}", etc.) and send them to multiple chatbots at once.

**When It Might Help**: When switching between browser tabs feels tedious, or when you want to make better use of your existing AI chat service subscriptions. However, it has many limitations, requires macOS and Alfred, and may only suit specific use cases.

## Core Features

  - **Chrome Broadcasting**: The `aichatboardcaster-chrome.applescript` script can operate simultaneously on multiple AI tabs in Chrome (e.g., ChatGPT, Claude, Gemini).
  - **Terminal Control**: The `aichatboardcaster-terminal.applescript` script can send commands to your specified terminal app (e.g., Claude Code or Gemini CLI).
  - **Highly Customizable**: You can easily modify the script to target specific AI tools, configure various trigger methods (hotkeys, keywords, shortcuts, etc.), and customize the entire automation workflow.
  - **Alfred Integration**: Can work with various Alfred features including Snippet expansion, clipboard history, direct content insertion, and more.

## Prerequisites

1.  A **macOS** operating system.
2.  **Google Chrome** browser.
3.  **Alfred** with the Powerpack.
4.  Permissions granted in `System Settings > Privacy & Security > Automation` for Alfred to control Chrome, your terminal app, and System Events.
5.  **[IMPORTANT] Enable AppleScript in Chrome**:
      * In Google Chrome, click on the menu bar at the very top of the screen.
      * Navigate to **View → Developer → Allow JavaScript from Apple Events** and ensure this option is checked.

## Installation & Configuration

1.  **Import the Workflow**:

      * Download the `aichatboardcaster.alfredworkflow` file and double-click it to import it into Alfred. This workflow includes the `aichatboardcaster-chrome.applescript`, and it's easy to add the terminal script yourself.

2.  **Configure Script Actions**:

      * In the Alfred workflow editor, create the "Run Script" actions you need.
      * Paste the content of `aichatboardcaster-chrome.applescript` into one action and connect it to a trigger (e.g., **keyword `=go`**, **hotkey `Cmd+Shift+C`**, or other triggers).
      * Paste the content of `aichatboardcaster-terminal.applescript` into another action and connect it to a different trigger (e.g., **keyword `=term`**, **hotkey `Cmd+Shift+T`**, or other triggers).
      * **Important Note**: Alfred workflows support multiple trigger types (hotkeys, keywords, shortcuts, file actions, etc.). Choose the trigger method that best suits your usage habits.
      * **Chain Scripts Together**: If you want one trigger to execute both scripts sequentially (e.g., broadcast the same message to Chrome AI chats first, then to terminal AI agents), connect your trigger to Script 1, then connect Script 1's output to Script 2. This way, the trigger will execute Script 1, and after Script 1 completes, it will automatically trigger Script 2. Theoretically, you could chain multiple scripts (Script 1 → Script 2 → Script 3...) to send multiple rounds of prompts consecutively, but this approach may be unstable since AI response generation speed might not keep up with the script's prompt sending speed. You could try modifying the scripts to add delays and wait longer between executions.

3.  **Configure Alfred Snippet Expansion** (Required):

      * Open Alfred Preferences → Features → Snippets.
      * **IMPORTANT**: Make sure to check "Automatically expand snippets by keyword" option in the Snippets settings.
      * Create a snippet with a keyword that differs from your workflow trigger (e.g., workflow uses hotkey trigger, snippet uses `-go` keyword).
      * **Snippet Content**: `{datetime:long}{clipboard}` — You can customize this to create custom prompt templates.
      * **Important**: The keystroke keyword in the script must match your snippet keyword, as the script uses keystroke to trigger snippet expansion.

## Usage

Usage depends on your configured trigger type:

**Method 1 - Hotkey Trigger** (Recommended):
  - **Broadcast to Chrome**: Copy message to clipboard, then press your configured hotkey (e.g., `Cmd+Shift+C`).
  - **Send to Terminal**: Copy command to clipboard, then press your configured hotkey (e.g., `Cmd+Shift+T`).

**Method 2 - Keyword Trigger**:
  - **Broadcast to Chrome**: Copy message to clipboard, then type keyword (e.g., `=go`) in any application's text input field and press space. **Note: Must be typed in other applications' text input fields, not in Alfred's search window.**
  - **Send to Terminal**: Copy command to clipboard, then type keyword (e.g., `=term`) in any application's text input field and press space.

**Method 3 - Alfred Interface Trigger**:
  - Open Alfred search interface and type your configured keyword to launch the corresponding script.

**Note on Input Methods** (only applies when using Snippet expansion): When using keyword triggers with Snippet expansion functionality, it's recommended to switch to English input method for stable triggering. I attempted to add functionality to force English input method switching in the script, but technical limitations prevented implementation. However, I found that shorter snippet keywords (e.g., `-go`) have better compatibility with non-English input methods. **Note: Hotkey trigger methods don't require input method considerations.**

**Note on Script Delays**: Local computer hardware performance and system configuration can affect the timing requirements for script execution. If you find the script executes too quickly causing operation failures, or too slowly affecting efficiency, you can modify the delay times in the script according to your specific situation. All `delay` parameters in the scripts are customizable and should be fine-tuned based on your Mac's performance.

## Customize Target AI Tools

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

## Repository Notes

The `Authors_Private_Storage` folder in this repository serves as the author's personal storage space. Since this is a niche project with limited visibility, the author uses it to store personal `.alfredworkflow` and `.alfredsnippets` files for convenience.

## License

This project is licensed under the MIT License.

-----

*Built for AI-powered productivity.*

-----

-----

# Alfred Workflow: AI Chatbot Broadcaster
*一键触发的自动给Chrome上的AI chatbot和终端的AI agent发送prompt的AI聊天prompt自动发送器*

一个基于AppleScript的**Alfred工作流**，包含两个简单的脚本，用于批量向多个AI聊天平台发送消息。您完全可以利用Alfred工作流把这两个脚本扩展到几十上百个，并且使用不同的触发器（快捷键、关键字、热键等）触发，将不同的自定义prompt和任何批量发送的目标自由组合，实现复杂的自动化流程。提供的两个脚本只是为了简单演示这个概念。

**基本想法**：通过Alfred工作流的各种触发器（快捷键、关键字输入、热键等）来启动脚本，脚本会首先定位到特定的AI聊天界面，然后根据您的配置方式（可以是Alfred的Snippet展开功能，也可以是直接的剪贴板内容插入），将预设的模板内容发送到多个AI平台。您可以灵活选择触发方式和内容模板来适应不同的使用场景。

**可能的用途**：如果您经常需要向多个AI聊天界面发送相同的内容，这个脚本可以减少重复的复制粘贴操作。您可以设计简单的模板（如"请解释{clipboard}"、"请翻译{clipboard}"等），一次性发送给多个聊天机器人。

**适用情况**：当您觉得在浏览器标签页间切换比较麻烦，或者想要充分利用已有的AI聊天服务订阅时，这个小工具可能会有些帮助。不过它的限制较多，需要macOS和Alfred，可能只适合特定的使用场景。

## 核心功能

  - **Chrome广播**: `aichatboardcaster-chrome.applescript` 脚本可以同时在Chrome中的多个AI标签页上工作（如ChatGPT, Claude, Gemini等）。
  - **终端控制**: `aichatboardcaster-terminal.applescript` 脚本可以将指令发送到您指定的终端应用（Claude Code or Gemini CLI)”）。
  - **高度可定制**: 您可以轻松修改脚本，决定目标AI工具，配置各种触发方式（快捷键、关键字、热键等），以及定制整个自动化工作流程。
  - **Alfred集成**: 可与Alfred的各种功能配合使用，包括Snippet展开、剪贴板历史、或直接内容插入等多种方式。

## 使用前提

1.  **macOS** 操作系统。
2.  **Google Chrome** 浏览器。
3.  **Alfred** 并激活Powerpack功能。
4.  在“系统设置 \> 隐私与安全性 \> 自动化”中授予Alfred控制Chrome、终端以及System Events的权限。
5.  **【重要】开启Chrome的AppleScript权限**:
      * 在Chrome中，点击屏幕最上方的菜单栏。
      * 转到 **查看 → 开发者 → 允许 Apple 事件中的 JavaScript**，并确保该选项已被勾选。

## 安装与配置

1.  **导入工作流**:

      * 下载 `aichatboardcaster.alfredworkflow` 文件并双击导入到Alfred中。这个工作流只有aichatboardcaster-chrome.applescript，但是把aichatboardcaster-terminal.applescript加进来很容易

2.  **配置脚本动作**:

      * 在Alfred工作流编辑器中，创建您需要的"Run Script"动作。
      * 将 `aichatboardcaster-chrome.applescript` 的内容粘贴到一个动作中，并为其绑定一个触发器（例如，**关键字 `=go`**、**快捷键 `Cmd+Shift+C`**、或其他触发器）。
      * 将 `aichatboardcaster-terminal.applescript` 的内容粘贴到另一个动作中，并为其绑定另一个触发器（例如，**关键字 `=term`**、**快捷键 `Cmd+Shift+T`**、或其他触发器）。
      * **重要提示**: Alfred工作流支持多种触发器类型（快捷键、关键字、热键、文件操作等），您可以根据使用习惯自由选择最适合的触发方式。
      * **脚本串联执行**: 如果你希望让触发器触发两个脚本，例如你想让同一个模版消息在Chrome上的每个AI聊天框先广播一遍，然后给终端的AI agent又广播一遍，那么在Alfred工作流中，你应该让触发器连接脚本1，脚本1连接脚本2，这样触发器触发脚本1，然后脚本1执行完毕之后触发脚本2。如果在工作流中让触发器触发一个脚本，然后在工作流中将脚本1连上脚本2，脚本2连上脚本3... 理论可以实现让脚本发送完一轮prompt，紧接着开始在另一轮发送下一个prompt，然后又开始发送下一个prompt，但是我认为这是不稳定的，因为AI生成内容的速度可能跟不上脚本发prompt的速度，不过你可以试试修改脚本增加延迟，等待的久一点。

3.  **配置Alfred Snippet展开**（必需）:

      * 打开 Alfred 设置 → Features → Snippets。
      * **重要**: 确保在Snippets设置中勾选"Automatically expand snippets by keyword"选项。
      * 创建一个Snippet，其关键词必须与工作流触发器不同（例如，工作流用快捷键触发，Snippet用 `-go` 关键词）。
      * **Snippet内容**: `{datetime:long}{clipboard}`——您可以任意修改这里的内容来创建自定义prompt模板。
      * **重要**: 脚本中的keystroke关键词必须与Snippet关键词一致，因为脚本通过keystroke触发Snippet展开功能。

## 使用方法

使用方法取决于您配置的触发器类型：

**方式一 - 快捷键触发**（推荐）:
  - **广播到Chrome**: 复制消息到剪贴板，然后按设定的快捷键（如 `Cmd+Shift+C`）。
  - **发送到终端**: 复制指令到剪贴板，然后按设定的快捷键（如 `Cmd+Shift+T`）。

**方式二 - 关键字触发**:
  - **广播到Chrome**: 复制消息到剪贴板，然后在任何应用的文本输入框中输入关键字（如 `=go`）并按空格。**注意：需要在其他应用程序的文本输入框中输入，不能在Alfred的搜索窗口中输入。**
  - **发送到终端**: 复制指令到剪贴板，然后在任何应用的文本输入框中输入关键字（如 `=term`）并按空格。

**方式三 - Alfred界面触发**:
  - 打开Alfred搜索界面，输入配置的关键字来启动相应脚本。

**关于输入法的补充说明**（仅适用于使用Snippet展开的情况）: 当使用关键字触发并配合Snippet展开功能时，建议切换到英文输入法以确保触发稳定。我曾试图通过在脚本中增加强制切换英文输入法的功能，但由于技术限制未能实现。不过发现snippet关键词越短（例如`-go`），在中文输入法下的兼容性越好。**注意：使用快捷键触发的方式无需考虑输入法问题。**

**关于脚本延迟的补充说明**: 本地电脑的硬件性能和系统配置会导致脚本执行的延迟需求不同。如果您发现脚本执行过快导致操作失败，或执行过慢影响效率，可以根据自身情况修改脚本中的延迟时间。脚本中的`delay`参数都是可以自定义调整的，建议根据您的Mac性能进行微调。

## 定制目标AI工具

您可以轻松修改 `aichatboardcaster-chrome.applescript` 脚本，使其只对特定的AI工具生效，实现“精确弹射”而不是“全体广播”。

打开脚本，找到这一行：

```applescript
if tabURL contains "aistudio.google.com" or tabURL contains "chatgpt.com" or tabURL contains "claude.ai" or tabURL contains "gemini.google.com" then
```

**修改示例**: 如果您只想让它在ChatGPT和Claude上工作，只需删除其他部分：

```applescript
if tabURL contains "chatgpt.com" or tabURL contains "claude.ai" then
```

## 仓库说明

本仓库中的`Authors_Private_Storage`文件夹是作者的私人存放点。由于这是一个冷门项目，作者懒得分公私，直接用这里存放个人的`.alfredworkflow`和`.alfredsnippets`文件。

## 许可

本项目采用 MIT 许可。

*为AI驱动的生产力而生*