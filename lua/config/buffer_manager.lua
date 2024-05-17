local status, buffer_manager = pcall(require, 'buffer_manager.ui')

vim.keymap.set('n', '<c-h>', buffer_manager.nav_prev)
vim.keymap.set('n', '<c-l>', buffer_manager.nav_next)
vim.keymap.set('n', '<Leader>b', buffer_manager.toggle_quick_menu)
