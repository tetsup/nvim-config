vim.fn['ddu#custom#patch_global']{
  ui = "ff",
  uiParams = {
    ff = {
      split = 'floating',
      floatingBorder = 'rounded',
      filterSplitDirection = 'floating',
      filterFloatingPosition = 'bottom',
      prompt = '> ',
    },
  },
  sourceOptions = {
    _ = {
      matchers = {'matcher_substring'},
      converters = {'converter_devicon'},
      ignoreCase = true,
    },
  },
  filterParams = {
    matcher_substring = {
      highlightMatched = 'Search',
    },
  },
}

vim.fn['ddu#custom#patch_local']('node-files', {
  sources = {'file_rec'},
  kindOptions = {
    file = {
      defaultAction = 'open',
    },
  },
  sourceParams = {
    file_rec = {
      ignoredDirectories = {'.xine', '.espressif', '.git', 'node_modules'},
    },
  },
  sourceOptions = {
    file_rec = {
      maxItems = 50,
    },
  },
})
vim.api.nvim_create_user_command('DduNodeFiles',
  function()
    vim.fn['ddu#start']({
      name = "node-files",
      sourceOptions = {
        file_rec = {
          path = vim.fn.getcwd()
        },
      },
    })
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>dt', ':DduNodeFiles<CR>', {})

vim.fn['ddu#custom#patch_local']('whole-files', {
  sources = {'file_rec'},
  kindOptions = {
    file = {
      defaultAction = 'open',
    },
  },
  sourceParams = {
    file_rec = {
      ignoredDirectories = {},
    },
  },
  sourceOptions = {
    file_rec = {
      maxItems = 50,
    },
  },
})

vim.api.nvim_create_user_command('DduWholeFiles',
  function()
    vim.fn['ddu#start']({
      name = "whole-files",
      sourceOptions = {
        file_rec = {
          path = vim.fn.getcwd()
        },
      },
    })
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>dw', ':DduWholeFiles<CR>', {})

vim.api.nvim_create_user_command('DduItemAction',
  function()
    vim.fn['ddu#ui#do_action']('itemAction')
  end,
  {}
)

vim.api.nvim_create_user_command('DduItemNew',
  function()
    vim.fn['ddu#ui#do_action']('itemAction', {name = 'newFile'})
  end,
  {}
)

vim.api.nvim_create_user_command('DduItemDelete',
  function()
    vim.fn['ddu#ui#do_action']('itemAction', {name = 'delete'})
  end,
  {}
)

vim.api.nvim_create_user_command('DduItemRename',
  function()
    vim.fn['ddu#ui#do_action']('itemAction', {name = 'rename'})
  end,
  {}
)

vim.api.nvim_create_user_command('DduQuit',
  function()
    vim.fn['ddu#ui#do_action']('quit')
  end,
  {}
)

vim.api.nvim_create_user_command('DduOpenFilter',
  function()
    vim.fn['ddu#ui#do_action']('openFilterWindow')
  end,
  {}
)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ddu-ff',
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set({'n'}, 'q', ':DduQuit<CR>', opts)
    vim.keymap.set({'n', 'i'}, '<CR>', ':DduItemAction<CR>', opts)
    vim.keymap.set({'n'}, 'i', ':DduOpenFilter<CR>', opts)
    vim.keymap.set({'n'}, 'n', ':DduItemNew<CR>', opts)
    vim.keymap.set({'n'}, 'd', ':DduItemDelete<CR>', opts)
    vim.keymap.set({'n'}, 'r', ':DduItemRename<CR>', opts)
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ddu-ff-filter',
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set({'i'}, '<CR>', '<ESC>:close<CR>', opts)
    vim.keymap.set({'n'}, '<CR>', ':close<CR>', opts)
    vim.keymap.set({'n'}, 'q', ':close<CR>', opts)
    vim.keymap.set({'n'}, '<ESC>', ':close<CR>', opts)
  end
})
