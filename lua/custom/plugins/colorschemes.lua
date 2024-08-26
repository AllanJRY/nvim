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
      vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = '#282828' })
      vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = '#282828' })
      vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = '#282828' })
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
