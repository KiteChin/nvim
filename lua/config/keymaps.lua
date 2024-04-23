vscode =not vim.g.vscode and "" or require('vscode-neovim')

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
	{ from = "<LEADER>w",         to = not vim.g.vscode and "<C-w>w" or "<Cmd>lua vscode.call('workbench.action.focusNextGroup')<CR>", mode = mode_n },
	{ from = "<LEADER>j",         to = not vim.g.vscode and "<C-w>j" or "<Cmd>lua vscode.call('workbench.action.navigateDown')<CR>", mode = mode_n },
	{ from = "<LEADER>k",         to = not vim.g.vscode and "<C-w>k" or "<Cmd>lua vscode.call('workbench.action.navigateUp')<CR>", mode = mode_n },
	{ from = "<LEADER>h",         to = not vim.g.vscode and "<C-w>h" or "<Cmd>lua vscode.call('workbench.action.navigateLeft')<CR>", mode = mode_n },
	{ from = "<LEADER>l",         to = not vim.g.vscode and "<C-w>l" or "<Cmd>lua vscode.call('workbench.action.navigateRight')<CR>", mode = mode_n },
	{ from = "<LEADER>o",         to = not vim.g.vscode and "<C-w>o" or "", mode = mode_n },
	{ from = "<LEADER>q",         to = not vim.g.vscode and "<C-w>q" or "<Cmd>lua vscode.call('workbench.action.closeEditorsAndGroup')<CR>", mode = mode_n },
	{ from = "<LEADER><S-j>",     to = not vim.g.vscode and "<C-w>J" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupDown')<CR>", mode = mode_n },
	{ from = "<LEADER><S-k>",     to = not vim.g.vscode and "<C-w>K" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupUp')<CR>", mode = mode_n },  
	{ from = "<LEADER><S-h>",     to = not vim.g.vscode and "<C-w>H" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupLeft')<CR>", mode = mode_n },
	{ from = "<LEADER><S-l>",     to = not vim.g.vscode and "<C-w>L" or "<Cmd>lua vscode.call('workbench.action.moveActiveEditorGroupRight')<CR>", mode = mode_n },
	{ from = "sj",                to = not vim.g.vscode and "<C-w>s" or "<Cmd>lua vscode.call('workbench.action.splitEditorDown')<CR>", mode = mode_n },
	{ from = "sl",                to = not vim.g.vscode and "<C-w>v" or "<Cmd>lua vscode.call('workbench.action.splitEditor')<CR>", mode = mode_n },
	{ from = "<up>",              to = not vim.g.vscode and ":res +5<CR>" or "<Cmd>lua vscode.call('workbench.action.increaseViewHeight')<CR>", mode = mode_n },
	{ from = "<down>",            to = not vim.g.vscode and ":res -5<CR>" or "<Cmd>lua vscode.call('workbench.action.decreaseViewHeight')<CR>", mode = mode_n },  
	{ from = "<left>",            to = not vim.g.vscode and ":vertical resize-5<CR>" or "<Cmd>lua vscode.call('workbench.action.decreaseViewWidth')<CR>", mode = mode_n },
	{ from = "<right>",           to = not vim.g.vscode and ":vertical resize+5<CR>" or "<Cmd>lua vscode.call('workbench.action.increaseViewWidth')<CR>", mode = mode_n },

	-- fold/unfold code 
	{ from = "za",                to = not vim.g.vscode and "za" or "<Cmd>lua vscode.call('editor.toggleFold')<CR>", mode = mode_n },
	{ from = "zR",                to = not vim.g.vscode and "zR" or "<Cmd>lua vscode.call('editor.unfoldAll')<CR>", mode = mode_n },
	{ from = "zM",                to = not vim.g.vscode and "zM" or "<Cmd>lua vscode.call('editor.foldAll')<CR>", mode = mode_n },
	{ from = "zo",                to = not vim.g.vscode and "zo" or "<Cmd>lua vscode.call('editor.unfold')<CR>", mode = mode_n },
	{ from = "zO",                to = not vim.g.vscode and "zO" or "<Cmd>lua vscode.call('editor.unfoldRecursively')<CR>", mode = mode_n },
	{ from = "zc",                to = not vim.g.vscode and "zc" or "<Cmd>lua vscode.call('editor.fold')<CR>", mode = mode_n },
	{ from = "zC",                to = not vim.g.vscode and "zC" or "<Cmd>lua vscode.call('editor.foldRecursively')<CR>", mode = mode_n },
	{ from = "z1",                to = not vim.g.vscode and "z1" or "<Cmd>lua vscode.call('editor.foldLevel1')<CR>", mode = mode_n },
    { from = "z2",                to = not vim.g.vscode and "z2" or "<Cmd>lua vscode.call('editor.foldLevel2')<CR>", mode = mode_n },
    { from = "z3",                to = not vim.g.vscode and "z3" or "<Cmd>lua vscode.call('editor.foldLevel3')<CR>", mode = mode_n },
    { from = "z4",                to = not vim.g.vscode and "z4" or "<Cmd>lua vscode.call('editor.foldLevel4')<CR>", mode = mode_n },
    { from = "z5",                to = not vim.g.vscode and "z5" or "<Cmd>lua vscode.call('editor.foldLevel5')<CR>", mode = mode_n },
    { from = "z6",                to = not vim.g.vscode and "z6" or "<Cmd>lua vscode.call('editor.foldLevel6')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },

    -- buffer hotkey          
	{ from = "<silent> [b",       to = ":bprevious<CR>",                                                       mode = mode_n },
	{ from = "<silent> ]b",       to = ":bnext<CR>",                                                           mode = mode_n },
	{ from = "<silent> [B",       to = ":bfirst<CR>",                                                          mode = mode_n },
	{ from = "<silent> ]B",       to = ":blast<CR>",                                                           mode = mode_n },

	-- for window operation
    { from = "<C-w>q",                to = not vim.g.vscode and "<C-w>q" or "<Cmd>lua vscode.call('workbench.action.closeEditorsInGroup')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },
    { from = "z7",                to = not vim.g.vscode and "z7" or "<Cmd>lua vscode.call('editor.foldLevel7')<CR>", mode = mode_n },
	
    -- for file operation          
	{ from = "<LEADER>s",         to = not vim.g.vscode and ":w<CR>" or "<Cmd>lua vscode.call('workbench.action.files.save')<CR>", mode = mode_n },
	{ from = "<LEADER>q",         to = not vim.g.vscode and ":q<CR>" or "<Cmd>lua vscode.call('workbench.action.closeActiveEditor')<CR>", mode = mode_n },
	{ from = "<leader>R",         to = ":source $MYVIMRC<CR>",                                                 mode = mode_n },
	{ from = "<LEADER>rc",        to = ":e ~/.config/nvim/init.vim<CR>",                                       mode = mode_n },
	{ from = "<LEADER>ri",        to = not vim.g.vscode and ":e ~/.config/i3/config<CR>" or "",                         mode = mode_n },
	{ from = "<LEADER>rr",        to = not vim.g.vscode and ":e ~/.config/ranger/rc.conf<CR>" or "",                    mode = mode_n },
	{ from = "<LEADER>ra",        to = not vim.g.vscode and ":e ~/.config/alacritty/alacritty.yml<CR>" or "",           mode = mode_n },
	{ from = "<LEADER>rz",        to = not vim.g.vscode and ":e $HOME/.zshrc<CR>" or "",                                mode = mode_n },
    -- tag hotkey          
	{ from = "tt",                to = ":tabe<CR>",                                                            mode = mode_n },
	{ from = "tT",                to = ":tab split<CR>",                                                       mode = mode_n },
	{ from = "th",                to = not vim.g.vscode and ":-tabnext<CR>" or "<Cmd>lua vscode.call('workbench.action.nextEditor')<CR>", mode = mode_n },
	{ from = "tl",                to = not vim.g.vscode and ":+tabnext<CR>" or "<Cmd>lua vscode.call('workbench.action.previousEditor')<CR>", mode = mode_n },   
	{ from = "tmh",               to = not vim.g.vscode and ":-tabmove<CR>" or "<Cmd>lua vscode.call('workbench.action.moveEditorLeftInGroup')<CR>", mode = mode_n },
	{ from = "tml",               to = not vim.g.vscode and ":+tabmove<CR>" or "<Cmd>lua vscode.call('workbench.action.moveEditorRightInGroup')<CR>", mode = mode_n },
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

if vim.g.vscode then
	vim.keymap.set(mode_nv, "j", 'gj', {remap = true})
	vim.keymap.set(mode_nv, "k", 'gk', {remap = true})
	vim.keymap.set(mode_nv, "J", '5j', {remap = true})
	vim.keymap.set(mode_nv, "K", '5k', {remap = true})
	
	-- Split function
	local function split(direction, file)
		local vscode_action = direction == 'h' and 'workbench.action.splitEditorDown' or 'workbench.action.splitEditorRight'
		vscodeCall(vscode_action)
		if file ~= '' then
			vscodeExtensionNotify('open-file', vim.fn.expand(file), 'all')
		end
	end

	-- SplitNew function
	local function splitNew(direction, file)
		local file_to_open = file ~= '' and file or '__vscode_new__'
		split(direction, file_to_open)
	end

	-- CloseOtherEditors function
	local function closeOtherEditors()
		vscodeNotify('workbench.action.closeEditorsInOtherGroups')
		vscodeNotify('workbench.action.closeOtherEditors')
	end

	-- ManageEditorHeight function
	local function manageEditorHeight(count, to)
		count = count or 1
		for i = 1, count do
			vscodeNotify(to == 'increase' and 'workbench.action.increaseViewHeight' or 'workbench.action.decreaseViewHeight')
		end
	end

	-- ManageEditorWidth function
	local function manageEditorWidth(count, to)
		count = count or 1
		for i = 1, count do
			vscodeNotify(to == 'increase' and 'workbench.action.increaseViewWidth' or 'workbench.action.decreaseViewWidth')
		end
	end
end

local function VSetSearch()
    local temp = vim.fn.getreg('s')
    vim.cmd('norm! gv"sy')
    local search_pattern = '\\V' .. vim.fn.escape(vim.fn.getreg('s'), '/\\'):gsub('\n', '\\n')
    vim.fn.setreg('/', search_pattern)
    vim.fn.setreg('s', temp)
end
