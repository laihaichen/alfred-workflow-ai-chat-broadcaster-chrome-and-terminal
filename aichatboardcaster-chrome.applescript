-- *****************************************************************
-- ** Universal AI Submitter v6.0 (Perfect Balance Edition)         **
-- ** 功能: 聚焦, 输入, 展开, 等待按钮激活, 然后自动点击发送        **
-- ** 完美: 找到了最佳临界点，最快且稳定的完美平衡              **
-- *****************************************************************

-- 主脚本
tell application "Google Chrome"
    -- 1. 激活Chrome
    activate
    
    -- 2. 收集所有符合条件的AI聊天页面
    set aiPages to {}
    try
        repeat with w_index from 1 to (count of windows)
            repeat with t_index from 1 to (count of tabs of window w_index)
                set tabURL to URL of tab t_index of window w_index
                if tabURL contains "aistudio.google.com" or tabURL contains "chatgpt.com" or tabURL contains "claude.ai" or tabURL contains "gemini.google.com" or tabURL contains "huggingface.co" or tabURL contains "lmarena.ai" then
                    set end of aiPages to {win:w_index, tab:t_index}
                end if
            end repeat
        end repeat
    on error
        -- 如果获取URL出错，则忽略
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
            
            -- 确保Chrome在前台
            tell application "System Events" to set frontmost of process "Google Chrome" to true
            delay 0.02 -- 终极窗口切换
            
            -- 4. 使用JavaScript来聚焦输入框
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
            
            delay 0.03 -- JS聚焦终极优化
            
            -- 5. 使用系统级按键模拟输入和展开
            tell application "System Events"
                keystroke "-go"
                delay 0.075 -- 【临界点】workflow完美平衡间隔
                keystroke " "
            end tell
            
            delay 0.15 -- 展开等待临界点优化
            
            -- 6. 【功能升级】使用带“智能等待”的JS来查找并点击发送按钮
            tell tab tab_idx of window win_idx
                execute javascript "
                    var sendButtonSelectors = [
                        'button[aria-label=\"Run\"]',                  // Google AI Studio
                        'button[data-testid=\"send-button\"]',           // ChatGPT
                        'button[aria-label=\"Send message\"]',         // Gemini
                        'button[aria-label=\"Send Message\"]',         // Claude
                        'button[type=\"submit\"]:not([disabled])',       // lmarena.ai (直接匹配非禁用状态)
                        'button.btn-widget[type=\"submit\"]',            // 另一个通用按钮
                        'button[class*=\"send\"]'                        // 通用class包含send的按钮
                    ];

                    function tryClickSendButton() {
                        for (var i = 0; i < sendButtonSelectors.length; i++) {
                            var btn = document.querySelector(sendButtonSelectors[i]);
                            // 再次确认按钮存在且不是被禁用的状态
                            if (btn && !btn.disabled) {
                                btn.click();
                                return true; // 成功点击，返回true
                            }
                        }
                        return false; // 未找到或仍被禁用，返回false
                    }

                    // 每50毫秒尝试点击一次，最多尝试20次（即1秒）- 终极优化
                    var retries = 0;
                    var maxRetries = 20;
                    var interval = setInterval(function() {
                        // 如果成功点击，或者重试次数超限，则停止
                        if (tryClickSendButton() || retries >= maxRetries) {
                            clearInterval(interval);
                        }
                        retries++;
                    }, 50);
                "
            end tell
            
            delay 0.03 -- 发送完成终极等待
            
        on error errMsg
            -- 忽略处理单个页面时可能发生的错误
        end try
        
        -- 【临界点】页面间隔，最佳平衡点
        delay 0.18 -- 临界点完美平衡，避免workflow冲突
    end repeat
    
    display notification "已在 " & (count of aiPages) & " 个页面上尝试发送。" with title "任务完成"
end tell

return "Script finished successfully."