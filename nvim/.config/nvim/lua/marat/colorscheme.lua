vim.g.transparent_background = true

-- gruvbox settings
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_invert_selection = false

-- Available values: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
vim.g.sonokai_style = 'andromeda'

--[[
possible options:
aurora
codemonkey
darkplus
onedarker
spacedark
system76
tomorrow
gruvbox
]]

vim.o.background = "dark"
local colorscheme = "gruvbox"

vim.cmd("colorscheme " .. colorscheme)

if colorscheme == "gruvbox" then
	if vim.g.transparent_background then
    vim.cmd [[
		hi Normal guibg=NONE ctermbg=NONE " Disables background
		hi SignColumn guibg=NONE
		
		hi GitSignsAdd guibg=NONE
		hi GitSignsDelete guibg=NONE
		hi GitSignsChange guifg=#fe8019 guibg=NONE
	]]
	else
    vim.cmd [[
		hi SignColumn guibg=#282828
	]]
	end

    vim.cmd [[
	hi NvimTreeNormal guibg = #3b3735
	hi NvimTreeVertSplit guifg = #3b3735 guibg = #3b3735
	hi NvimTreeEndOfBuffer guibg = #3b3735

	hi StatusLine guifg=#3b3735 guibg=#3b3735
	hi StatusLineNC guifg=#3b3735 guibg=#EBDBB2
	hi StatusLineSeparator guifg=#3b3735
	hi StatusLineTerm guifg=#3b3735
	hi StatusLineTermNC guifg=#3b3735

    hi PmenuSel guifg=#fbf1c7 " set text color of selected item in auto completion menu
	hi CmpItemAbbrMatch    ctermfg=white  guifg=#a3d5F8
    ]]
end

vim.cmd [[
" hi link NvimTreeNormal TabLine
" hi link NvimTreeVertSplit TabLine
" hi link NvimTreeEndOfBuffer TabLine

hi DiagnosticUnderlineError guifg=Red guisp=Red gui=undercurl
hi DiagnosticSignError ctermfg=red    ctermbg=NONE guifg=#cc241d guibg=NONE
hi DiagnosticSignWarn  ctermfg=yellow ctermbg=NONE guifg=#fabd2f guibg=NONE
hi DiagnosticSignHint  ctermfg=green  ctermbg=NONE guifg=#b8bb26 guibg=NONE
hi LspReferenceText gui=none
hi LspReferenceRead gui=none
hi LspReferenceWrite gui=none
]]

