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
vim.opt.colorcolumn = 80

-- highlight yanked text for 200ms
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]]

-- disable incorrect indentation for swift files
vim.cmd[[autocmd FileType swift set nosi nocindent ai]]

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

-- vim.cmd [[
-- highlight OverLength ctermbg=red ctermfg=white guibg=#592929
-- match OverLength /\%81v./
-- ]]

