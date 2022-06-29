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
Plugin 'Soares/base16.nvim'

"Tools
"Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
"edit
Plugin 'tpope/vim-surround'
"wiki
Plugin 'vimwiki/vimwiki'
"markdown
Plugin 'plasticboy/vim-markdown'
" ending tags
"Plugin 'alvan/vim-closetag'
Plugin 'ap/vim-css-color'
Plugin 'preservim/nerdtree'
"ripgrep
Plugin 'jremmen/vim-ripgrep'
"vim rooter for :Rg to work in whole project
Plugin 'airblade/vim-rooter' 
" ale - better errors?
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
" deoplete with dependencies
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plugin 'Shougo/deoplete-lsp'
  Plugin 'neovim/nvim-lsp'
  Plugin 'Chiel92/vim-autoformat'
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
"language server
Plugin 'neovim/nvim-lspconfig'
"deoplete sources
Plugin 'deoplete-plugins/deoplete-jedi'
" tsx, react, ts
Plugin 'ianks/vim-tsx'
Plugin 'leafgarland/typescript-vim'
"html
Plugin 'mattn/emmet-vim'

" go lang support
Plugin 'fatih/vim-go'
"toml syntax hightlight
Plugin 'cespare/vim-toml'
" Vim table mode
" https://github.com/dhruvasagar/vim-table-mode
" telescope
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-symbols.nvim'
Plugin  'nvim-lua/plenary.nvim'
Plugin 'srcery-colors/srcery-vim'

"telekasten
Plugin 'renerocksai/telekasten.nvim'
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
set termguicolors "https://github.com/tmux/tmux/issues/699
colorscheme gruvbox


"Set also lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
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
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,b,s  " backspace, space and cursor keys wrap to pre/next line
set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" always numbers, relative
set number " turn on line numbers
set relativenumber

" make the splitters between indows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\

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
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>
"opens nerd tree
nnoremap <leader>nt :NERDTree<cr>
"toggles nerd tree
nnoremap <leader>ntt :NERDTreeToggle<cr>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nmap <leader>q :nohlsearch<CR>
noremap <leader>x :w<CR> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=100 " 100 cols wide
set so=6 " Keep 6 lines (top/bottom) for scope
set novisualbell " don't blink
"set colorcolumn=+1 "mark the ideal max text width
set laststatus=2 " always show the status line

set guioptions-=T " disable toolbar
set guioptions-=m " disable menubar
set guioptions-=r " disable scrollbar

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
iab date <C-R>=strftime("%Y-%m-%d %H:%M:%S")<cr>
ab pyenc #!/usr/bin/python vim: set fileencoding=UTF-8<cr>
ab pymain if __name__ == "__main__":<cr>


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
nmap <leader>p :set paste!<CR>
" behavior of comman line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" save file path in + register
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Mappings for date - F3 inserts 2022-05-22 06:52:39 in insert mode
imap <F3> <C-R>=strftime("%F %a %H:%M")<CR>

" sync current buffer with ntt: 2 options
" 1. sets working dir to current file's dir or...
"autocmd BufEnter * lcd %:p:h
" 2. map 
map <leader>r :NERDTreeFind<cr>

runtime macros/matchit.vim

" vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'go': 'go', 'python': 'python', 'java': 'java', 'rust': 'rust'}

let wiki_p = {}
let wiki_p.path = '~/crypt/wiki/'
let wiki_p.path_html = '~/crypt/wiki_html/'

let g:vimwiki_list = [wiki, wiki_p]
let g:vimwiki_global_ext = 0

hi VimwikiHeader1 guifg=#f0c674
hi VimwikiHeader2 guifg=#b5bd68
hi VimwikiHeader3 guifg=#8abeb7
hi VimwikiHeader4 guifg=#b294bb
hi VimwikiHeader5 guifg=#81a2be
hi VimwikiHeader6 guifg=#de935f


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
let g:deoplete#enable_at_startup = 0
"deoplete maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

"rust
" setup rust_analyzer LSP (IDE features)
lua require'lspconfig'.rust_analyzer.setup{}
" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"
"autocmplete rust on save (rust.vim)
let g:rustfmt_autosave = 1

"deno
" lspconfig for deno (after Plugin neovim/nvim-lspconfig
lua require'lspconfig'.denols.setup{}
" deno vim suggestions from deno website
" Use ALE autocompletion with Vim's 'omnifunc' setting (press <C-x><C-o> in insert mode)
autocmd FileType typescript set omnifunc=ale#completion#OmniFunc
autocmd FileType typescript.tsx set omnifunc=ale#completion#OmniFunc

let g:ale_fixers = {'typescript': ['deno']}
let g:ale_fix_on_save = 1 " run deno fmt when saving a buffer

"example config from :help lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


" configure typescript 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following

set autowrite 
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" configure go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>f  <Plug>(go-fmt)
autocmd FileType go nmap <leader>i  <Plug>(go-imports)

"autoformat code AND clean up imports
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"


"enable toml hightlighting
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0

"telescope
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

