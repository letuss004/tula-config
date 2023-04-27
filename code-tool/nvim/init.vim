:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:colorscheme jellybeans


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'https://github.com/preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tc50cal/vim-terminal'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()


noremap <F1> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()


let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '∆'           " replace C-n
let g:VM_maps['Find Subword Under'] = '∆'           " replace visual C-n
let g:VM_mouse_mappings = 1


" Close the tab if NERDTree is the only window remaining in it."
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree"
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

