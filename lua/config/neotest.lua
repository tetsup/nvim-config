require('neotest').setup({
  adapters = {
    require('neotest-plenary'),
    --[[
    require('neotest-jest')({
      jest_test_discovery = false,
      jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h') .. ' --watch',
      jestConfigFile = 'jest.config.js',
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
      --]]
    discovery = {
      enabled = false,
    }
  },
})
