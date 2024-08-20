return {
  'junegunn/vim-easy-align',
  config = function()
    vim.keymap.set({ 'n', 'v' }, 'ga', '<Plug>(EasyAlign)')
  end,
}
