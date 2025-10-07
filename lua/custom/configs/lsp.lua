local nvim_lsp = require 'lspconfig'

-- nvim_lsp.ts_ls.setup {
--   on_attach = on_attach,
--   filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
--   cmd = { 'typescript-language-server', '--stdio' },
-- }

local _border = 'single'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = _border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = _border,
})

vim.diagnostic.config {
  float = { border = _border },
}

-- vim.lsp.set_log_level 'trace'

-- local godot_port = os.getenv 'GDScript_Port' or 6005
-- local cmd = vim.lsp.rpc.connect('127.0.0.1', godot_port)
-- local pipe = '/tmp/godot.pipe'
--
-- vim.lsp.start {
--   name = 'Godot',
--   cmd = cmd,
--   root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
--   on_attach = function(client, bufnr)
--     vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
--   end,
-- }
