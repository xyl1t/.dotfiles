vim.cmd [[
let g:pandoc#modules#disabled = ["formatting"]
" let g:pandoc#syntax#codeblocks#embeds#langs = [ 'js', 'html', 'css', 'bash', 'vim', 'c', 'cpp' ]
let g:pandoc#syntax#codeblocks#embeds#langs = [ 'c', 'cpp', 'bash', 'js', 'html', 'css' ]

let g:pandoc#syntax#conceal#cchar_overrides = {
	\'footnote': '*'}
	" \ "codelang": "—",
	" \ "codeend": "—"}

" let g:pandoc#syntax#conceal#use = 0

let g:pandoc#syntax#conceal#blacklist = [
	\ "atx",
	\ "ellipses",
	\ "emdashes",
	\ "dashes",
	\ "codeblock_start",
	\ "codeblock_delim" ]
]]


-- \ "titleblock",
-- \ "image",
-- \ "block",
-- \ "subscript",
-- \ "superscript",
-- \ "strikeout",
-- \ "atx",
-- \ "codeblock_start",
-- \ "codeblock_delim",
-- \ "footnote",
-- \ "definition",
-- \ "list",
-- \ "newline",
-- \ "dashes",
-- \ "ellipses",
-- \ "quotes",
-- \ "inlinecode" ]
