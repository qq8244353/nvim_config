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
            end, function()
                return {
                    exe = "gsed",
                    args = {
                        "-z", "-e",
                        -- "'s/\\([^\\n]*\\)\\n\\(\\s*\\)\\([^\\n]*\\)cin \\([^\\n]*\\);/\\1 \\3cin \\4;/g'"
                        -- "'s/\\n\\([a-zA-z0-9<>(), ]*\\);\\n\\([a-zA-z0-9,() ]*\\) cin \\([^\\n]*\\);/\\n\\1; \\2cin \\3;/g'"
                        "'s/\\n\\([a-zA-z0-9<>(), ]*\\);\\n[ ]*\\(\\( [a-zA-Z]\\)\\?[a-zA-Z0-9,() ]*\\)cin \\([^\\n]*\\);/\\n\\1; \\2\\3cin \\4;/g'",
                        "-e",
                        "'s/\\([^\\n]*--;\\)\\(\\n[ ]*\\([^\\n]*--;\\)\\)\\?\\(\\n[ ]*\\([^\\n]*--;\\)\\)\\?\\(\\n[ ]*\\([^\\n]*--;\\)\\)\\?\\(\\n[ ]*\\([^\\n]*--;\\)\\)\\?/\\1 \\3 \\5 \\7 \\9/g'"
                    },
                    stdin = true
                }
            end
        },
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {"--indent-width=4"},
                    stdin = true
                }
            end
        }
    }
}

vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
