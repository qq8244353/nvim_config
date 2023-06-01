require'toggleterm'.setup {
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
    direction = 'float',
    -- size = function(term)
    --     if term.direction == "horizontal" then
    --         return 15
    --     elseif term.direction == "vertical" then
    --         return vim.o.columns * 0.4
    --     end
    -- end
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Up>", "<PageUp>",
                                    {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Down>", "<PageDown>",
                                    {noremap = true, silent = true})
    end
})
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>",
                        {noremap = true, silent = true})

function _lazygit_toggle() lazygit:toggle() end

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
