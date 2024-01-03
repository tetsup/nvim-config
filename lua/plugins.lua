return {
  'editorconfig/editorconfig-vim',
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

