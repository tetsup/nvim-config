return {
  'editorconfig/editorconfig-vim',
  {
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'InsertEnter',
    config = function()
      require('config/coc')
    end
  },
  'pepo-le/win-ime-con.nvim',
  'simeji/winresizer',
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
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config/barbar')
    end
  },
  'mhinz/vim-startify',
  {
    'rmagatti/auto-session',
    config = function()
      require('config/auto-session')
    end
  },
  'tpope/vim-fugitive',
}

