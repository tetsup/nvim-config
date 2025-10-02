local status, buffer_manager = pcall(require, 'buffer_manager.ui')

vim.keymap.set('n', '<Leader>b', buffer_manager.toggle_quick_menu)
