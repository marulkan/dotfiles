call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-airline/vim-airline'                    " Status line
  Plug 'vim-airline/vim-airline-themes'                    " Status line
  Plug 'jeffkreeftmeijer/vim-numbertoggle'    " Auto relative number toggling
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/unite.vim'
  Plug 'rking/ag.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/vim-easy-align'
  Plug 'google/yapf'
  Plug 'python-mode/python-mode'
call plug#end()

let g:pymode_python = 'python3'

let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_cwindow = 0
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

let g:pymode_breakpoint = 0

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

set background=dark
"try
"  colorscheme mustang
"catch
"endtry

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
colorscheme twodark

if (exists('+colorcolumn'))
  set colorcolumn=80
  highligh ColorColumn ctermbg=9
endif

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" --- type  to search the word in all files in the current dir
nmap 8 :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tab Options"
set shiftwidth=4
set tabstop=4
set expandtab "Inter spaces instead of tabs.
set smarttab

" set title and allow hidden buffers
set title
set hidden

syntax enable
set nomodeline
set noshowmode                                          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set backspace=indent,eol,start                          " Backspace will delete EOL chars, as well as indents
set shortmess=atToOI                                    " To avoid the 'Hit Enter' prompts caused by the file messages
set history=1000
set undolevels=1000
set confirm
set updatetime=1500

" Backup and Swap"
set nobackup
set nowritebackup
set noswapfile

" Search Options"
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

set encoding=utf-8

" display tabs, not displaying trailing spaces because set to remove on write"
set list listchars=tab:»·

" General UI Options"
set mouse=a
set laststatus=2       " Always show the statusline
set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set cursorline
set scrolljump=10
set showcmd
set pumheight=10
set diffopt+=context:3
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping

" Indentation"
set autoindent
set cindent
set smartindent

" Leader key Mappings
" Clear search highlighting
nnoremap <silent><leader>c :nohlsearch<CR>

" Highlight the current line
nnoremap <silent> <Leader>h ml:execute 'match Search /\%'.line('.').'l/'<CR>

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

" map <C-P> :YAPF<cr>
autocmd FileType python nnoremap <C-P> :0,$!yapf<cr>
