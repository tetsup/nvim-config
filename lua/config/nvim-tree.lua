require('nvim-tree').setup(
)
vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})

