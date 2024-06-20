require('toggleterm').setup()

local Terminal = require('toggleterm.terminal').Terminal
local bottom_terminal1 = Terminal:new({ hidden = true, direction = 'horizontal' })
local bottom_terminal2 = Terminal:new({ hidden = true, direction = 'horizontal' })
local bottom_terminal3 = Terminal:new({ hidden = true, direction = 'horizontal' })

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

vim.api.nvim_create_user_command('CloseBottomTerminals',
  function()
    bottom_terminal1:close()
    bottom_terminal2:close()
    bottom_terminal3:close()
  end,
  {}
)
