-- *****************************************************************
-- ** AI Chat Broadcaster for Terminal                            **
-- ** Function: Activate terminal, input command and execute      **
-- ** Customizable: Terminal app name and all delays can be       **
-- ** modified to suit different systems and applications         **
-- *****************************************************************

-- ----------- CUSTOMIZABLE CONFIGURATION -----------
-- CUSTOMIZABLE: Change "Terminal" to your specific terminal app name, e.g., "iTerm"
property targetTerminalApp : "Terminal"
-- ------------------------------------------------

try
    -- 1. Activate target terminal application
    tell application targetTerminalApp
        activate
    end tell
    
    delay 0.04 -- CUSTOMIZABLE: Application window switching delay
    
    -- 2. Use System Events to simulate keyboard input
    tell application "System Events"
        -- Ensure target application is frontmost
        tell process targetTerminalApp
            set frontmost to true
        end tell
        
        -- 3. Input command
        -- CUSTOMIZABLE: Change "-go" to match your Alfred snippet keyword
        keystroke "-go"
        delay 0.09 -- CUSTOMIZABLE: Keystroke interval delay
        keystroke " " -- Trigger Alfred Snippet expansion
        
        delay 0.3 -- CUSTOMIZABLE: Snippet expansion completion wait time
        
        -- 4. Press Enter key to send/execute command
        key code 36 -- Return key code
        
    end tell
    
    return "Command sent to " & targetTerminalApp
    
on error errMsg
    display notification "Script error when operating terminal: " & errMsg with title "Execution Error"
    return "Error: " & errMsg
end try