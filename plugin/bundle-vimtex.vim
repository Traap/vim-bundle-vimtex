" {{{ bundle-vimtex.vim

if exists('g:loaded_bundle_vimtex')
  finish
endif
let g:loaded_bundle_vimtex=1

" -------------------------------------------------------------------------- }}}
" {{{ Windows Subsystem for Linux check

if !empty(getenv('WSL_DISTRO_NAME')) || has("win32unix")
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
else
  let g:vimtex_view_general_viewer = 'okular'
endif

" -------------------------------------------------------------------------- }}}
" {{{ vimtex | https://github.com/lervag/vimtex

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

let g:vimtex_compiler_latexmk = {
      \ 'out_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-pdf',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" -------------------------------------------------------------------------- }}}
" {{{ Vim Completes Me | https://github.com/ajh17/VimCompletesMe/

augroup VimCompletesMeTex
  autocmd!
  autocmd FileType tex
      \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END

" -------------------------------------------------------------------------- }}}
