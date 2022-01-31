local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Treesitter not installed. What neovim version are you on??")
	return
end

configs.setup {
	ensure_installed = {"bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "fish", "glsl", "go", "html", "http", "java", "javascript", "jsonc", "kotlin", "latex", "lua", "make", "markdown", "php", "python", "regex", "rust", "ruby", "scss", "svelte", "tsx", "typescript", "vim", "vue", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml", "c", "cpp", "java" } },
	autotag = {
		enable = true,
		filetypes = { 'xml', 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue' }
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}

