return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  event = "VeryLazy",
  -- 简洁配置方式
  opts = {
    keymaps = {
      normal = "ys",
      visual = "S",
      delete = "ds",
      change = "cs",
    }
  },
}