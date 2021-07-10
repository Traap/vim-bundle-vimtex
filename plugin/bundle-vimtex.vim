" {{{ bundle-vimtex.vim

if exists('g:loaded_bundle_vimtex')
  finish
endif
let g:loaded_bundle_vimtex=1

" -------------------------------------------------------------------------- }}}
" {{{ Archlinux and Windows Subsystem for Linux check

let g:os_arch = trim(system("cat /etc/issue | rg 'Arch Linux' -c"))

let s:os_wsl = trim(system('uname -r'))
let g:os_wsl  = (s:os_wsl =~ 'Microsoft') || (s:os_wsl =~ 'WSL2')

if g:os_wsl
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
else
  let g:vimtex_view_general_viewer = 'okular'
endif

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

let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
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
