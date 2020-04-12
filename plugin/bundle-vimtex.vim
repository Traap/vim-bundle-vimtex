" {{{ bundle-vimtex.vim 
if exists('g:loaded_bundle_vimtex')
  finish
endif
" -------------------------------------------------------------------------- }}}
" {{{ vimtex
let g:tex_flavor = 'latex'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 0

let g:vimtex_format_enabled = 1

let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1

let g:vimtex_latexmk_enabled = 1

let g:vimtex_quickfix_mode = 2
let g:vimtex_view_enabled = 1

let g:vimtex_quickfix_latexlog = {
      \ 'empty glossary' : 0,
      \ 'font warning' : 0,
      \ 'overfull' : 0,
      \ 'specifier change to' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'tocloft' : 0,
      \  },
      \ }

if has('nvim')
  let g:vimtex_compiler_progname="nvr"
endif

if has("win32unix")
  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
else
  " let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_view_general_viewer = 'okular'
  let g:vimtex_compiler_latexmk = {
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
endif
" -------------------------------------------------------------------------- }}}
