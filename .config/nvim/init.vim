let g:ryans_conf_is_quickfix_window_open = 0
" Vim Plug {{{
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'morhetz/gruvbox'
" Vim-Plug:
"Plug 'skywind3000/gutentags_plus'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
" }}}


" Key Mapping {{{
" Leader
let mapleader=","
inoremap jk <esc>

" Key binddings for vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" buffer 
nnoremap <leader>bl :buffers<cr>
nnoremap <c-j> :bn<cr>
nnoremap <c-k> :bn<cr>
nnoremap B :silent Buffers<cr>

" quickfix window 
nnoremap <leader>j :cn<cr>
nnoremap <c-down> :cn<cr>
nnoremap <leader>k :cp<cr>
nnoremap <c-up> :cp<cr>
nnoremap <leader>tq :ToggleQuickfixWindow<cr>
nnoremap <leader>cq :CloseQuickfixWindow<cr>

" window management 
nnoremap Q :q<cr>
nnoremap O :on<cr>



nnoremap <leader>hl :nohl<cr>
nnoremap \ :

" cscope
nnoremap <leader>ce :call <SID>FindeGrepPattern()<cr>

function s:FindeGrepPattern()
    cexpr []
    execute "cs find e " . expand('<cword>')
    copen
    let g:ryans_conf_is_quickfix_window_open = 1
    exe "normal! \<c-w>\<c-p>"
endfunction

nnoremap <leader>cg :call <SID>CscopeFindDefinition()<cr>

function s:CscopeFindDefinition()
    cexpr []
    execute "cs find g " . expand('<cword>')
    copen
    let g:ryans_conf_is_quickfix_window_open = 1
    exe "normal! \<c-w>\<c-p>"
endfunction

nnoremap <leader>cr :call <SID>CscopeFindReferFunc()<cr>
function s:CscopeFindReferFunc()
    cexpr []
    execute "cs find c " . expand('<cword>')
    copen
    let g:ryans_conf_is_quickfix_window_open = 1
    exe "normal! \<c-w>\<c-p>"
endfunction

" }}}

" My pereference settings {{{
set nu
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set ignorecase
set hidden
set cursorline
colorscheme gruvbox
set nowrap
" }}}

" My command {{{

" clear quickfix window's content
command! ClearQuickfixList cexpr []
command! CloseQuickfixWindow call <SID>close_quickfix_window()
command! HideQuickfixWindow call <SID>hide_quickfix_window()
command! ToggleQuickfixWindow call <SID>toggle_quickfix_window()

function s:hide_quickfix_window()
    ccl
endfunction

let g:ryans_conf_is_quickfix_window_open = 0
function s:close_quickfix_window()
    cexpr []
    ccl
    let g:ryans_conf_is_quickfix_window_open = 0
endfunction

"
"
function s:toggle_quickfix_window()
    if g:ryans_conf_is_quickfix_window_open
        " close the quickfix window
        ccl
        let g:ryans_conf_is_quickfix_window_open = 0
    else
        " open it 
        cope
        let g:ryans_conf_is_quickfix_window_open = 1
    endif
endfunction

" }}}

" Settings for gtags {{{
let $GTAGSLABEL='native'
let $GTAGSCONF='/usr/local/share/gtags/gtags.conf'
" }}}

" Settings for Gutentags {{{
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
 
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"if !isdirectory(g:gutentags_cache_dir)
"  silent! call mkdir(g:gutentags_cache_dir, 'p')
"endif

let g:gutentags_modules = []
"if executable('ctags') 
"    let g:gutentags_modules += ['ctags']
"endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI' ]
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px' ]
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags' ]
let g:gutentags_trace=1
"
"let g:gutentags_plus_switch=1
set cscopequickfix=s+,c+,d+,i+,t+,e+,g+,f+,a+
"
"set cscope


" 
" }}}

" UI Settings {{{
set statusline=%f\ -\ FileType:\ %y
" }}}

" Vimscript File Settings -------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" vimscript file settings end -------------- }}}


" Allow passing optional flags into the Rg command. {{{
" Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)
" }}}
