local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("lualine not installed")
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = "✘ ", warn = " " },
	colored = true,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = {function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	-- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local chars = { "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end,
-- color = { fg = "gray", bg = "white" }
}
local spaces = function()
	local tabsOrSpaces = "tabs: "
	if not vim.opt.expandtab then
		tabsOrSpaces = "spaces: "
	end

	return tabsOrSpaces .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'powerline',
		-- component_separators = { left = '|', right = '|'},
		-- section_separators = "",
		-- section_separators = { left = '', right = ''},
		section_separators = { left = '▓▒░', right = '░▒▓'},
		component_separators = { left = '|', right = '|'},
		disabled_filetypes = {"dashboard", "NvimTree", "Outline"},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'diagnostics', branch},
		lualine_c = {'path', 'filename'},
		lualine_x = {'diff', 'encoding', 'filetype'},
		lualine_y = {'progress', progress},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

