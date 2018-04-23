execute pathogen#infect()

" NeoVim only, not Vim
set nocompatible

" Enable syntax highlighting
syntax on

" Enable filetype-specific plugins and indentation
filetype plugin indent on 

" Enable autocompletion
set omnifunc=syntaxcomplete#Complete

" Have the editor show line numbers
:set number

" Set a color scheme 
colorscheme spacegray 

" Enable deoplete
let g:deoplete#enable_at_startup = 1 

" Have neomake display errors automatically
let g:neomake_open_list = 2

:let mapleader = ","
:let maplocalleader = "\\"

" Split horizontally and open a shell in the lower pane
:nnoremap <leader>o :below 10sp term://$SHELL<cr>i

" ----------------------------------------------------
" NERDTree plugin settings 
" ----------------------------------------------------

" Toggle the nerdtree file browser 
:nnoremap <leader>f :NERDTreeToggle<CR> 

" Close neovim if the only window remaining open is nerdtree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start nerdtree when no file is specified on neovim start
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

" Start nerdtree when neovim starts with a directory 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv() 

" Start nerdtree after vim initialization
autocmd VimEnter * NERDTree

" Place cursor in the editor pane rather than the nerdtree pane initially 
autocmd VimEnter * wincmd p

