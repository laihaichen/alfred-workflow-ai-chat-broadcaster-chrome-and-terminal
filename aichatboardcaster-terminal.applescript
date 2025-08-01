-- *****************************************************************
-- ** Terminal AI Agent Submitter v1.0                            **
-- ** 功能: 激活终端, 输入指令并按回车执行                         **
-- *****************************************************************

-- ----------- 配置区域 -----------
-- 请将 "终端" 修改为您正在使用的终端应用的准确名称, 例如 "iTerm"
property targetTerminalApp : "终端"
-- --------------------------------

try
    -- 1. 激活目标终端应用
    tell application targetTerminalApp
        activate
    end tell
    
    delay 0.04 -- 等待应用窗口切换
    
    -- 2. 使用 System Events 来模拟键盘输入
    tell application "System Events"
        -- 确保目标应用是当前最前端的应用
        tell process targetTerminalApp
            set frontmost to true
        end tell
        
        -- 3. 输入指令
        -- 这里我们直接使用 `-go` 这个关键词，让Alfred去展开它
        keystroke "-go"
        delay 0.075
        keystroke " " -- 触发Alfred Snippet展开
        
        delay 0.15 -- 等待Snippet展开完成
        
        -- 4. 按下回车键来发送/执行命令
        key code 36 -- 'Return' (回车) 键的键码
        
    end tell
    
    return "Command sent to " & targetTerminalApp
    
on error errMsg
    display notification "脚本在操作终端时出错: " & errMsg with title "执行错误"
    return "Error: " & errMsg
end try