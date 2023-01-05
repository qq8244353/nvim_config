require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = {"git", "diagnostics"},
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    containers = {attach_shell = "/bin/sh", show_all = true, interval = 5000},
    datetime = {format = "%a %b %d, %H:%M", clocks = {{name = "local"}}},
    todos = {ignored_paths = {"~"}}
})
