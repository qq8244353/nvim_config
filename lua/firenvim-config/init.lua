vim.cmd [[
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea, div[role="textbox"]',
            \ 'priority': 0,
        \ }
    \ }
\ }
let g:firenvim_font = 'Droid\ Sans\ Mono\ Slashed\ for\ Powerline'
function! Set_Font(font) abort
  execute 'set guifont=' . a:font . ':h14'
endfunction
]]
