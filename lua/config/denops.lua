local execute_cmd = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end

vim.g.denops_deno = execute_cmd('which deno')

