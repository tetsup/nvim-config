vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-css',
  'coc-yaml',
  'coc-sh',
  'coc-prettier',
  'coc-clangd',
  'coc-jedi',
  'coc-diagnostic',
  'coc-explorer',
  'coc-rust-analyzer',
}
vim.api.nvim_set_keymap('n', '<Leader>e', '<Cmd>CocCommand explorer<CR>', {})
