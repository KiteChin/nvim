-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',   -- 文本对象
    'nvim-treesitter/nvim-treesitter-refactor',      -- 智能重命名/导航
    'nvim-treesitter/nvim-treesitter-context',       -- 冻结上下文窗口
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'c', 'lua', 'vim', 'python', 'go', 'rust', 'javascript', 'typescript', 'json' },
      highlight = { enable = true },
      indent  = { enable = true },

      -- 文本对象：af / if / ac / ic / df / di …
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- 自动跳到下个匹配
          keymaps = {
            -- 函数
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            -- 类
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            -- 条件/循环
            ['aC'] = '@conditional.outer',
            ['iC'] = '@conditional.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            -- 参数
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            -- 语句
            ['as'] = '@statement.outer',
            ['is'] = '@statement.inner',
            -- 注释
            ['av'] = '@comment.outer',
            ['iv'] = '@comment.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- 计入 jumplist
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.outer',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.outer',
          },
        },
        swap = {            -- 交换参数/语句
          enable = true,
          swap_next = {
            ['<leader>sp'] = '@parameter.inner',
            ['<leader>sf'] = '@function.outer',
          },
          swap_previous = {
            ['<leader>sP'] = '@parameter.inner',
            ['<leader>sF'] = '@function.outer',
          },
        },
      },

      -- 重命名/定义引用导航
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = 'gnd',   -- go to node definition
            list_definitions = 'gnD',
            goto_next_usage  = '<a-*>',  -- Alt+*
            goto_previous_usage = '<a-#>',
          },
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = 'grn',      -- grn 开始交互重命名
          },
        },
      },

      -- 冻结上下文（小窗口）
      context = {
        enable = true,
        throttle = true,
        max_lines = 0, -- 0=不限制
        patterns = { default = { 'class', 'function', 'method' } },
      },

      -- AST 游乐场
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = true,
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups    = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language    = 'f',
          unfocus_language  = 'F',
          update            = 'R',
          goto_node         = '<cr>',
          show_help         = '?',
        },
      },
    }

    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    -- 手工命令快捷入口
    vim.keymap.set('n', '<leader>Ts', '<cmd>TSUpdate<cr>', { desc = 'Treesitter [S]ync' })
    vim.keymap.set('n', '<leader>Ti', '<cmd>TSInstallInfo<cr>', { desc = 'Treesitter [I]nfo' })
    vim.keymap.set('n', '<leader>Tp', '<cmd>TSPlayground<cr>', { desc = 'Treesitter [P]layground' })
    vim.keymap.set('n', '<leader>Tc', '<cmd>TSContext<cr>', { desc = 'Treesitter [C]ontext toggle' })
  end,
}
