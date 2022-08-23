-- vim.cmd[[
-- 	noremap ; ;
-- 	noremap , ,
-- ]]
--

vim.g.lightspeed_no_default_keymaps = 1;

vim.cmd[[nmap <C-s> <Plug>Lightspeed_omni_s]]
vim.cmd[[xmap <C-s> <Plug>Lightspeed_omni_s]]
vim.cmd[[omap x <Plug>Lightspeed_omni_s]]

require'lightspeed'.setup {
	safe_labels = { "f", "n", "u", "t", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z"},
	exit_after_idle_msecs = { labeled = 1000, unlabeled = 1000 },
}
