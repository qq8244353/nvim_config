require("telescope").setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments
    },
    pickers = {
        find_files = {
            find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"}
        }
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
})
