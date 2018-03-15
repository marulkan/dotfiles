call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/denite.nvim'
    Plug 'chemzqm/vim-easygit'
    Plug 'chemzqm/denite-git'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-python/python-syntax'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'mitsuhiko/vim-jinja'
    Plug 'itchyny/lightline.vim'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'    " Auto relative number toggling
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'roosta/srcery'
    Plug 'tpope/vim-fugitive'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:python_highlight_all = 1
let g:vim_markdown_folding_disabled = 1

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

if (exists('+colorcolumn'))
  set colorcolumn=81
endif

colorscheme srcery

let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Tab Options
set shiftwidth=4
set tabstop=4
set expandtab                      "Inter spaces instead of tabs
set smarttab

" set title and allow hidden buffers
set title
set hidden

syntax enable
set noshowmode                     " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set backspace=indent,eol,start     " Backspace will delete EOL chars, as well as indents
set shortmess=atToOI               " To avoid the 'Hit Enter' prompts caused by the file messages
set history=1000
set undolevels=1000
set confirm
set updatetime=1500

" Backup and Swap"
set nobackup
set nowritebackup
set noswapfile

" Search Options"
set hlsearch                       " Highlight search
set incsearch                      " Incremental search
set magic                          " Set magic on, for regular expressions
set ignorecase                     " Searches are Non Case-sensitive
set smartcase

set encoding=utf-8

" display tabs, not displaying trailing spaces because set to remove on write"
set list listchars=tab:»·

" General UI Options"
" set mouse=a
set laststatus=2                   " Always show the statusline
set showmatch                      " Shows matching brackets when text indicator is over them
set scrolloff=5                    " Show 5 lines of context around the cursor
set sidescrolloff=5
set cursorline
set scrolljump=10
set showcmd
set pumheight=10
set diffopt+=context:3
set nostartofline                  " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap                           " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak                      " It maintains the whole words when wrapping

" Indentation"
set autoindent
set cindent
set smartindent

" Leader key Mappings
" Clear search highlighting
nnoremap <silent><leader>c :nohlsearch<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vmap > >gv
vmap < <gv
vmap = =gv

set clipboard=unnamedplus

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

