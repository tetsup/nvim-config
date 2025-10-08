local extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-css',
  'coc-yaml',
  'coc-sh',
  'coc-prettier',
  'coc-clangd',
  'coc-jedi',
  'coc-pyright',
  'coc-diagnostic',
  'coc-explorer',
  'coc-lists',
  'coc-rust-analyzer',
  'coc-lua',
  'coc-testing-ls',
}

local function is_interactive()
  return vim.fn.has("nvim") == 1 and not vim.fn.has("gui_running") == 0 and vim.fn.has("ttyin") == 1
end

local function sync()
  if is_interactive() then
    return ''
  else
    return '-sync '
  end
end

local function ensure_extensions()
  vim.notify('start coc extension installation')
  local ok, stats = pcall(vim.fn.CocAction, "extensionStats")
  if not ok or type(stats) ~= "table" then
    vim.notify("Failed to get Coc extension stats; installing all.", vim.log.levels.WARN)
    stats = {}
  end

  local installed = {}
  for _, s in ipairs(stats) do
    installed[s.id] = s
  end

  local to_install = {}
  local to_update = {}

  for _, ext in ipairs(extensions) do
    local st = installed[ext]
    if not st then
      table.insert(to_install, ext)
    elseif st.state == "outdated" or st.version ~= st.latestVersion then
      table.insert(to_update, ext)
    end
  end
  if #to_install > 0 then
    vim.cmd("CocInstall " .. sync() .. table.concat(to_install, " "))
  end
  if #to_update > 0 then
    vim.cmd("CocUpdate " .. sync() .. table.concat(to_update, " "))
  end
  vim.notify(string.format(
    "Coc extensions: installed=%d, updated=%d",
    #to_install,
    #to_update
  ))
end


vim.api.nvim_create_autocmd("User", {
  pattern = "CocNvimInit",
  callback = function()
    ensure_extensions()
  end,
})
vim.api.nvim_create_user_command("AutoCocUpdate",
  function()
    ensure_extensions()
  end,
  {}
)
vim.api.nvim_create_user_command('OpenFloatingExplorer',
  function()
    vim.cmd(
      'CocCommand explorer --no-toggle --quit-on-open --position=floating --floating-width=70 --floating-height=-6 --sources=file+'
    )
  end,
  {}
)
vim.api.nvim_set_keymap('n', '<Leader>e', '<Cmd>OpenFloatingExplorer<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>cd', '<Cmd>CocList diagnostics<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>h', '<Cmd>CocCommand document.toggleInlayHint<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-defenition)', { noremap = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-defenition)', { noremap = true })
