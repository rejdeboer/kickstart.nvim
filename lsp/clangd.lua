return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    -- clangd keeps importing headers that have already been imported
    '--header-insertion=never',
    --'--log=verbose',
  },
}
