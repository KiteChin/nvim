-- ~/.config/nvim/lua/plugins/quick-scope.lua
return {
    'unblevable/quick-scope',
    event = 'VeryLazy',        -- 等 Idle 再加载，启动速度最快
    init = function()
        vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
        vim.api.nvim_set_hl(0, 'QuickScopePrimary', { 
            fg = '#98C379', 
            underline = true, 
            ctermfg = 155
        })
        vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { 
            fg = '#61AFEF', 
            underline = true,
            ctermfg = 81,
        })
    end,
}
