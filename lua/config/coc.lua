vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-css',
  'coc-yaml',
  'coc-sh',
  'coc-prettier',
  'coc-clangd',
  'coc-jedi',
  'coc-pyright',
  'coc-diagnostic',
  'coc-explorer',
  'coc-lists',
  'coc-rust-analyzer',
  'coc-lua',
  'coc-testing-ls',
}

vim.api.nvim_create_user_command('OpenFloatingExplorer',
  function()
    vim.cmd(
      'CocCommand explorer --no-toggle --quit-on-open --position=floating --floating-width=70 --floating-height=-6 --sources=file+'
    )
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>e', '<Cmd>OpenFloatingExplorer<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>cd', '<Cmd>CocList diagnostics<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>h', '<Cmd>CocCommand document.toggleInlayHint<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-defenition)', { noremap = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-defenition)', { noremap = true })
