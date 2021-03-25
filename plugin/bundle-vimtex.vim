" {{{ bundle-vimtex.vim
if exists('g:loaded_bundle_vimtex')
  finish
endif
let g:loaded_bundle_vimtex=1
" -------------------------------------------------------------------------- }}}
" {{{ vimtex | https://github.v:lervag/vimtex

let g:vimtex_fold_enabled = 0
let g:vimtex_fold_manual = 1

let g:vimtex_format_enabled = 1

let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1

let g:vimtex_quickfix_mode = 2
let g:vimtex_view_enabled = 1

let g:vimtex_quickfix_ignore_filters = [
      \ 'empty glossary',
      \ 'font warning',
      \ 'Overfull',
      \ 'specifier change to',
      \ 'Underfull',
      \ ]

if has('nvim')
  let g:vimtex_compiler_progname="nrv"
endif


if has("win32unix")
  let g:vimtex_view_general_viewer = 'SumatraPDF'
elseif g:os_wsl || has("windows")
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
elseif has('unix')
  let g:vimtex_view_general_viewer = 'okular'
else
  let g:vimtex_view_general_viewer = 'okular'
endif

if has("win32unix")
  let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 0,
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
  let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
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
" {{{ Vim Completes Me | https://github.com/ajh17/VimCompletesMe/
augroup VimCompletesMeTex
  autocmd!
  autocmd FileType tex
      \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
" -------------------------------------------------------------------------- }}}
