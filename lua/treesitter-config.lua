vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {spacing = 5, severity_limit = 'Warning'},
        update_in_insert = true
    })

require'nvim-treesitter.configs'.setup {
    indent = {
      enable = true
    },
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat,
                                    vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false
    },
    autotag = {enable = true},
    matchup = {enable = true}
}
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.matlab = {
    install_info = {
        url = "https://github.com/mstanciu552/tree-sitter-matlab.git",
        files = {"src/parser.c"},
        branch = 'main'
    },
    filetype = "matlab" -- if filetype does not agrees with parser name
}
