return {
  'editorconfig/editorconfig-vim',
  {
    'neoclide/coc.nvim',
    branch = "release",
    event = "InsertEnter",
    config = function()
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-tsserver',
        'coc-css',
        'coc-yaml',
        'coc-sh',
        'coc-prettier',
        'coc-clangd',
        'coc-jedi',
        'coc-diagnostic',
      }
    end
  },
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end
  },
  'preservim/nerdtree',
  {
    'romgrk/barbar.nvim',
    config = function()
      require('config/barbar')
    end
  },
  'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
}

