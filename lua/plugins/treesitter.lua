return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup{
        ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "go", "rust", "javascript", "typescript", "json" },
        highlight = { enable = false },
        indent = { enable = false },
      }
    end,
  },
}