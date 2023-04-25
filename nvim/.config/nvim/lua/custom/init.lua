vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.list = true
vim.opt.listchars = {tab = '  ', extends = '>', precedes = '<', nbsp = '␣', trail = '·'}
vim.opt.textwidth = 79
vim.opt.colorcolumn = "+1"
vim.opt.inccommand = "split"
vim.opt.wrap = false

vim.g.maplocalleader = ","
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    build_dir = "./out"
}

-- make cursor always white
vim.cmd[[
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
]]

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = '150' })
  end
})


-- disable incorrect indentation for swift files
vim.cmd[[autocmd FileType tex set wrap]]

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


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx" },
    command = "setlocal tabstop=2 shiftwidth=2",
})

