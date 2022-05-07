call plug#begin('~/.local/share/nvim/site/autoload')
if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'voldikss/vim-translator'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
"Options
"""""""""""""""""""""""""""""""""""""""""""""""""
"" Vimtex
let g:vimtex_view_method = 'zathura'
let maplocalleader = " "

"Translator
let g:translator_target_lang = 'en'
let g:translate_popup_window = 0

nnoremap <F5> "=strftime("%FT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

