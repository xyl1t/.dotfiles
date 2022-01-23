filetype plugin indent on
" autocmd Filetype c,cpp,css,html,js,java,cs,json,xml syntax on
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set smartindent
" for space lovers:
" set softtabstop=4
" set expandtab
set nu
set rnu
set scrolloff=3
" set nohlsearch
set incsearch
set hidden
set noerrorbells
set nowrap
set signcolumn=yes "number
set mouse=a
set clipboard=unnamedplus
set noshowmode " don't show current mode because we are using a powerline plugin
set splitright " when splitting, put the cursor on the new split
set splitbelow
set undofile " keep track of my undos between sessions
set inccommand=nosplit " substitution preview (this is default in nvim 0.6!)
set list
set listchars=tab:\ \ ,extends:>,precedes:<,nbsp:␣,trail:·
set pumheight=16
set pumblend=10
set updatetime=100
if (has("termguicolors"))
	set termguicolors " true color
endif
" set formatoptions-=co " do not comment on next line if current line is a comment

let g:netrw_banner=0    " disable netrw banner
let g:netrw_liststyle=3 " display netrw as tree

call plug#begin('~/.vim/plugged')
" visual sugar
Plug 'itchyny/lightline.vim'        " cool statusbar
Plug 'kyazdani42/nvim-web-devicons' " file icons
Plug 'psliwka/vim-smoothie'         " smooth scrolling
Plug 'onsails/lspkind-nvim'         " adds vscode-like pictograms to neovim built-in lsp
Plug 'ap/vim-css-color'             " a very fast, multi-syntax context-sensitive color name highlighter
Plug 'junegunn/goyo.vim'            " Distraction-free writing in Vim.
Plug 'gruvbox-community/gruvbox'    " colorscheme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" practical
Plug 'puremourning/vimspector'    " visual debugger
Plug 'unblevable/quick-scope'     " highlight characters that will jump to the word with f/t/F/T
Plug 'tpope/vim-surround'         " adds ability to surround text with quotes, brackets etc
Plug 'tpope/vim-repeat'           " alows plugin commands to be repeatable 
Plug 'cohama/lexima.vim'          " parentheses autocompletion
Plug 'tpope/vim-commentary'       " comments: gcc -> line, gc[N] comment number of lines
Plug 'bkad/CamelCaseMotion'       " Camel case motion
Plug 'kyazdani42/nvim-tree.lua'   " directory tree view alternative to netrw
Plug 'ggandor/lightspeed.nvim'    " the missing vim motion
Plug 'szw/vim-maximizer'          " maiximize windows in vim
Plug 'sbdchd/neoformat'           " code formatter
Plug 'voldikss/vim-floaterm'      " better terminal than :term
Plug 'AckslD/nvim-neoclip.lua'    " clipboard history
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdown preview 

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Discord rich prersence (very slow)
Plug 'andweeb/presence.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP made user friendly
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" colorscheme onehalfdark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE " Disables background
hi PmenuSel guifg=#fbf1c7
hi SignColumn guibg=NONE ctermbg=NONE

hi DiagnosticUnderlineError guifg=Red guisp=Red gui=undercurl
hi DiagnosticSignError ctermfg=red    ctermbg=NONE guifg=#cc241d guibg=NONE
hi DiagnosticSignWarn  ctermfg=yellow ctermbg=NONE guifg=#fabd2f guibg=NONE
hi DiagnosticSignHint  ctermfg=green  ctermbg=NONE guifg=#b8bb26 guibg=NONE

" nvim-cmp menu colors
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

hi CmpItemAbbrMatch    ctermfg=white  guifg=#a3d5F8

" because of the highlighting in the files
so $HOME/.config/nvim/plugin/signify.vim
let g:signify_priority = 1

" red background for text that goes over the 80 column limit
" highlight OverLength ctermbg=red guibg=#301010
" match OverLength /\%81v.\+/

" set leader key to SPACE
let mapleader = " "

" resource init.vim
nnoremap <nowait><leader>rs :so ~/.config/nvim/init.vim<CR>

" comment with <leader>d
nnoremap <silent><nowait><leader>c :Commentary<CR>
vnoremap <silent><nowait><leader>c :'<,'>Commentary<CR>

" switch to normal mode when in terminal using the escape key instead of ctrl-\ ctrl-n
tnoremap <Esc> <C-\><C-n>

" Open and close Floaterm
nnoremap <silent><F12> :FloatermToggle<CR>
tnoremap <silent><F12> <C-\><C-n>:FloatermToggle<CR>

"This unsets the <last search pattern> register by hitting escape
nnoremap <silent><ESC> :noh<CR>

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Saner behavior of n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" let s:xy_maximizeState=1
" function! ToggleMappings()
"     if s:xy_maximizeState
" 		call feedkeys("\<C-w>_\<C-w>|")
"     else
" 		call feedkeys("\<C-w>=")
"     endif
"     let s:xy_maximizeState = !s:xy_maximizeState
" endfunction
" nnoremap <leader>m :call ToggleMappings()<CR>


" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

let g:camelcasemotion_key = '<leader>'
map <silent><leader>w <Plug>CamelCaseMotion_w
map <silent><leader>b <Plug>CamelCaseMotion_b
map <silent><leader>e <Plug>CamelCaseMotion_e
map <silent><leader>ge <Plug>CamelCaseMotion_ge

" let g:smoothie_speed_constant_factor = 100
let g:smoothie_speed_exponentiation_factor = 0.95
let g:smoothie_speed_linear_factor = 20

