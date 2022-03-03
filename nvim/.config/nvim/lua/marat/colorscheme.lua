vim.g.transparent_background = false

-- gruvbox settings
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_invert_selection = false
vim.g.gruvbox_contrast_dark = 'soft'

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
catppuccin
kanagawa
]]

vim.o.background = "dark"
local colorscheme = "gruvbox"

vim.cmd("colorscheme " .. colorscheme)

if colorscheme == "kanagawa" then
	vim.cmd[[
	" hi TabLine guifg=#7c6f64 guibg=#282828 cterm=underline ctermfg=15 ctermbg=242
	" hi TabLineFill guifg=#7c6f64 guibg=#1d2021 cterm=reverse
	]]
end

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
		" hi SignColumn guibg=#282828
		hi SignColumn guibg=#322302f
		hi GitSignsAdd guibg=#322302f
		hi GitSignsDelete guibg=#322302f
		hi GitSignsChange guifg=#fe8019 guibg=#322302f

		" hi TabLine guifg=#7c6f64 guibg=#282828 cterm=underline ctermfg=15 ctermbg=242
		" hi TabLineFill guifg=#7c6f64 guibg=#1d2021 cterm=reverse
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

	hi TabLineSel guifg=#fabd2f guibg=#3c3836 cterm=bold

	" hi Conceal guifg=#fabd2f

	hi Comment guifg=#a89984

	hi pandocAtxHeader guifg=#fabd2f gui=bold
	" hi pandocAtxStart guifg=#fabd2f gui=NONE
	hi pandocListItemBullet guifg=#fabd2f gui=NONE
	" hi pandocStrong guifg=#8ec07c gui=bold
	hi pandocEmphasis guifg=#d3869b gui=italic
	" hi pandocBlockQuote guifg=#d3869b gui=italic
	" hi pandocNoFormatted guifg=#fb4934

	hi SpellBad gui=none guifg=#fb4934
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

" https://www.reddit.com/r/neovim/comments/sucjll/colorscheme_tip_highlight_special_characters
" hi SpecialKey guifg=#61AFEF
hi SpecialKeyWin guifg=#3B4048
set winhighlight=SpecialKey:SpecialKeyWin
]]

