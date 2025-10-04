LEMONADE_ADDR = ''

local set_lemonade_addr = function(opts)
  LEMONADE_ADDR = opts.args
end

local get_lemonade_addr = function()
  return LEMONADE_ADDR
end

local ssh_client = function()
  if vim.env.TMUX then
    return vim.system({ 'tmux', 'show-env', 'SSH_CONNECTION' }):wait().stdout:match('[0-9\\.]+') or 'localhost'
  elseif vim.env.SSH_CONNECTION then
    return vim.env.SSH_CONNECTION:match('[0-9\\.]+') or 'localhost'
  else
    return 'localhost'
  end
end

vim.api.nvim_create_user_command('LemonadeAddr', set_lemonade_addr, { nargs = '?' })
vim.api.nvim_create_user_command('LemonadeAddrPrint', function() print(get_lemonade_addr()) end, {})

vim.api.nvim_set_keymap('n', '<leader>lr', '<Cmd>LemonadeAddr<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ls', '<Cmd>LemonadeAddr ' .. ssh_client() .. '<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lp', '<Cmd>LemonadeAddrPrint<CR>', { noremap = true })

local lemonade_copy = function(lines)
  if LEMONADE_ADDR == nil or LEMONADE_ADDR == '' then return end
  local text = table.concat(lines, '\n')
  local stdin = vim.loop.new_pipe()
  local handle = vim.loop.spawn(
    'lemonade', {
      args = { 'copy', '--host=' .. LEMONADE_ADDR },
      stdio = { stdin, nil, nil }
    },
    function(code)
      if code == 0 then
        vim.notify('lemonade copy done', vim.log.levels.INFO)
      else
        vim.norify('lemonade copy failed: exit code ' .. code, vim.log.levels.WARN)
      end
    end
  )
  if handle then
    vim.loop.write(stdin, text)
    vim.loop.shutdown(stdin,
      function()
        vim.loop.close(handle, function() end)
      end
    )
  else
    vim.notify('failed to lemonade copy', vim.log.levels.WARN)
  end
end

local default_paste = function()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

local lemonade_paste = function()
  local handle = io.popen('lemonade paste --host=' .. LEMONADE_ADDR, 'r')
  if handle then
    local result = handle and handle:read('*a') or ''
    handle:close()
    local text = vim.split(result, '\r?\n')
    local regtype = result:match('\n') and 'V' or 'v'
    return { text, regtype }
  else
    return default_paste()
  end
end

vim.opt.clipboard:append({ 'unnamedplus' })
vim.opt.clipboard:append {
  name = "lemonade",
  copy = { ["+"] = lemonade_copy, ["*"] = lemonade_copy },
  paste = { ["+"] = default_paste, ["*"] = default_paste },
  cache_enabled = 1,
}
