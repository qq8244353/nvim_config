vim.cmd [[
nnoremap <silent><TAB> : BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> : BufferLineCycleNext<CR>
]]
require("bufferline").setup {
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neotree",
				highlight = "Directory",
				text_align = "left"
			}
		}
	}
}
