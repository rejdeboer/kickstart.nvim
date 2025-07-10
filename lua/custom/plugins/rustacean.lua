return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          print 'Rustacean LSP attached!'
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
        end,
      },
    }
  end,
}
