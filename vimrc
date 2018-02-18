function! LoadVundle()
    let vundle_installed=filereadable(expand('~/.vim/bundle/vundle/README.md'))
    if vundle_installed == 0
        echo "Creating backups directory..."
        silent !mkdir -p ~/.vim/backups
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Bundle definitions
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'Raimondi/delimitMate'
    Plugin 'mattn/emmet-vim'
    Plugin 'fatih/vim-go'
    Plugin 'elzr/vim-json'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'rking/ag.vim'
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'w0rp/ale'
    Plugin 'ervandew/supertab'
    Plugin 'craigemery/vim-autotag'
    Plugin 'zhaocai/GoldenView.Vim'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'romainl/flattened'
    Plugin 'jelera/vim-javascript-syntax'

    if vundle_installed==0
        echo vundle_installed
        echo "Vundle Installed, now Installing Bundles..."
        echo ""
        :BundleInstall
        silent !make -C ~/.vim/bundle/vimproc.vim
    endif
endfunction
call LoadVundle()

set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf8
set number
set relativenumber
set nowrap
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set nobackup
set nowritebackup
set noswapfile
set tags+=tags,.tags
set mouse=

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_list_type="quickfix"
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
set runtimepath^=~/.vim/bundle/ag
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/Vendor/*,*/.DS_Store,*/env/*,*/venv/*,*/node_modules/*,*.pyc,*.pyo,*__pycache__
let g:vim_json_syntax_conceal = 0
set background=light
colorscheme flattened_light
hi VertSplit ctermfg=10  ctermbg=none
hi SignColumn ctermbg=none
hi LineNr ctermbg=none

let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
let g:airline_powerline_fonts=1

autocmd BufRead,BufNewFile *.blade.php set filetype=html
autocmd BufRead,BufNewFile *.ctp set filetype=html
autocmd BufRead,BufNewFile *.vue set filetype=html

autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2

let g:goldenview__enable_default_mapping = 0
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store$', '\var$', '\.vscode$', 'node_modules']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:DevIconsEnableFoldersOpenClose = 1
autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0
let g:neocomplete#enable_at_startup = 1

let g:autotagTagsFile="tags"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=','

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

map <c-n> :NERDTreeToggle<CR>
map <cr> :TagbarToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
noremap <C-h> <C-W>h
map <C-l> <C-W>l
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>

let g:ale_linters = {'html': ['']}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '*'
