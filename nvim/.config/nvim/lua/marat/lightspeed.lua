-- vim.cmd[[
-- 	noremap ; ;
-- 	noremap , ,
-- ]]
--

vim.g.lightspeed_no_default_keymaps = 1;

vim.cmd[[nmap s <Plug>Lightspeed_omni_s]]
vim.cmd[[xmap s <Plug>Lightspeed_omni_s]]
vim.cmd[[omap x <Plug>Lightspeed_omni_s]]

