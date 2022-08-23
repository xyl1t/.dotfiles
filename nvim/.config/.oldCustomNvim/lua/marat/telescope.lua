local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("telescope not installed")
	return
end

telescope.load_extension('media_files')
telescope.load_extension('fzf')

local actions = require "telescope.actions"

telescope.setup {
	defaults = {

		-- prompt_prefix = " ",
		-- selection_caret = " ",
		path_display = { "smart" },

		borderchars = {
			{ "─", "│", "─", "│", '┌', '┐', '┘', '└' },
			prompt  = { "─", "│", "─", "│", '┌', '┐', '┘', '└' },
			results = { "─", "│", "─", "│", '┌', '┐', '┘', '└' },
			preview = { "─", "│", "─", "│", '┌', '┐', '┘', '└' },
		},

		mappings = {
			i = {
				["<C-n>"]  = actions.cycle_history_next,
				["<C-p>"]  = actions.cycle_history_prev,
				["<Down>"] = actions.move_selection_next,
				["<Up>"]   = actions.move_selection_previous,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<esc>"] = actions.close,

				["<CR>"]  = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"]   = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"]   = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"]   = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"]   = actions.complete_tag,
				["<C-h>"]   = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"]  = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"]   = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"]   = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"]   = actions.move_selection_previous,
				["gg"]     = actions.move_to_top,
				["G"]      = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"]   = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},

	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--	 picker_config_key = value,
		--	 ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = {"png", "jpg", "jpeg", "webm", "bmp"},
			find_cmd = "rg" -- find command (defaults to `fd`)
		},
		fzf = {
			fuzzy = true,                    -- false -> will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
		-- Your extension configuration goes here:
		-- extension_name = {
		--	 extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
}

local M = {}

M.get_custom_dropdown = function(opt)
	opt = opt or {}

	local theme_opts = {
		theme = "dropdown",

		sorting_strategy = "ascending",
		layout_strategy = "vertical",

		-- prompt_title = "",
		results_title = "",
		preview_title = "",

		layout_config = {
			mirror = true,
			preview_cutoff = 1, -- Preview should always show (unless previewer = false)

			width = function(_, max_columns, _)
				return math.min(max_columns, 80)
			end,

			prompt_position = "top",

			height = function(_, _, max_lines)
				return math.min(max_lines, 48)
			end,
		},
	}
	return vim.tbl_deep_extend("force", theme_opts, opt)
end

return M
