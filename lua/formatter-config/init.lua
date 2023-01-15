-- Utilities for creating configurations
local util = require "formatter.util"
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    -- logging = true,
    -- Set the log level
    -- log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        cpp = {
            -- You can also define your own configuration
            function()
                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "astyle",
                    args = {
                        "--style=google", "--pad-oper", "--add-one-line-braces",
                        "--pad-header", "--pad-comma"
                        -- util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true
                }
            end
        }
    }
}
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.cpp FormatWrite
  augroup END
]]
