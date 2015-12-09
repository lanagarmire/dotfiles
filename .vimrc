" -------
" Plugins
" Managed by vim-plug
" -------
call plug#begin()

" Misc
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'myusuf3/numbers.vim'
Plug 'ntpeters/vim-better-whitespace'

" Nav
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" UI
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'altercation/vim-colors-solarized'

" Helpers
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Languages
"   Ruby/Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
"   JavaScript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
"   HTML
Plug 'othree/html5.vim'
"   Others
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'

call plug#end()


let mapleader = ","
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set tabstop=2 shiftwidth=2 expandtab " 2 space tabbing
set number " showing line numbers

set hidden " allowing files with pending changes

" Built-in file browser
let g:netrw_liststyle=3 " defaulting to tree view

" Running ruby script and capturing output in buffer
:command! R let f=expand("%")|vnew|execute '.!ruby "' . f . '"'

" Run the current file cleaning the display first
nnoremap <F9> :!clear; tmux clear-history; %:p<ENTER>

" Open current file in Marked2
nnoremap <leader>m :silent !open -a Marked '%:p'<cr>

" NERDTree
map <leader>ne :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

if has("autocmd")
  " autocmd BufEnter * cd %:p:h " Automatically change directory
  autocmd BufWritePost .vimrc source $MYVIMRC " Automatically source .virmc
endif

" Setting up viminfo
set viminfo='100,n$HOME/.vim/files/info/viminfo

" Startify
let g:startify_bookmarks = [ {'v': '~/.vimrc'} ]

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" CTRLP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Numbers.vim
nnoremap <F3> :NumbersToggle<CR>

" Coloring
if !has("gui_running")
  " set term=xterm-256color
endif

" Whitespace
" https://github.com/ntpeters/vim-better-whitespace/issues/40
autocmd VimEnter * DisableWhitespace
autocmd VimEnter * EnableWhitespace

syntax enable
set background=dark
colorscheme solarized
" let g:solarized_termcolors=256
let g:airline_solarized_bg = 'dark'
let g:airline_theme = 'solarized'
