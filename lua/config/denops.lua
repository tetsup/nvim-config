local execute_cmd = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end

if vim.fn['has("win32")'] then
  vim.g.denops_deno = execute_cmd('where deno')
  vim.g.python3_host_prog = execute_cmd('where python3')
else
  vim.g.denops_deno = execute_cmd('which deno')
  vim.g.python3_host_prog = execute_cmd('which python3')
end

