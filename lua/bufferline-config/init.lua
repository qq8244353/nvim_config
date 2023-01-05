require("bufferline").setup {}
vim.cmd [[
nnoremap <silent><TAB> : BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> : BufferLineCycleNext<CR>
]]
