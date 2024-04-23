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
