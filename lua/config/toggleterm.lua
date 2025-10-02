require('toggleterm').setup()

local Terminal = require('toggleterm.terminal').Terminal
local bottom_terminal1 = Terminal:new({ hidden = true, direction = 'horizontal' })
local bottom_terminal2 = Terminal:new({ hidden = true, direction = 'horizontal' })
local bottom_terminal3 = Terminal:new({ hidden = true, direction = 'horizontal' })
local float_terminal = Terminal:new({ hidden = true, direction = 'float' })

vim.api.nvim_create_user_command('OpenOneBottomTerminals',
  function()
    if not bottom_terminal1:is_open() then bottom_terminal1:open() end
    bottom_terminal2:close()
    bottom_terminal3:close()
  end,
  {}
)

vim.api.nvim_create_user_command('OpenTwoBottomTerminals',
  function()
    if not bottom_terminal1:is_open() then bottom_terminal1:open() end
    if not bottom_terminal2:is_open() then bottom_terminal2:open() end
    bottom_terminal3:close()
  end,
  {}
)

vim.api.nvim_create_user_command('OpenThreeBottomTerminals',
  function()
    if not bottom_terminal1:is_open() then bottom_terminal1:open() end
    if not bottom_terminal2:is_open() then bottom_terminal2:open() end
    if not bottom_terminal3:is_open() then bottom_terminal3:open() end
  end,
  {}
)

vim.api.nvim_create_user_command('OpenFloatTerminal',
  function()
    if not float_terminal:is_open() then
      float_terminal:open()
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<Cmd>CloseFloatTerminal<CR>', { noremap = true })
    end
  end,
  {}
)

vim.api.nvim_create_user_command('CloseBottomTerminals',
  function()
    bottom_terminal1:close()
    bottom_terminal2:close()
    bottom_terminal3:close()
  end,
  {}
)

vim.api.nvim_create_user_command('CloseFloatTerminal',
  function()
    float_terminal:close()
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>tf', '<Cmd>OpenFloatTerminal<CR>', { noremap = true })
