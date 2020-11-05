" {{{ bundle-vimtex.vim
if exists('g:loaded_bundle_vimtex')
  finish
endif
let g:loaded_bundle_vimtex=1
" -------------------------------------------------------------------------- }}}
" {{{ Are we running WSL (windows Sybsystem for Linux)
"
" uname prints system information.  The information below was captured while
" running Ubuntu 18.04 from WSL2.
"
" uname        : Linux:
"     kernel -s: Linux:
"      node  -n: USLKZ6QQ6WT2:
"   release  -r: 4.4.0-18362-Microsoft:
"   version  -v: #476-Microsoft Fri Nov 01 16:53:00 PST 2019:
"   machine  -m: x86_64:
" processor  -p: x86_64:
"  hardware  -i: x86_64:
"        OS  -o: GNU/Linux:
let g:os_wsl = (substitute(system('uname -r'), '\n', '', '') =~ 'Microsoft')

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
  let g:vimtex_compiler_progname="nvr"
endif


if has("win32unix")
  let g:vimtex_view_general_viewer = 'SumatraPDF'
elseif g:os_wsl
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
elseif has('unix')
  let g:vimtex_view_general_viewer = 'okular'
else
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
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
