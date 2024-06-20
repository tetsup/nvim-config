local open_git = function()
  vim.cmd('Git')
end

local close_git = function()
  local winids = vim.api.nvim_list_wins()
  for _, id in pairs(winids) do
    local status = pcall(vim.api.nvim_win_get_var, id, 'fugitive_status')
    if status then
      vim.api.nvim_win_close(id, false)
      return
    end
  end
end

local open_explorer = function()
  vim.cmd('CocCommand explorer --no-toggle --sources=buffer+,file+')
end

local close_explorer = function()
  vim.cmd('CocCommand explorer --quit')
end

local open_dap = function()
  require('dapui').open({ reset = true })
end

local close_dap = function()
  require('dapui').close()
end

vim.api.nvim_create_user_command('ModeGit',
  function()
    close_explorer()
    close_dap()
    vim.cmd('CloseBottomTerminals')
    open_git()
  end,
  {}
)
vim.api.nvim_create_user_command('ModeExplorer',
  function()
    close_git()
    close_dap()
    vim.cmd('CloseBottomTerminals')
    open_explorer()
  end,
  {}
)
vim.api.nvim_create_user_command('ModeDap',
  function()
    close_git()
    close_explorer()
    vim.cmd('CloseBottomTerminals')
    open_dap()
  end,
  {}
)
vim.api.nvim_create_user_command('ModePlain',
  function()
    close_git()
    close_explorer()
    close_dap()
    vim.cmd('CloseBottomTerminals')
  end,
  {}
)
vim.api.nvim_create_user_command('ModeTwoBottomTerminals',
  function()
    close_git()
    close_explorer()
    close_dap()
    vim.cmd('OpenTwoBottomTerminals')
  end,
  {}
)
vim.api.nvim_create_user_command('ModeThreeBottomTerminals',
  function()
    close_git()
    close_explorer()
    close_dap()
    vim.cmd('OpenThreeBottomTerminals')
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>g', '<Cmd>ModeGit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>e', '<Cmd>ModeExplorer<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>d', '<Cmd>ModeDap<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tt', '<Cmd>ModeTwoBottomTerminals<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tr', '<Cmd>ModeThreeBottomTerminals<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>', '<Cmd>ModePlain<CR>', { noremap = true })
vim.api.nvim_create_autocmd('VimEnter', { callback = function() vim.cmd('ModeExplorer') end })
