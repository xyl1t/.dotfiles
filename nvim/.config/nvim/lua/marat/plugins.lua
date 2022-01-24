local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local packer = require("packer")

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup{function(use)

	-- My plugins here ----------------------------------------------------------
	-- Highlight current word under cursor with lsp: https://github.com/RRethy/vim-illuminate

	-- (always) keep these
	use "wbthomason/packer.nvim"                     -- Have packer manage itself
	use "nvim-lua/popup.nvim"                        -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim"                      -- Useful lua functions used by lots of plugins

	-- use "ThePrimeagen/vim-be-good"

	-- visual sugar
	use "ap/vim-css-color"                           -- a very fast, multi-syntax context-sensitive color name highlighter alternative: https://github.com/norcalli/nvim-colorizer.lua
	use {"junegunn/goyo.vim", cmd = "Goyo"}          -- Distraction-free writing in Vim.
	use "kyazdani42/nvim-web-devicons"               -- icons
	use "psliwka/vim-smoothie"                       -- smooth scrolling
	use "folke/which-key.nvim"                       -- shows which keys are available
	-- use {"rcarriga/nvim-notify", config = function() vim.notify = require("notify") end} -- shows notifications like a true gui, kinda slows down stuff when lots of them
	-- use "itchyny/vim-highlighturl"   -- highlight url
	-- use "lukas-reineke/indent-blankline.nvim"
	-- use {'edluffy/specs.nvim', config = function() require('specs').setup() end}
	-- https://github.com/petertriho/nvim-scrollbar -- cool scrollbar that also shows diagnostics

	-- colorscheme
	use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	-- use "mhdahmad/gruvbox.nvim"
	use {"sainnhe/sonokai", cmd = "colorscheme"}
	use {"lunarVim/colorschemes", cmd = "colorscheme"}
	use {"catppuccin/nvim", as = "catppuccin"}
	-- use "lifepillar/vim-gruvbox8"
	-- https://github.com/sainnhe/everforest

	-- practical
	use "tpope/vim-surround"                         -- adds ability to surround text with quotes, brackets etc
	use "tpope/vim-repeat"                           -- alows plugin commands to be repeatable
	-- use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup{} end } -- parentheses autocompletion
	use "windwp/nvim-autopairs"                      -- parentheses autocompletion
	-- use "cohama/lexima.vim"
	use "numToStr/Comment.nvim"                      -- comments: gcc -> line, gc[N] comment number of lines
	use "nvim-lualine/lualine.nvim"                  -- cool statusbar
	use {"sbdchd/neoformat", cmd = "Neoformat"}                           -- code formatter
	use "b0o/SchemaStore.nvim"                       -- json schemas for lsp
	use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"} -- Markdown previewr
	use "kyazdani42/nvim-tree.lua"                   -- directory tree like netrw but better
	use "andweeb/presence.nvim"                      -- Discord richt presence
	use "unblevable/quick-scope"                     -- highlight characters that will jump to the word with f/t/F/T
	-- use {"ggandor/lightspeed.nvim", after="quick-scope"} -- the missing vim motion
	use "akinsho/toggleterm.nvim"                  -- better terminal
	use "szw/vim-maximizer"                          -- maximize a window
	use "puremourning/vimspector"                    -- visual debugger
	use "akinsho/bufferline.nvim"                    -- A buffer line for Neovim made with lua
	use "moll/vim-bbye"                              -- Better buffer closing
	use "lewis6991/impatient.nvim"                   -- speed up neovim startup
	use "goolord/alpha-nvim"                         -- alpha is a fast and fully customizable greeter for neovim
	use "junegunn/vim-easy-align"                    -- align text (for example markdown tables)
	use 'kevinhwang91/nvim-bqf'                      -- better quickfix windows (preview)
	-- use {"junegunn/fzf", run = function() vim.fn["fzf#install"]() end }
	-- use "junegunn/fzf.vim"                           -- fzf for vim
	-- use "MunifTanjim/nui.nvim"                       -- ui library
	use "stevearc/dressing.nvim"                     -- better ui for select and input
	use "simrat39/symbols-outline.nvim"              -- symbols tree
	-- use "liuchengxu/vista.vim"
	use "rmagatti/auto-session"                      -- automatically open buffers and windows on startup
	use "vim-pandoc/vim-pandoc"                      -- pandoc commands for vim (mostly used with markdown)
	use 'rwxrob/vim-pandoc-syntax-simple'            -- stripped down version of pandoc syntax, very good for WYSIWYG
	use 'weilbith/nvim-code-action-menu'

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use "nvim-telescope/telescope-media-files.nvim"

	-- Treesitter
	use "nvim-treesitter/nvim-treesitter"            -- https://github.com/nvim-treesitter/nvim-treesitter/issues/2295
	use "windwp/nvim-ts-autotag"                     -- auto tag for xml/html
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp"                           -- The completion plugin
	use "hrsh7th/cmp-buffer"                         -- buffer completions
	use "hrsh7th/cmp-path"                           -- path completions
	use "hrsh7th/cmp-cmdline"                        -- cmdline completions
	use "saadparwaiz1/cmp_luasnip"                   -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/LuaSnip"                           --snippet engine
	use "rafamadriz/friendly-snippets"               -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig"                      -- enable LSP
	use "williamboman/nvim-lsp-installer"            -- simple to use language server installer
	-- use "RishabhRD/popfix"                           -- LSP made user friendly
	-- use "RishabhRD/nvim-lsputils"                    -- LSP made user friendly
	-- use "tjdevries/astronauta.nvim"
	-- use "RishabhRD/lspactions"

	-- My plugins here -----------------------------------------------------------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
	require("packer").sync()
	end
end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config").."/lua/packer_compiled.lua"
  }
}

