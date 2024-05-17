-- RUST LSP KEYMAPS
local bufnr = vim.api.nvim_get_current_buf()

-- default props for mappings we define the activation buffer on the one
-- currently open, this way, those action are only defined for rust files.
local props = { silent = true, buffer = bufnr }

-- Show the documentation of the hovered element.
vim.keymap.set('n', 'K', vim.lsp.buf.hover, props)
-- Go to the definition of the hovered element.
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, props)
-- Go to the declaration of the hovered element.
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, props)
-- Go to the implementation of the hovered element.
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, props)
-- Check the available code actions.
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, props)
-- Rename the hovered element.
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, props)
-- Explain the hovered diagnostic
vim.keymap.set('n', '<leader>ed', function()
  vim.cmd.RustLsp 'explainError'
end, props)
-- Render the hovered diagnostic
vim.keymap.set('n', '<leader>d', function()
  vim.cmd.RustLsp 'renderDiagnostic'
end, props)
-- List the runnables of the current buffer.
vim.keymap.set('n', '<leader>Cr', function()
  vim.cmd.RustLsp 'runnables'
end, props)
-- List all the tests of the buffer
vim.keymap.set('n', '<leader>Ct', function()
  vim.cmd.RustLsp 'testables'
end, props)

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = 'clippy',
        },
      },
    },
  },
}

-- Might be better placed elsewhere, but the autoformat file doesn't format
-- rust files with rustfmt, so we set the auto format here.
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  callback = function()
    vim.lsp.buf.format {
      async = false,
    }
  end,
})

-- enable inlay hints by default in rust files.
if vim.lsp.inlay_hint then
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
      -- Wait for LSP server to start (just to be sure)
      vim.defer_fn(function()
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end, 1000)
    end,
  })
end
