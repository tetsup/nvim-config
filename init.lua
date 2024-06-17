-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'single'
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.list = true
vim.opt.listchars = {
  tab = '»-',
  trail = '-',
  extends = '»',
  precedes = '«',
  nbsp = '%',
  eol = '↲',
}

vim.o.visualbell = true
vim.o.number = true
vim.o.cursorline = true
vim.o.wrapscan = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none guibg=none'

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true })

-- manipulation
vim.g.shellslash = true
vim.g.mapleader = ' '
vim.opt.clipboard:append { 'unnamedplus' }
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.api.nvim_set_keymap('n', 'j', '5gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', '5gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>W', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-W>', { noremap = true })

require('terminal')
require('lazy_nvim')
