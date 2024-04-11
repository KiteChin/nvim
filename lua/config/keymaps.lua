local isLinux = false
if isLinux then
	vscode = ""
else
	vscode = require('vscode-neovim')
end

vim.g.mapleader = " "
local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_x = { "x" }
local nmappings = 
{
    -- J,K,H,L
	{ from = "J",                 to = "5j",                                                                   mode = mode_nv},
	{ from = "K",                 to = "5k",                                                                   mode = mode_nv},
	{ from = "H",                 to = "^",                                                                    mode = mode_nv},
	{ from = "L",                 to = "$",                                                                    mode = mode_nv},
    -- can change map for else.          
	{ from = "<Up>",              to = "<Nop>",                                                                mode = mode_n },
	{ from = "<Down>",            to = "<Nop>",                                                                mode = mode_n },
	{ from = "<Left>",            to = "<Nop>",                                                                mode = mode_n },
	{ from = "<Right>",           to = "<Nop>",                                                                mode = mode_n },
    -- window hotkey          
	{ from = "<LEADER>w",         to = isLinux and "<C-w>w" or "<Cmd>lua vscode.call('workbench.action.focusNextGroup')<CR>", mode = mode_n },
	{ from = "<LEADER>j",         to = isLinux and "<C-w>j" or "<Cmd>lua vscode.call('workbench.action.navigateDown')<CR>", mode = mode_n },
	{ from = "<LEADER>k",         to = isLinux and "<C-w>k" or "<Cmd>lua vscode.call('workbench.action.navigateUp')<CR>", mode = mode_n },
	{ from = "<LEADER>h",         to = isLinux and "<C-w>h" or "<Cmd>lua vscode.call('workbench.action.navigateLeft')<CR>", mode = mode_n },
	{ from = "<LEADER>l",         to = isLinux and "<C-w>l" or "<Cmd>lua vscode.call('workbench.action.navigateRight')<CR>", mode = mode_n },
	{ from = "<LEADER>o",         to = isLinux and "<C-w>o" or "", mode = mode_n },
	{ from = "<LEADER>q",         to = isLinux and "<C-w>q" or "<Cmd>lua vscode.call('workbench.action.closeEditorsAndGroup')<CR>", mode = mode_n },
	{ from = "<LEADER><S-j>",     to = isLinux and "<C-w>J" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupDown')<CR>", mode = mode_n },
	{ from = "<LEADER><S-k>",     to = isLinux and "<C-w>K" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupUp')<CR>", mode = mode_n },  
	{ from = "<LEADER><S-h>",     to = isLinux and "<C-w>H" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupLeft')<CR>", mode = mode_n },
	{ from = "<LEADER><S-l>",     to = isLinux and "<C-w>L" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupRight')<CR>", mode = mode_n },
	{ from = "sj",                to = isLinux and "<C-w>s" or "<Cmd>lua vscode.call('workbench.action.splitEditorDown')<CR>", mode = mode_n },
	{ from = "sl",                to = isLinux and "<C-w>v" or "<Cmd>lua vscode.call('workbench.action.splitEditor')<CR>", mode = mode_n },
	{ from = "<up>",              to = isLinux and ":res +5<CR>" or "<Cmd>lua vscode.call('workbench.action.increaseViewHeight')<CR>", mode = mode_n },
	{ from = "<down>",            to = isLinux and ":res -5<CR>" or "<Cmd>lua vscode.call('workbench.action.decreaseViewHeight')<CR>", mode = mode_n },  
	{ from = "<left>",            to = isLinux and ":vertical resize-5<CR>" or "<Cmd>lua vscode.call('workbench.action.decreaseViewWidth')<CR>", mode = mode_n },
	{ from = "<right>",           to = isLinux and ":vertical resize+5<CR>" or "<Cmd>lua vscode.call('workbench.action.increaseViewWidth')<CR>", mode = mode_n },
    -- buffer hotkey          
	{ from = "<silent> [b",       to = ":bprevious<CR>",                                                       mode = mode_n },
	{ from = "<silent> ]b",       to = ":bnext<CR>",                                                           mode = mode_n },
	{ from = "<silent> [B",       to = ":bfirst<CR>",                                                          mode = mode_n },
	{ from = "<silent> ]B",       to = ":blast<CR>",                                                           mode = mode_n },
    -- for file operation          
	{ from = "<LEADER>s",         to = isLinux and ":w<CR>" or "<Cmd>lua vscode.call('workbench.action.files.save')<CR>", mode = mode_n },
	{ from = "<LEADER>q",         to = isLinux and ":q<CR>" or "<Cmd>lua vscode.call('workbench.action.closeActiveEditor')<CR>", mode = mode_n },
	{ from = "<leader>R",         to = ":source $MYVIMRC<CR>",                                                 mode = mode_n },
	{ from = "<LEADER>rc",        to = ":e ~/.config/nvim/init.vim<CR>",                                       mode = mode_n },
	{ from = "<LEADER>ri",        to = isLinux and ":e ~/.config/i3/config<CR>" or "",                         mode = mode_n },
	{ from = "<LEADER>rr",        to = isLinux and ":e ~/.config/ranger/rc.conf<CR>" or "",                    mode = mode_n },
	{ from = "<LEADER>ra",        to = isLinux and ":e ~/.config/alacritty/alacritty.yml<CR>" or "",           mode = mode_n },
	{ from = "<LEADER>rz",        to = isLinux and ":e $HOME/.zshrc<CR>" or "",                                mode = mode_n },
    -- tag hotkey          
	{ from = "tt",                to = ":tabe<CR>",                                                            mode = mode_n },
	{ from = "tT",                to = ":tab split<CR>",                                                       mode = mode_n },
	{ from = "th",                to = isLinux and ":-tabnext<CR>" or "<Cmd>lua vscode.call('workbench.action.nextEditor')<CR>", mode = mode_n },
	{ from = "tl",                to = isLinux and ":+tabnext<CR>" or "<Cmd>lua vscode.call('workbench.action.previousEditor')<CR>", mode = mode_n },   
	{ from = "tmh",               to = isLinux and ":-tabmove<CR>" or "<Cmd>lua vscode.call('workbench.action.moveEditorLeftInGroup')<CR>", mode = mode_n },
	{ from = "tml",               to = isLinux and ":+tabmove<CR>" or "<Cmd>lua vscode.call('workbench.action.moveEditorRightInGroup')<CR>", mode = mode_n },
    -- set ex history scroll          
	{ from = "<C-p>",             to = "<Up>",                                                                 mode = mode_nv},
	{ from = "<C-n>",             to = "<Down>",                                                               mode = mode_nv},
    -- set hotkey of off highlight for search           
	{ from = "<LEADER><CR>",      to = ":<C-u>nohlsearch<CR><C-l>",                                            mode = mode_nv},
    -- switch current directory          
	{ from = "<leader>cd",        to = ":cd %:p:h<CR>:pwd<CR>",                                                mode = mode_nv},
    -- get current path in cmd by typed %%.          
	{ from = "*",                 to = ":<C-u>lua VSetSearch()<CR>/<CR>=@/<CR><CR>",                           mode = mode_x },
	{ from = "#",                 to = ":<C-u>lua VSetSearch()<CR>?<CR>=@/<CR><CR>",                           mode = mode_x },

}
for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode, mapping.from, mapping.to, { noremap = true })
end
-- open terminal in vim
vim.keymap.set("n", "<leader>:", "sl<leader>l:terminal<CR>i", { remap = true })

local function VSetSearch()
    local temp = vim.fn.getreg('s')
    vim.cmd('norm! gv"sy')
    local search_pattern = '\\V' .. vim.fn.escape(vim.fn.getreg('s'), '/\\'):gsub('\n', '\\n')
    vim.fn.setreg('/', search_pattern)
    vim.fn.setreg('s', temp)
end
