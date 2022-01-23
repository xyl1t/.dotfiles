-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

vim.cmd "hi QuickScopePrimary guifg='#00FFFF' gui=underline ctermfg=155 cterm=underline"
vim.cmd "hi QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline"

