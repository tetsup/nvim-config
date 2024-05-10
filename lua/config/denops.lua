local execute_cmd = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end

if vim.fn['has("win32")'] then
  vim.g.denops_deno = execute_cmd('where deno')
else
  vim.g.denops_deno = execute_cmd('which deno')
end

