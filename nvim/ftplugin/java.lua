local lsp_attach = function(c, b)
  local opts = function(desc) return { buffer = b, remap = false, desc = desc } end

  vim.keymap.set('n', 'gd', function() require 'telescope.builtin'.lsp_definitions() end, opts('LSP Go to definition'))
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts('LSP Go to definition'))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts('LSP Hover'))
  vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, opts('Open float'))
  vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts('Next diagnostic'))
  vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts('Previous diagnostic'))
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts('LSP Code action'))
  vim.keymap.set('n', '<leader>sa', vim.lsp.buf.code_action, opts('LSP Code action'))
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts('LSP Goto references'))
  vim.keymap.set('n', 'gr', function() require 'telescope.builtin'.lsp_references() end, opts('LSP Goto references'))
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts('LSP Rename'))
  vim.keymap.set('n', '<leader>sr', vim.lsp.buf.rename, opts('LSP Rename'))
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts('LSP Signature help'))

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = b,
    callback = function()
      vim.lsp.buf.format {
        async = false,
        -- Format TS/JS with eslint
        filter = function(client) return client.name ~= "tsserver" end
      }
    end
  })

  require 'lsp-status'.on_attach(c)

  vim.api.nvim_create_autocmd('CursorHold', { buffer = b, callback = vim.lsp.buf.document_highlight })
  vim.api.nvim_create_autocmd('CursorMoved', { buffer = b, callback = vim.lsp.buf.clear_references })
end

local config = {
  cmd = { '/Users/kevin/.local/share/nvim/mason/packages/jdtls/bin/jdtls' },
  on_attach = lsp_attach,
}
require('jdtls').start_or_attach(config)
