return {
  -- Navigate through undo tree
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      tab_char = '▎', -- This was the fix
    },
  },
}
