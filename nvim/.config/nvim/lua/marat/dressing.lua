local status_ok, dressing = pcall(require, "dressing")
if not status_ok then return end;

dressing.setup({
	input = {
		-- Default prompt string
		default_prompt = "> ",

		-- When true, <Esc> will close the modal
		insert_only = true,

		-- These are passed to nvim_open_win
		anchor = "NW",
		relative = "cursor",
		row = -1,
		col = -1,
		border = "single",

		-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		prefer_width = 32,
		max_width = nil,
		min_width = 1,

		-- Window transparency (0-100)
		winblend = 10,
		-- Change default highlight groups (see :help winhl)
		winhighlight = "",

		-- see :help dressing_get_config
		get_config = nil,
	},
	select = {
		-- Priority list of preferred vim.select implementations
		backend = { "nui", "builtin", "telescope", "fzf", },

		-- Options for telescope selector
		telescope = {
			-- can be 'dropdown', 'cursor', or 'ivy'
			theme = "cursor",

		},

		-- Options for fzf selector
		fzf = {
			window = {
				width = 0.5,
				height = 0.4,
			},
			relative = "cursor"
		},

		-- Options for nui Menu
		nui = {
			-- position = "50%",
			-- size = nil,
			-- relative = "editor",
			relative = "cursor",
			position = {
				row = 1,
				col = 0,
			},
			border = {
				style = "single",
			},
			max_width = 80,
			max_height = 40,
		},

		-- Options for built-in selector
		builtin = {
			-- These are passed to nvim_open_win
			anchor = "NW",
			relative = "cursor",
			row = 1,
			col = -1,
			border = "single",

			-- Window transparency (0-100)
			winblend = 20,
			-- Change default highlight groups (see :help winhl)
			winhighlight = "",

			-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			width = nil,
			max_width = 0.8,
			min_width = 1,
			height = nil,
			max_height = 0.9,
			min_height = 1,
		},

		-- Used to override format_item. See :help dressing-format
		format_item_override = {},

		-- see :help dressing_get_config
		get_config = nil,
	},
})

