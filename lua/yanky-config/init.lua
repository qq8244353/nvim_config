require('telescope').load_extension('yank_history')
local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")
require("yanky").setup({
    highlight = {on_put = false, on_yank = false, timer = 300},
    picker = {
        telescope = {
            mappings = {
                default = mapping.put("p"),
                i = {
                    ["<c-x>"] = mapping.delete(),
                    ["<c-r>"] = mapping.set_register(
                        utils.get_default_register())
                },
                n = {
                    p = mapping.put("p"),
                    P = mapping.put("P"),
                    d = mapping.delete(),
                    r = mapping.set_register(utils.get_default_register())
                }
            }
        }
    }
})

vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n", "x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n", "x"}, "gP", "<Plug>(YankyGPutBefore)")
