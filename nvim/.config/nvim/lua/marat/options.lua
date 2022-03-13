-- :help options
-- this is extremly slow
-- vim.cmd [[filetype on]]

vim.opt.backup = false             -- creates a backup file
vim.opt.clipboard = "unnamedplus"  -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1              -- do not waste space!! ~~more space in the neovim command line for displaying messages~~
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0           -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"     -- the encoding written to a file
vim.opt.hlsearch = true            -- highlight all matches on previous search pattern
vim.opt.ignorecase = true          -- ignore case in search patterns
vim.opt.mouse = "a"                -- allow the mouse to be used in neovim
vim.opt.pumwidth = 32              -- pop up menu height
vim.opt.pumheight = 16             -- pop up menu height
vim.opt.showmode = false           -- we don't need to see things like -- INSERT -- anymore
vim.o.modeline = false             -- I don't know if I need this, it gives me errors on some files, so I disabled it
vim.opt.showtabline = 2            -- only show tabs when more than 1, option 2 always show tabs
vim.opt.smartcase = true           -- smart case
vim.opt.smartindent = true         -- make indenting smarter again
vim.opt.splitbelow = true          -- force all horizontal splits to go below current window
vim.opt.splitright = true          -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false           -- creates a swapfile
vim.opt.termguicolors = true       -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500           -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true            -- enable persistent undo
vim.opt.updatetime = 300           -- faster completion (4000ms default)
vim.opt.writebackup = false        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.tabstop = 4                -- set tabstops to 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false          -- do not convert spaces into tabs
--vim.opt.shiftwidth = 2             -- the number of spaces inserted for each indentation
--vim.opt.tabstop = 2                -- insert 2 spaces for a tab
vim.opt.cursorline = true          -- highlight the current line
vim.opt.cursorlineopt = "number"   -- possible values: "line", "number", "both", for more see ':h culopt'
vim.opt.number = true              -- set numbered lines
vim.opt.relativenumber = true      -- set relative numbered lines
vim.opt.numberwidth = 2            -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"         -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false               -- display lines as one long line
vim.opt.scrolloff = 8              -- is one of my fav
vim.opt.sidescrolloff = 16
-- vim.opt.guifont = "Cousine Nerd Font Mono" -- the font used in graphical neovim applications
vim.opt.guifont = "CozetteVector:h12" -- the font used in graphical neovim applications
vim.opt.list = true
vim.opt.listchars = {tab = '  ', extends = '>', precedes = '<', nbsp = '␣', trail = '·'}
vim.opt.pumheight=16
vim.opt.pumblend=16
vim.opt.shortmess:append "c"
vim.opt.foldlevelstart=20

vim.g.netrw_banner=0               -- disable netrw banner
vim.g.netrw_liststyle=3            -- display netrw as tree
vim.g.do_filetype_lua = true       -- use the new lua implementation of filetype

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd "set fcs=eob:\\ "
vim.cmd [[autocmd BufNewFile,BufRead * setlocal formatoptions-=co]]

-- highlight 80
-- vim.cmd [[highlight ColorColumn gui=inverse cterm=inverse]]
vim.cmd [[autocmd FileType cpp,c,javascript,java,sql call matchadd('ColorColumn', '\%81v', 100)]]
vim.cmd [[autocmd FileType cpp,c set makeprg=make\ -C\ ./build\ -j9]]

-- highlight yanked text for 200ms
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- in case you use the vim-highlightedyank plugin
vim.g.highlightedyank_highlight_duration = 200

-- limit text width to 80 columns on text files
vim.cmd[[
augroup my_textwidth
au!
autocmd FileType text,markdown,tex setlocal textwidth=79
augroup END
]]

-- neovide settings
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_density=10.0
vim.g.neovide_cursor_vfx_particle_lifetime=1.2
vim.g.neovide_cursor_trail_length = 0.05
vim.g.neovide_cursor_animation_length=0.05


vim.g.highlightedyank_highlight_duration = 200

vim.cmd[[set makeprg=make\ -C\ ../build\ -j8]]

