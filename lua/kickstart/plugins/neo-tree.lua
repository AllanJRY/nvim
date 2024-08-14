-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      window = {
        position = 'left',
        -- position = 'float',
        popup_border_style = 'rounded',
        mappings = {
          ['\\'] = 'close_window',
          ['P'] = { 'toggle_preview', config = { use_float = false } },
        },
      },
      filtered_items = {
        always_show = { -- remains visible even if other settings would normally hide it
          'todos.md',
        },
        always_show_by_pattern = { -- uses glob style patterns
          '.env*',
        },
      },
    },
  },
}
