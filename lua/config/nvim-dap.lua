require('dapui').setup()
local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', { text = '', guifg = '#AA0000' })
vim.fn.sign_define('DapStopped', { text = '', guifg = '#00c853' })
dap.adapters = {
  codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
      args = { '--port', '${port}' }
    }
  }
}

dap.configurations = {
  cpp = {
    {
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to execute: ', vim.fn.getcwd() .. '/a.out', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  },
}

vim.api.nvim_set_keymap('n', '<Leader>d', ':lua require("dapui").toggle()<CR>', { noremap = true })
