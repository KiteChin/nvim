local opt = vim.opt
-- set tab for appointed space
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true 

-- set the number of command in buffer
opt.history = 500
opt.ignorecase = true
opt.smartcase = true
opt.clipboard:append("unnamedplus")
-- default on
opt.hidden = true
opt.number = true
opt.relativenumber = true

opt.wildmenu = true
opt.showcmd = true
opt.wrap = true
opt.cursorline = true
opt.foldmethod = "syntax"
-- syntax on

-- 跨平台剪切板优化
if _G.IsMac then
    -- Mac 通常 unnamedplus 配合 pbcopy 没问题
elseif _G.IsWin then
    -- Windows 默认 unnamedplus 性能尚可
elseif _G.IsLinux then
    -- 如果是 WSL 环境，建议检查并安装 win32yank.exe
end

-- 针对 VSCode 禁用部分 UI 选项以提升性能
if _G.IsVSCode then
    opt.number = false
    opt.relativenumber = false
    opt.cursorline = false
    opt.wrap = true
end