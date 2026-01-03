-- ==========================================================================
-- 1. 环境检测 (OS & Editor)
-- ==========================================================================
_G.IsVSCode = vim.g.vscode ~= nil
_G.IsWin = vim.loop.os_uname().version:find("Windows") ~= nil
_G.IsMac = vim.loop.os_uname().sysname == "Darwin"
_G.IsLinux = not _G.IsWin and not _G.IsMac

-- 设置 Leader 键 (必须在加载插件前设置)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 1. 定义一个获取环境信息的函数
local function get_env_info()
    local editor = _G.IsVSCode and "VSCode" or "Neovim"
    local os = "Linux"
    if _G.IsWin then os = "Windows" end
    if _G.IsMac then os = "Mac" end
    
    return string.format(" [%s | %s] ", editor, os)
end

-- 2. 将函数导出给状态栏使用
-- 注意：状态栏需要 %{} 语法来执行 Lua 函数
-- vim.opt.statusline = "%f%m%r%h%w" .. "%=" .. get_env_info() .. "%y %p%% %l:%c"

-- ==========================================================================
-- 2. 加载模块
-- ==========================================================================
require("config.options")
require("config.keymaps")
require("config.lazy")