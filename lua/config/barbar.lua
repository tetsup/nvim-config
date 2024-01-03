require('bufferline')

vim.api.nvim_set_keymap('n', '<C-h>', ':BufferPrevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':BufferClose<CR>', { noremap = true })

