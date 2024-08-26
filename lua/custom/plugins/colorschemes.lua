return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.gruvbox_material_background = 'hard'
      -- vim.g.gruvbox_material_foreground = 'original'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  'sainnhe/everforest',
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require("nord").setup({})
      -- vim.cmd.colorscheme("nord")
    end,
  },
}
