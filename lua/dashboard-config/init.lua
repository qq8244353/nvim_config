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
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files",
        shortcut = "<Leader> f f"
    }, {
        icon = "  ",
        desc = "Recently opened files                   ",
        action = "Telescope my_mru",
        shortcut = "<Leader> f r"
    }, {
        icon = "  ",
        desc = "Project grep                            ",
        action = "Telescope live_grep",
        shortcut = "<Leader> f g"
    }, {
        icon = "  ",
        desc = "Open Nvim config                        ",
        action = "e ~/.config/nvim",
        shortcut = "<Leader> e v"
    }, {
        icon = "  ",
        desc = "Open tree                               ",
        action = "e .",
        shortcut = "e           "
    }, {
        icon = "  ",
        desc = "Quit Nvim                               ",
        -- desc = "Quit Nvim                               ",
        action = "qa",
        shortcut = "q           "
    }, {
        icon = "  ",
        desc = "Competitive                             ",
        action = "e ~/projects/competitive",
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
