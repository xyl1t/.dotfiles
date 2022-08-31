vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.list = true
vim.opt.listchars = {tab = '  ', extends = '>', precedes = '<', nbsp = '␣', trail = '·'}

-- make cursor always white
vim.cmd[[
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
]]

-- highlight yanked text for 200ms
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="Visual", timeout=150}
augroup END
]]

-- disable incorrect indentation for swift files
vim.cmd[[autocmd FileType swift set nosi nocindent ai]]

-- disable adding comment on new line
vim.cmd[[autocmd BufEnter * setlocal formatoptions-=o]]

-- Removes trailing spaces
vim.cmd[[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
map <F2> :TrimWhitespace<CR>
map! <F2> :TrimWhiteSpace<CR>
]]

