vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

require('nvim-tree').setup({
  sort_by = 'name',
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = { quit_on_open = true },
  },
  view = {
    signcolumn = 'auto',
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = 'signcolumn',
      glyphs = {
        git = {
          unstaged = 'C',
          staged = '✓',
          unmerged = 'U',
          renamed = 'R',
          untracked = '?',
          deleted = 'D',
          ignored = '!',
        },
      },
    },
  },
  filters = { dotfiles = false },
})
vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeOpen<CR>', { noremap = true })
require('nvim-tree.api').tree.toggle(false, true)

