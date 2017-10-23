set spell
set termguicolors
set number

" Replace tabs with 4 spaces
set expandtab
set tabstop=4

" Set width to shift by for commands < and  >
set shiftwidth=4

filetype plugin on
filetype indent on

" Map leader is space
let mapleader = " "

" Get copy and paste to work
set mouse=

inoremap jj <ESC>

" Navigation for between panes
inoremap <c-j> <c-w>j
nnoremap <c-j> <c-w>j
inoremap <c-k> <c-w>k
nnoremap <c-k> <c-w>k
inoremap <c-l> <c-w>l
nnoremap <c-l> <c-w>l
inoremap <c-h> <c-w>h
nnoremap <c-h> <c-w>h

" Easily open this file
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>pi :PlugInstall<cr>

" Quick jumps horizontally
nnoremap H ^
nnoremap L $
nnoremap K {
nnoremap J }

vnoremap H ^
vnoremap L $
vnoremap K {
vnoremap J }

" Automatically order imports
nnoremap <leader>i :Isort<cr>

" fzf plugin
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdcommenter'
Plug 'janko-m/vim-test'
Plug 'fisadev/vim-isort'
Plug 'neomake/neomake'
Plug 'karlbright/qfdo.vim'
Plug 'vimlab/split-term.vim'
Plug 'alfredodeza/coveragepy.vim'
Plug 'embear/vim-localvimrc'
call plug#end()

{%@@ if profile == "base" @@%}
nnoremap <silent> <Leader>fe :call fzf#run({
    \   'down': '50%',
    \   'sink': 'vsplit' })<CR>

nnoremap <silent> <Leader>fh :call fzf#run({
    \   'down': '50%',
    \   'sink': 'split' })<CR>
{%@@ endif @@%}

{%@@ if profile == "aweidner-mbp" @@%}
nnoremap <silent> <Leader>fe :call fzf#run({
    \   'down': '50%',
    \   'sink': 'split' })<CR>

nnoremap <silent> <Leader>fv :call fzf#run({
    \   'down': '50%',
    \   'sink': 'vsplit' })<CR>
{%@@ endif @@%}

colorscheme gruvbox
set background=dark

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestSuite<cr>

nnoremap <leader>rc :Coveragepy refresh<cr>
nnoremap <leader>sc :Coveragepy show<cr>

let test#python#pytest#executable = 'ptw --'

function! TermStrategy(cmd)
    execute ":Term " . a:cmd
    call feedkeys("\<esc>\<C-w>j")
endfunction
    
let g:test#custom_strategies = {'term': function('TermStrategy')}
let test#strategy = 'term'

let g:localvimrc_persistent = 2
