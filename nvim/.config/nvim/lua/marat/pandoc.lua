vim.cmd [[
let g:pandoc#modules#disabled = ["formatting"]
" let g:pandoc#syntax#codeblocks#embeds#langs = [ 'js', 'html', 'css', 'bash', 'vim', 'c', 'cpp' ]
let g:pandoc#syntax#codeblocks#embeds#langs = [ 'c', 'cpp', 'bash', 'js', 'html', 'css' ]

" let g:pandoc#syntax#conceal#cchar_overrides = {
" 	\ "atx" : "*",
" 	\ "codelang": "```"}

let g:pandoc#syntax#conceal#blacklist = [
	\ "atx",
	\ "codeblock_start",
	\ "codeblock_delim" ]
]]

