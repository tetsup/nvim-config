local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
  ensure_installed = {
    'vim',
		'dockerfile',
		'typescript',
    'tsx',
    'javascript',
    'json',
    'lua',
    'gitignore',
    'bash',
    'markdown',
    'css',
    'scss',
    'yaml',
    'toml',
    'vue',
    'php',
    'html',
    'python',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}

