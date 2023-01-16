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
                return {
                    exe = "astyle",
                    args = {
                        "--style=google", "--pad-oper", "--add-one-line-braces",
                        "--pad-header", "--pad-comma"
                    },
                    stdin = true
                }
            end
            -- , function()
            --     return {exe = "setopt", args = {"nonomatch"}, stdin = true}
            -- end, function()
            --     return {
            --         exe = "bash gsed",
            --         args = {
            --             "-z",
            --             "\\'s/\\([^\n]*\\)\n\\([^\n]*\\)cin \\([^\n]*\\);/\1 cin \3/g\\'"
            --         },
            --         stdin = true
            --     }
            -- end
        }
    }
}

vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.cpp FormatWrite
  augroup END
]]
