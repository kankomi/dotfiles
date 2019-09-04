let mapleader=" "
colorscheme minimalist
"set mouse=a
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set incsearch
set hlsearch

set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=4

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"Plugin 'Valloric/YouCompleteMe'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-markdown'
Plugin 'powerline/powerline'
Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Deoplete options
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('auto_complete_delay', 200)

" jedi vim options
let g:jedi#force_py_version = 3

" Keymaps
nmap <F2> :Explore<CR>
nmap <Tab> v<C->><Esc>
nmap <S-Tab> v<C-lt><Esc>
nnoremap <C-n> :tabnew<CR>
nnoremap <A-S-f> :Autopep8<CR>
