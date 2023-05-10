local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)}

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
    defaults = {
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments
        -- i = {
        --   -- map actions.which_key to <C-h> (default: <C-/>)
        --   -- actions.which_key shows the mappings for your picker,
        --   -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --   ["<C-h>"] = "which_key"
        -- }
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"}
        }
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   ["i"] = {
      --     -- your custom insert mode mappings
      --   },
      --   ["n"] = {
      --     -- your custom normal mode mappings
      --   },
      -- },
    },
})

-- require("telescope").load_extension "file_browser"
