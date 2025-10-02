local M = {}

function M.run_jest_make()
  local output = {}

  vim.fn.jobstart({ "npx", "jest", "--json", "--testLocationInResults" }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          table.insert(output, line)
        end
      end
    end,
    on_exit = function(_, _)
      local result = table.concat(output, "\n")
      local ok, parsed = pcall(vim.fn.json_decode, result)
      if not ok or not parsed.testResults then
        print("❌ JSON parse failed")
        return
      end

      for _, file_result in ipairs(parsed.testResults) do
        local file = file_result.name
        for _, assertion in ipairs(file_result.assertionResults or {}) do
          if assertion.status == "failed" then
            for _, msg in ipairs(assertion.failureMessages or {}) do
              local m = msg:match("(%S+%.%a+):(%d+):(%d+)")
              if m then
                local filename, lnum, col = msg:match("([^:]+):(%d+):(%d+)")
                local text = assertion.fullName or msg:match("^(.-)\n") or "Error"
                print(string.format("%s:%s:%s: %s", filename, lnum, col, text))
              else
                print(string.format("%s:1:1: %s", file, assertion.fullName or "Test failed"))
              end
            end
          end
        end
      end
    end,
  })
end

return M
