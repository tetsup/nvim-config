return {
  'editorconfig/editorconfig-vim',
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('config/coc')
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('config/nvim-dap')
    end
  },
  'simeji/winresizer',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config/treesitter')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end
  },
  {
    'vim-denops/denops.vim',
    config = function()
      require('config/denops')
    end
  },
  {
    'Shougo/ddu.vim',
    dependencies = {
      'vim-denops/denops.vim',
      'Shougo/ddu-ui-ff',
      'Shougo/ddu-source-file_rec',
      'Shougo/ddu-kind-file',
      'Shougo/ddu-filter-matcher_substring',
      'uga-rosa/ddu-filter-converter_devicon',
    },
    config = function()
      require('config/ddu')
    end
  },
  {
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config/buffer_manager')
    end
  },
  {
    'mhinz/vim-startify',
    config = function()
      require('config/startify')
    end
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('config/auto-session')
    end
  },
  'tpope/vim-fugitive',
  {
    'dracula/vim',
    config = function()
      vim.cmd [[colorscheme dracula]]
    end
  },
  'h-hg/fcitx.nvim',
}
