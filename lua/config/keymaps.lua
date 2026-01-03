-- ==========================================================================
-- config/keymaps.lua
-- ==========================================================================
local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_x = { "x" }

-- VSCode 助手函数
local vscode = _G.IsVSCode and require('vscode-neovim') or nil
local function vsc(action)
    if _G.IsVSCode then vscode.call(action) end
end

-- 动态获取当前配置文件路径 (跨平台支持)
local config_dir = vim.fn.stdpath("config")
local keymaps_file = config_dir .. "/lua/config/keymaps.lua"

-- ==========================================================================
-- 映射定义表
-- from: 触发键, to: 原生指令, vsto: VSCode 指令(String), mode: 模式
-- ==========================================================================
local nmappings = {
    -- 基础移动 (H/L 到行首行尾，J/K 快速跳转)
    { from = "J", to = "5j", mode = mode_nv },
    { from = "K", to = "5k", mode = mode_nv },
    { from = "H", to = "^",  mode = mode_nv },
    { from = "L", to = "$",  mode = mode_nv },

    -- 禁用方向键 (强制习惯 hjkl)
    { from = "<Up>",    to = "<Nop>", mode = mode_n },
    { from = "<Down>",  to = "<Nop>", mode = mode_n },
    { from = "<Left>",  to = "<Nop>", mode = mode_n },
    { from = "<Right>", to = "<Nop>", mode = mode_n },

    -- 窗口导航
    { from = "<LEADER>w", to = "<C-w>w", vsto = "workbench.action.focusNextGroup", mode = mode_n },
    { from = "<LEADER>j", to = "<C-w>j", vsto = "workbench.action.navigateDown",  mode = mode_n },
    { from = "<LEADER>k", to = "<C-w>k", vsto = "workbench.action.navigateUp",    mode = mode_n },
    { from = "<LEADER>h", to = "<C-w>h", vsto = "workbench.action.navigateLeft",  mode = mode_n },
    { from = "<LEADER>l", to = "<C-w>l", vsto = "workbench.action.navigateRight", mode = mode_n },
    { from = "<LEADER>q", to = "<C-w>q", vsto = "workbench.action.closeActiveEditor", mode = mode_n },

    -- 分屏与窗口移动
    { from = "<LEADER>sj", to = "<C-w>s", vsto = "workbench.action.splitEditorDown", mode = mode_n },
    { from = "<LEADER>sl", to = "<C-w>v", vsto = "workbench.action.splitEditor",     mode = mode_n },
    { from = "<LEADER>sh", to = "<C-w>H", vsto = "workbench.action.moveActiveEditorGroupLeft",  mode = mode_n },
    { from = "<LEADER>sk", to = "<C-w>L", vsto = "workbench.action.moveActiveEditorGroupRight", mode = mode_n },

    -- 调整窗口大小
    { from = "<up>",    to = ":res +5<CR>",          vsto = "workbench.action.increaseViewHeight", mode = mode_n },
    { from = "<down>",  to = ":res -5<CR>",          vsto = "workbench.action.decreaseViewHeight", mode = mode_n },
    { from = "<left>",  to = ":vertical resize-5<CR>", vsto = "workbench.action.decreaseViewWidth",  mode = mode_n },
    { from = "<right>", to = ":vertical resize+5<CR>", vsto = "workbench.action.increaseViewWidth",  mode = mode_n },

    -- 代码折叠 (适配 VSCode 原生逻辑)
	{ from = "za",  to = "za",  vsto = "editor.toggleFold",        mode = mode_n },
	{ from = "zR",  to = "zR",  vsto = "editor.unfoldAll",         mode = mode_n },
	{ from = "zM",  to = "zM",  vsto = "editor.foldAll",           mode = mode_n },
	{ from = "zo",  to = "zo",  vsto = "editor.unfold",            mode = mode_n },
	{ from = "zO",  to = "zO",  vsto = "editor.unfoldRecursively", mode = mode_n },
	{ from = "zc",  to = "zc",  vsto = "editor.fold",              mode = mode_n },
	{ from = "zC",  to = "zC",  vsto = "editor.foldRecursively",   mode = mode_n },
	{ from = "z1",  to = "z1",  vsto = "editor.foldLevel1",        mode = mode_n },
    { from = "z2",  to = "z2",  vsto = "editor.foldLevel2",        mode = mode_n },
    { from = "z3",  to = "z3",  vsto = "editor.foldLevel3",        mode = mode_n },
    { from = "z4",  to = "z4",  vsto = "editor.foldLevel4",        mode = mode_n },
    { from = "z5",  to = "z5",  vsto = "editor.foldLevel5",        mode = mode_n },
    { from = "z6",  to = "z6",  vsto = "editor.foldLevel6",        mode = mode_n },
    { from = "z7",  to = "z7",  vsto = "editor.foldLevel7",        mode = mode_n },

        -- buffer hotkey          
	{ from = "<LEADER> [b",  to = ":bprevious<CR>",                                                                                     mode = mode_n },
	{ from = "<LEADER> ]b",  to = ":bnext<CR>",                                                                                         mode = mode_n },
	{ from = "<LEADER> [B",  to = ":bfirst<CR>",                                                                                        mode = mode_n },
	{ from = "<LEADER> ]B",  to = ":blast<CR>",                                                                                         mode = mode_n },
	{ from = "tt",           to = ":tabe<CR>",                                                                                          mode = mode_n },
	{ from = "tT",           to = ":tab split<CR>",                                                                                     mode = mode_n },
	{ from = "th",           to = ":-tabnext<CR>",    vsto = "workbench.action.nextEditor",                 mode = mode_n },
	{ from = "tl",           to = ":+tabnext<CR>",    vsto = "workbench.action.previousEditor",             mode = mode_n },   
	{ from = "tmh",          to = ":-tabmove<CR>",    vsto = "workbench.action.moveEditorLeftInGroup",      mode = mode_n },
	{ from = "tml",          to = ":+tabmove<CR>",    vsto = "workbench.action.moveEditorRightInGroup",     mode = mode_n },
    { from = "<C-w>q",       to = "<C-w>q",           vsto = "workbench.action.closeEditorsInGroup",        mode = mode_n },
	
    -- 文件与系统
    { from = "<LEADER>s",  to = ":w<CR>", vsto = "workbench.action.files.save", mode = mode_n },
	{ from = "<LEADER>q",  to = ":q<CR>", vsto = "workbench.action.closeActiveEditor", mode = mode_n },
	-- { from = "<leader>R",  to = ":source $MYVIMRC<CR>", vsto = ":!code " .. keymaps_file .. "<CR>", mode = mode_n },
	-- { from = "<LEADER>rc",        to = ":e ~/.config/nvim/init.vim<CR>",  vsto = ":!code " .. keymaps_file .. "<CR>",                              mode = mode_n },
	-- { from = "<LEADER>ri",        to = ":e ~/.config/i3/config<CR>",      vsto = "",                                                               mode = mode_n },
	-- { from = "<LEADER>rr",        to = ":e ~/.config/ranger/rc.conf<CR>", vsto = "",                                                               mode = mode_n },
	-- { from = "<LEADER>ra",        to = ":e ~/.config/alacritty/alacritty.yml<CR>", vsto = "",                                                      mode = mode_n },
	-- { from = "<LEADER>rz",        to = ":e $HOME/.zshrc<CR>",    vsto = "",                                                                        mode = mode_n },
    -- tag hotkey          
    -- set ex history scroll          
	{ from = "<C-p>",             to = "<Up>",                                                                                                     mode = mode_nv},
	{ from = "<C-n>",             to = "<Down>",                                                                                                   mode = mode_nv},
    -- set hotkey of off highlight for search           
	{ from = "<LEADER><CR>",      to = ":<C-u>nohlsearch<CR><C-l>",                                                                                mode = mode_nv},
}

