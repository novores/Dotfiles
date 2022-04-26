let g:mapleader=" "

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" beter escape 
inoremap jk <esc>

""""""""PLUGINS"""""""
""Translate
vmap <C-t> :TranslateR<CR>

""NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

""FZF
nnoremap <silent> <leader>ff :FZF<CR>
