" designed for vim 8+
" (see rwx.gg/vi for help)
let skip_defaults_vim=1
set nocompatible

""""""""""""""""""""""""""""
" set leader to space
let mapleader=" "

set splitright
set splitbelow

set clipboard=unnamed

" if (has("termguicolors"))
" 	set termguicolors " true color
" endif

set nowrap
set ttimeoutlen=5
set cursorline
set cursorlineopt=number
set belloff=all

" disable netrw banner
let g:netrw_banner=0
" display netrw as tree
let g:netrw_liststyle=3
let g:netrw_winsize=24

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
""""""""""""""""""""""""""""

" activate cool line numbers
set number
set relativenumber

" turn info in tray on even if default
set ruler

" tabs are cool
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" easier to see characters when `set paste` is on
" set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
set list
set listchars=tab:\ \ ,nbsp:␣,trail:·,extends:⟩,precedes:⟨

" more risky, but cleaner
" set nobackup
" set noswapfile
" set nowritebackup

" keep the terminal title updated
set laststatus=0
set icon

" center the cursor always on the screen - no
set scrolloff=8
set sidescrolloff=4

" highlight search hits,  \+<cr> to clear
set hlsearch
set incsearch
set linebreak
nmap <silent> <leader><cr> :noh<cr>
" nmap <silent> <esc> :noh<cr> " causes vim to enter in `REPLACE` mode

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
let g:loaded_matchparen=1
set noshowmatch
set foldmethod=manual

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join
set formatoptions+=1   " don't break a line after a one-letter word

" requires PLATFORM env variable set (in ~/.bashrc)
if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
syntax enable

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" Install vim-plug if not already installed
" (Yes I know about Vim 8 Plugins. They suck.)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" high contrast for streaming, etc.
set background=dark
colorscheme industry

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
	call plug#begin('~/.vim/plugged')
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'https://gitlab.com/rwxrob/vim-pandoc-syntax-simple'
	Plug 'ctrlpvim/ctrlp.vim'
	" Plug 'christoomey/vim-tmux-navigator'
	" Plug 'cespare/vim-toml'
	" Plug 'fatih/vim-go'
	" Plug 'airblade/vim-gitgutter'
	" Plug 'PProvost/vim-ps1'
	" Plug 'morhetz/gruvbox'
	call plug#end()
	"set background=dark
	colorscheme gruvbox
	hi Normal guibg=NONE ctermbg=NONE
	hi Visual ctermbg=242 guibg=#665c54 term=NONE cterm=NONE gui=NONE
else
	" autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

" fill in empty markdown links with duck.com search
" autocmd vimleavepre *.md !perl -p -i -e 's,\[([^\]]+?)\]\(\),[\1](https://duck.com/lite?kae=t&q=\1),g' %

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

" force some file names to be specific file type
"au bufnewfile,bufRead *.bash* set ft=sh
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" pane switching vi style (duh)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-n> :Lex<CR>

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
" nmap <F2> :call <SID>SynStack()<CR>
nmap <F2> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
set pastetoggle=<F3>
map <F4> :s/\s\+$//<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F8> :set keymap=russian-jcukenwin<CR>:set spelllang=ru<CR>
map <F9> :set keymap=<CR>:set spelllang=en<CR>
map <F12> :set fdm=indent<CR>

" center screen on scroll
map <c-d> <c-d>zz
map <c-u> <c-u>zz
map <c-f> <c-f>zz
map <c-b> <c-b>zz

" read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
