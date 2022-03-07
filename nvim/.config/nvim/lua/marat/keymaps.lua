local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--[[
 COMMANDS     MODES ~
    n         Normal
    v         Visual and Select
    s         Select
    x         Visual
    o         Operator-pending
    i         Insert
    l         Insert, Command-line, Lang-Arg
    c         Command-line
    t         Terminal
]]

-- Normal --
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
keymap("x", "+", "<C-a>", opts)
keymap("x", "-", "<C-x>", opts)
keymap("v", "+", "<C-a>", opts)
keymap("v", "-", "<C-x>", opts)

keymap("n", "M", "<cmd>Man<CR>", opts)

keymap("n", "<F2>", '<cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>', opts);

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "p", "p=`]`]", opts) -- automatically indent correctly on pasting and put cursor after insertet text
keymap("n", "P", "P=`]`]", opts) -- automatically indent correctly on pasting and put cursor after insertet text
-- keymap("n", "p", "]p`]l", opts) -- automatically indent correctly on pasting and put cursor after insertet text
-- keymap("n", "P", "]P`]l", opts) -- automatically indent correctly on pasting and put cursor after insertet text
-- keymap("n", "p", "]p", opts) -- automatically indent correctly on pasting and put cursor after insertet text
-- keymap("n", "P", "]P", opts) -- automatically indent correctly on pasting and put cursor after insertet text

-- This unsets the <last search pattern> register by hitting escape
keymap("n", "<ESC>", ":noh<CR>", opts)
keymap("n", "<leader><CR>", ":noh<CR>", opts)

-- Resize with arrows
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<S-l>", ":bnext<CR>", opts)
--keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("", "<F4>", "<cmd>make!<CR>", opts)
keymap("", "<F5>", "<cmd>wa<CR><cmd>make!<CR>", opts)

-- Insert --
-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "p", '"_dP', opts)
keymap("v", "y", "myy`y", opts) -- move the cursor back when pasting

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<Esc>", "<C-\\><C-n>",       term_opts) -- switch to normal mode when in terminal using the escape key instead of ctrl-\ ctrl-n
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('marat.telescope').get_custom_dropdown())<cr>", opts)
-- keymap("n", "<leader>s", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>", opts)
-- keymap("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
-- keymap("n", "<leader>vrc", '<cmd>lua require("telescope.builtin").find_files(require("marat.telescope").get_custom_dropdown({ prompt_title = "< VimRC >", cwd = "~/.config/nvim", }))<CR>', opts)
-- keymap("n", "<leader>B", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
-- keymap("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({layout_config={ mirror=true, anchor='CENTER' } }))<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files({layout_strategy='center', layout_config = {mirror=false, prompt_position='top'}})<cr>", opts)
-- keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opts)

-- Comment
-- Linewise toggle using <leader>c
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
-- Blockwise toggle using <leader>gb
keymap('x', '<leader>gb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>', opts)

-- Nvimtree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- vimspector
keymap("n", "<leader>dd", "<cmd>call vimspector#Launch()<CR>", {noremap = false})
keymap("n", "<leader>de", "<cmd>call vimspector#Reset()<CR>", {noremap = false})
keymap("n", "<leader>dj", "<Plug>VimspectorStepOver", {noremap = false})
keymap("n", "<leader>dl", "<Plug>VimspectorStepInto", {noremap = false})
keymap("n", "<leader>dk", "<Plug>VimspectorStepOut", {noremap = false})
keymap("n", "<leader>d_", "<Plug>VimspectorRestart", {noremap = false})
keymap("n", "<leader>dn", "<Plug>call vimspector#Continue()<CR>", opts)

keymap("n", "<leader>drc", "<Plug>VimspectorRunToCursor", {noremap = false})
keymap("n", "<leader>db",  "<Plug>VimspectorToggleBreakpoint", {noremap = false})
keymap("n", "<leader>dcb", "<Plug>VimspectorToggleConditionalBreakpoint", {noremap = false})
keymap("n", "<leader>dX",  "<Plug>VimspectorClearBreakpoints", {noremap = false})

keymap("n", "<leader>di", "<Plug>VimspectorBalloonEval", {noremap = false})
keymap("x", "<leader>di", "<Plug>VimspectorBalloonEval", {noremap = false})
--
-- Bufferline
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
keymap("n", "L", ":BufferLineCycleNext<CR>", opts)
keymap("n", "H", ":BufferLineCyclePrev<CR>", opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
keymap("n", "<leader>L", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>H", ":BufferLineMovePrev<CR>", opts)

-- easy align
vim.cmd[[
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
]]

-- Other --
-- Saner behaviour of n and N
vim.cmd [[
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
]]

function Retab(from, to)
	if to == nil then
		to = vim.api.nvim_buf_get_option(0, "shiftwidth")
	end
	vim.cmd('set tabstop=' .. from)
	vim.cmd('set noexpandtab')
	vim.cmd('%retab!')
	vim.cmd('set tabstop=' .. to)
end