-- ==========================================================================
-- 执行映射循环
-- ==========================================================================
for _, m in ipairs(nmappings) do
    local target = m.to
    if _G.IsVSCode and m.vsto then
        if m.vsto:sub(1,1) == ":" or m.vsto:sub(1,1) == "<" then
            target = m.vsto
        else
            target = function() vscode.call(m.vsto) end
        end
    end
    vim.keymap.set(m.mode, m.from, target, { noremap = true, silent = true })
end

-- ==========================================================================
-- VSCode 特有增强 (如 gj/gk 处理自动换行)
-- ==========================================================================
if _G.IsVSCode then
    vim.keymap.set(mode_nv, "j", 'gj', { noremap = true })
    vim.keymap.set(mode_nv, "k", 'gk', { noremap = true })
    
    -- 系统剪切板修正 (Mac/Win 差异通常由 options 处理，此处可留空)
end

-- ==========================================================================
-- 搜索增强函数 (VSetSearch)
-- ==========================================================================
-- _G.VSetSearch = function()
--     local temp = vim.fn.getreg('s')
--     vim.cmd('norm! gv"sy')
--     local search_pattern = '\\V' .. vim.fn.escape(vim.fn.getreg('s'), '/\\'):gsub('\n', '\\n')
--     vim.fn.setreg('/', search_pattern)
--     vim.fn.setreg('s', temp)
-- end

-- vim.keymap.set(mode_x, "*", ":<C-u>lua VSetSearch()<CR>/<CR>=@/<CR><CR>", { silent = true })
-- vim.keymap.set(mode_x, "#", ":<C-u>lua VSetSearch()<CR>?<CR>=@/<CR><CR>", { silent = true })