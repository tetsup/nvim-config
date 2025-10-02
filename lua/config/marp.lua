require('marp').setup({
  port = 8003,
  wait_for_response_timeout = 30,
  wait_for_response_delay = 1
})
vim.keymap.set('n', '<Leader>mt', '<Cmd>MarpToggle<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>ms', '<Cmd>MarpStatus<CR>', { noremap = true })
