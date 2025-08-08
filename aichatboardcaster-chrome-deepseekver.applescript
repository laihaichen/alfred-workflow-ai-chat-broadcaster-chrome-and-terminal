-- *****************************************************************
-- ** AI Chat Broadcaster for Chrome                              **
-- ** Function: Focus input field, expand snippet, wait for      **
-- ** button activation, then automatically click send           **
-- ** Customizable: All delay parameters and target URLs can     **
-- ** be modified to suit different hardware and requirements    **
-- *****************************************************************

-- Main script execution
tell application "Google Chrome"
    -- 1. Activate Chrome browser
    activate
    
    -- 2. Collect all eligible AI chat pages
    -- CUSTOMIZABLE: Add or remove URLs in the condition below to target specific AI platforms
    set aiPages to {}
    try
        repeat with w_index from 1 to (count of windows)
            repeat with t_index from 1 to (count of tabs of window w_index)
                set tabURL to URL of tab t_index of window w_index
                -- CUSTOMIZABLE: Modify this condition to target specific AI platforms
                if tabURL contains "deepseek.com" then
                    set end of aiPages to {win:w_index, tab:t_index}
                end if
            end repeat
        end repeat
    on error
        -- Ignore errors when retrieving URLs
    end try
    
    if (count of aiPages) is 0 then
        display notification "没有找到符合条件的AI聊天页面。" with title "执行终止"
        return "No AI pages found."
    end if
    
    -- 3. 依次处理每一个找到的AI页面
    repeat with pageInfo in aiPages
        try
            -- 激活目标标签页
            set win_idx to win of pageInfo
            set tab_idx to tab of pageInfo
            tell window win_idx
                set active tab index to tab_idx
                set index to 1
            end tell
            
            -- Ensure Chrome is in foreground
            tell application "System Events" to set frontmost of process "Google Chrome" to true
            delay 0.02 -- CUSTOMIZABLE: Window switching delay (adjust for slower systems)
            
            -- 4. Use JavaScript to focus input field
            -- CUSTOMIZABLE: Add selectors for additional AI platforms
            tell tab tab_idx of window win_idx
                execute javascript "
                    var el = document.querySelector('.ql-editor, #prompt-textarea, textarea:not([readonly]), div[contenteditable=\"true\"]');
                    if (el) {
                        el.focus();
                        el.click();
                        if (el.value !== undefined) { el.value = ''; } else { el.textContent = ''; }
                        el.focus();
                    }
                "
            end tell
            
            delay 0.03 -- CUSTOMIZABLE: JavaScript focus optimization delay
            
            -- 5. Use system-level keystrokes for input and expansion
            tell application "System Events"
                keystroke "-go" -- CUSTOMIZABLE: Change to match your Alfred snippet keyword
                delay 0.075 -- CUSTOMIZABLE: Critical workflow balance interval
            end tell
            
            delay 0.15 -- CUSTOMIZABLE: Snippet expansion wait time



-- 6. DeepSeek: click the blue arrow (精简版)
tell tab tab_idx of window win_idx
    execute javascript "
        (async () => {
          const sleep = ms => new Promise(r => setTimeout(r, ms));
          
          // 1) 找按钮 -> (DeepSeek特定选择器)
          await sleep(100); // 等snippet展开
          let btn = document.querySelector('div[role=\"button\"]._7436101.bcc55ca1');
          
          // 2) 兜底 -> (通用发送按钮)  
          if (!btn) {
            const buttons = document.querySelectorAll('[role=\"button\"],button');
            for (const b of buttons) {
              const aria = b.getAttribute('aria-label') || '';
              const cls = (b.className || '').toString();
              const txt = (b.textContent || '').trim();
              // 找发送按钮，排除ds-button
              if (!cls.includes('ds-button') && 
                  (aria.toLowerCase().includes('send') || 
                   b.type === 'submit' || 
                   txt.length <= 2)) {
                btn = b;
                break;
              }
            }
          }
          
          // 3) 等待可点 + 点击
          if (btn) {
            const wait = Date.now() + 1000;
            while (btn.getAttribute('aria-disabled') === 'true' && Date.now() < wait) {
              await sleep(50);
            }
            btn.click();
          }
        })();
    "
end tell

            
            delay 0.03 -- CUSTOMIZABLE: Post-send completion delay
            
        on error errMsg
            -- Ignore errors that may occur when processing individual pages
        end try
        
        -- CUSTOMIZABLE: Inter-page interval for optimal performance balance
        delay 0.18 -- Critical balance point to avoid workflow conflicts
    end repeat
    
    display notification "Attempted to send on " & (count of aiPages) & " pages." with title "Task Completed"
end tell

return "Script finished successfully."