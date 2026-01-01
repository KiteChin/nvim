return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
    end,
    config = function()
    -- configuration
    require("nvim-treesitter-textobjects").setup {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@function.inner'] = 'V', -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = true,
      },
    }

    -- keymaps
    local ts_select = require("nvim-treesitter-textobjects.select")
    local ts_move = require("nvim-treesitter-textobjects.move")
    local ts_swap = require("nvim-treesitter-textobjects.swap")
    -- select
    vim.keymap.set({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ao", function() ts_select.select_textobject("@conditional.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "io", function() ts_select.select_textobject("@conditional.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "al", function() ts_select.select_textobject("@loop.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "il", function() ts_select.select_textobject("@loop.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ap", function() ts_select.select_textobject("@parameter.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ip", function() ts_select.select_textobject("@parameter.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "aa", function() ts_select.select_textobject("@assignment.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ia", function() ts_select.select_textobject("@assignment.inner", "textobjects") end)
    -- 下一个开始 (Next Start)
    vim.keymap.set({ "n", "x", "o" }, "]f", function() ts_move.goto_next_start("@function.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]c", function() ts_move.goto_next_start("@class.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]o", function() ts_move.goto_next_start("@conditional.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]p", function() ts_move.goto_next_start("@parameter.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]l", function() ts_move.goto_next_start("@loop.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]i", function() ts_move.goto_next_start("@call.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]b", function() ts_move.goto_next_start("@block.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]a", function() ts_move.goto_next_start("@assignment.outer") end)
    -- 下一个结束 (Next End)
    vim.keymap.set({ "n", "x", "o" }, "]F", function() ts_move.goto_next_end("@function.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]C", function() ts_move.goto_next_end("@class.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]O", function() ts_move.goto_next_end("@conditional.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]P", function() ts_move.goto_next_end("@parameter.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]L", function() ts_move.goto_next_end("@loop.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]I", function() ts_move.goto_next_end("@call.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]B", function() ts_move.goto_next_end("@block.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "]A", function() ts_move.goto_next_end("@assignment.outer") end)
    -- 上一个开始 (Previous Start)
    vim.keymap.set({ "n", "x", "o" }, "[f", function() ts_move.goto_previous_start("@function.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[c", function() ts_move.goto_previous_start("@class.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[p", function() ts_move.goto_previous_start("@parameter.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[o", function() ts_move.goto_previous_start("@conditional.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[l", function() ts_move.goto_previous_start("@loop.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[i", function() ts_move.goto_previous_start("@call.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[b", function() ts_move.goto_previous_start("@block.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[a", function() ts_move.goto_previous_start("@assignment.outer") end)
    -- 上一个结束 (Previous End)
    vim.keymap.set({ "n", "x", "o" }, "[F", function() ts_move.goto_previous_end("@function.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[C", function() ts_move.goto_previous_end("@class.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[P", function() ts_move.goto_previous_end("@parameter.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[O", function() ts_move.goto_previous_end("@conditional.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[l", function() ts_move.goto_previous_end("@loop.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[I", function() ts_move.goto_previous_end("@call.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[B", function() ts_move.goto_previous_end("@block.outer") end)
    vim.keymap.set({ "n", "x", "o" }, "[A", function() ts_move.goto_previous_end("@assignment.outer") end)
    -- 交换下一个 (Swap Next)
    vim.keymap.set("n", "<leader>na", function() ts_swap.swap_next("@parameter.inner") end)
    vim.keymap.set("n", "<leader>nf", function() ts_swap.swap_next("@function.outer") end)
    -- 交换上一个 (Swap Previous)
    vim.keymap.set("n", "<leader>pa", function() ts_swap.swap_previous("@parameter.inner") end)
    vim.keymap.set("n", "<leader>pf", function() ts_swap.swap_previous("@function.outer") end)

    -- 3. 【核心增强】可重复的移动 (Repeatable Moves)
    -- 这允许你使用 ; 和 , 重复上一次的 ]f 或 [p 等移动操作
    local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
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
    end,
  }
}