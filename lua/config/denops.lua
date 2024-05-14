local execute_cmd = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end

if vim.fn['has("win32")'] then
  vim.g.denops_deno = execute_cmd(
    'for %%I in (deno.exe) do if exist %%~$path:I echo %%~$path:I'
  )
  vim.g.python3_host_prog = execute_cmd(
    'for %%I in (python3.exe) do if exist %%~$path:I echo %%~$path:I'
  )
else
  vim.g.denops_deno = execute_cmd('which deno')
  vim.g.python3_host_prog = execute_cmd('which python3')
end
