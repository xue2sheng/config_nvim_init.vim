" memory
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

" ================ Indentation ======================

" spell languages
set spelllang=en,cjk
set spell

" tabs
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" =============== plugins =========================

" call plug#begin('~\AppData\Local\nvim\plugged')
call plug#begin('~/.config/nvim/plugged')

" =============== rust =======================

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language Server Client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
let g:LanguageClient_serverCommands = { 'rust': ['rust-analyzer'], }

" For improved UI
Plug 'junegunn/fzf'

Plug 'rust-lang/rust.vim',         { 'for': 'rust' }

" ============= go ====================

Plug 'ollykel/v-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ============= folders =================

Plug 'preservim/nerdtree'

call plug#end()
" ...

" Configure deoplete
let g:deoplete#enable_at_startup = 1

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
" nmap <silent> <F2> <Plug>(lcn-rename)
autocmd FileType rust nmap <silent> gr <Plug>(lcn-rename)
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)

" Configure Rust formatter https://github.com/rust-lang/rust.vim#formatting-with-rustfmt
" autocmd Filetype rust nnoremap == :RustFmt<CR>
let g:rustfmt_autosave = 1

" folders
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
