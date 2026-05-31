return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.adwaita_transparent = true
      vim.cmd("colorscheme adwaita")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "adwaita",
    },
  },
}
