local wk = require("which-key")
wk.register({
    q = {":q<cr>", "Quit"},
    w = {":w<cr>", "Save"},
    x = {":bdelete<cr>", "Close"},
    e = {
        c = {
            "<cmd>Telescope file_browser path=~/.config/nvim<cr>",
            "Edit Neovim config"
        },
        s = {
            "<cmd>Telescope file_browser path=~/.config/nvim/snippets<cr>",
            "Edit snippets"
        },
        l = {
            "<cmd>Telescope file_browser path=~/.config/library/<cr>",
            "Edit pres1dentlibcpp"
        },
        z = {":tabnew ~/.zshrc<cr>", "Edit .zshrc"},
        e = {":e .<cr>", "Edit Neovim config"}
    },
    t = {":CompetiTestRun<cr>", "Competitest Run"},
    h = {":HopChar2<cr>", "HopChar2"},
    -- s = {":SidebarNvimToggle<cr>", "HopChar2"},
    p = {":MarkdownPreview<CR>", "Markdown Preview"},
    f = {
        name = "Telescope",
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        -- n = {"<cmd>enew<cr>", "New File"},
        p = {"<cmd>Telescope yank_history<cr>", "Yank History"},
        t = {"<cmd>Telescope file_browser<cr>", "File Brouswer(Tree)"}
    },
    l = {
        name = "LSP",
        h = {"<cmd>Lspsaga hover_doc<CR>", "Lspsaga hover_doc"},
        f = {"<cmd>Lspsaga lsp_finder<CR>", "Lspsaga lsp_finder"},
        p = {"<cmd>Lspsaga peek_definition<CR>", "Lspsaga peek_definition"},
        -- g = {"<cmd>Lspsaga code_action<CR>", "Lspsaga code_action"},
        r = {"<cmd>Lspsaga rename<CR>", "Lspsaga rename"},
        s = {
            "<cmd>Lspsaga show_line_diagnostics<CR>",
            "Lspsaga show_line_diagnostics"
        },
        n = {
            "<cmd>Lspsaga diagnostic_jump_next<CR>",
            "Lspsaga diagnostic_jump_next"
        },
        p = {
            "<cmd>Lspsaga diagnostic_jump_prev<CR>",
            "Lspsaga diagnostic_jump_prev"
        }
    },
    s = {":2TermExec cmd=\"sss\" dir=\"%:p:h\"<CR>", "Submit Program"}
}, {prefix = "<leader>"})
