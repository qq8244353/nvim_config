local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")
local home = os.getenv('HOME')

-- dashboard.preview_file_path = home .. '/.config/nvim/static/neovim.txt'
-- dashboard.preview_file_width = 54
-- dashboard.preview_file_height = 9
-- dashboard.preview_command = 'cat | lolcat -F 0.3'

dashboard.custom_header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
}
dashboard.header_pad = 3
dashboard.center_pad = 3

dashboard.custom_center = {
    {
        icon = "  ",
        desc = "Recently opened files                   ",
        r = {"<cmd>", "Open Recent File"},
        action = "Telescope oldfiles",
        shortcut = "<Leader> f r"
    }, {
        icon = "  ",
        desc = "Open Nvim config                        ",
        action = "e ~/.config/nvim",
        shortcut = "<Leader> e v"
    }, {
        icon = "  ",
        desc = "Competitive                             ",
        action = "e ~/projects/competitive",
        shortcut = "            "
    }, {
        icon = "  ",
        desc = "LaTeX                                   ",
        action = "e ~/projects/latex",
        shortcut = "            "
    }, {
        icon = "  ",
        desc = "Jupyter Notebook                        ",
        action = "e ~/projects/notebook",
        shortcut = "            "
    }, {
        icon = "  ",
        desc = "Matlab                                  ",
        action = "e ~/projects/matlab",
        shortcut = "            "
    }
}

api.nvim_create_autocmd("FileType", {
    pattern = "dashboard",
    group = api.nvim_create_augroup("dashboard_enter", {clear = true}),
    callback = function()
        keymap.set("n", "q", ":qa<CR>", {buffer = true, silent = true})
        keymap.set("n", "e", ":enew<CR>", {buffer = true, silent = true})
    end
})
