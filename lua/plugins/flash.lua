return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      mode = "exact",
      multi_window = false,
    },
    jump = {
      autojump = true, -- 只有一个结果时直接跳，非常爽
    },
    modes = {
      -- 禁用原生搜索接管，除非你真的很喜欢它
      search = { enabled = false },
      -- 启用行内跳转增强
      char = {
        enabled = true,
        jump_labels = true, -- 按 f{char} 后可以直接按标签跳
      },
    },
    remote = {
      remote_op = { restore = true, motion = true },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}