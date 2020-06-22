"""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Get out of horrible vi-compatible mode
set nobackup " Don't create backup files
set history=1000 " How many lines of history to remember
set undolevels=200 " How many times an udo can be done
set showcmd " Shows partial command in last line of the editor
set showmatch " Show matching brackets
set noshowmode " Dont Show current mode - lightline exists
set ignorecase " Make searches case insensitive
set smartcase " unless they contain uppercase letters
set incsearch " highlight during searching
set hlsearch "highlight..
"but quit hl mode with \q
nmap <leader>q :nohlsearch<CR>

set gdefault "apply substitutions globally in line
set scrolloff=5 " Keep context while scrolling
set ffs=unix,dos " support all in this order
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers-so make them not be


filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"view
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
"Tools
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
"edit
Plugin 'tpope/vim-surround'
" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'paredit.vim'
Plugin 'rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-static'
"Kotlin
Plugin 'udalov/kotlin-vim'
"wiki
Plugin 'vimwiki/vimwiki'
"markdown
Plugin 'plasticboy/vim-markdown'
"distraction-free
Plugin 'junegunn/goyo.vim'
" ending tags
"Plugin 'alvan/vim-closetag'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ap/vim-css-color'
Plugin 'preservim/nerdtree'
" deoplete with dependencies
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePluginins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
"deoplete sources
Plugin 'deoplete-plugins/deoplete-jedi'
" markdown

call vundle#end()

filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

syntax on " Set syntax highlighting on
set t_Co=256
"colorscheme wombat
colorscheme onedark
"colorscheme solarized
"Set also lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

"highlight ColorColumn ctermbg=235 guibg=#2c2d27
"let &colorcolumn="80,".join(range(120,999),",")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,b,s  " backspace, space and cursor keys wrap to pre/next line
set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
set relativenumber
" make the splitters between indows be blank
"set fillchars=vert:\ ,stl:\ ,stlnc:\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"direction keys without pressing W
let mapleader = " "
noremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"clear whitespace at line ends
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"allows edit vimrc  file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"opens nerd tree
nnoremap <leader>nt :NERDTree<cr>
"toggles nerd tree
nnoremap <leader>ntt :NERDTreeToggle<cr>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=100 " 100 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set colorcolumn=+1 "mark the ideal max text width
set laststatus=2 " always show the status line

:set guioptions-=T " disable toolbar
:set guioptions-=m " disable menubar
:set guioptions-=r " disable scrollbar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set tabstop=2 " tab spacing (settings below are just to unify it)
set softtabstop=2 " unify
set shiftwidth=2 " unify
set expandtab " no tabs please!
set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xdate <C-R>=strftime("%d/%m/%y %H:%M:%S")<cr>
ab pyenc #!/usr/bin/python vim: set fileencoding=UTF-8<cr>
ab pymain if __name__ == "__main__":<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep: search in single file should always display filename (to not confuse latex script
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous stuff.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Make p in visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""    My mappings from "learn the vimscript the hard way"
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>sv :source $MYVIMRC <cr>

" Some niceties from http://statico.github.io/vim.html
"
" paste mode on/off
:nmap <leader>p :set paste!<CR>
" behavior of comman line
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>

"http://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly/16084326#16084326
" Goes to buffer with given name
nnoremap gb :ls<CR>:b<Space>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" save file path in + register
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Mappings for date
nmap <F3> <C-R>=strftime("%F %a %H:%M")<CR>
imap <F3> <C-R>=strftime("%F %a %H:%M")<CR>


runtime macros/matchit.vim

" vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'java': 'java'}
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0

hi VimwikiHeader1 guifg=#f0c674
hi VimwikiHeader2 guifg=#b5bd68
hi VimwikiHeader3 guifg=#8abeb7
hi VimwikiHeader4 guifg=#b294bb
hi VimwikiHeader5 guifg=#81a2be
hi VimwikiHeader6 guifg=#de935f

" Clojure editing
" paredit leader
let g:paredit_leader = '\'

"markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_extensions_in_markdown = 1

"netrw
let g:netrw_liststyle=3
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" omnicomplete?
set omnifunc=syntaxcomplete#Complete
"deoplete
let g:deoplete#enable_at_startup = 1
