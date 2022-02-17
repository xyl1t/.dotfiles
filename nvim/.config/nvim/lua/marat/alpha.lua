local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("alpha not installed")
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- [[           ▗▖█  ▄          ▗▖█    ▗▖▄▗▖            ]],
	-- [[ ▗▄▄▖▄▗▄▄▖▄▐▌█ ▄ ▄▗▄▄▖▄▄▄▖▄▐▌█ ▗▄▄▐▌█▐▌ ▗▄▄ ▗▖▄▗▖ ▄]],
	-- [[▄▟▙▟▙█▄▄▟▌█▟▌█ █ █▟▙▟▙▄▄▟▌█▟▌█ ▐▙█▟▙█▐▌▄▟▙█▄▟▙█▟▙▄█]],
	-- [[█   ▄ ▄  ▄█    █▄█      ▗▄█            █          ▄]],

	-- [[              ▄ █  ▄            ▄ █     ▄ ▄ ▄              ]],
	-- [[  ▄▄▄ ▄ ▄▄▄ ▄ █ █ ▄ ▄ ▄▄▄ ▄▄▄ ▄ █ █ ▄▄▄ █ █ █   ▄▄▄ ▗▖▄▗▖ ▄]],
	-- [[▄▄█▄█▄█▄▄▄█ █▄█ █ █ █▄█▄█▄▄▄█ █▄█ █ █▄█▄█▄█ █ ▄▄█▄█▄▟▙█▟▙▄█]],
	-- [[█    ▄ ▄  ▄▄█     █▄█       ▄▄█               █           ▄]],

	-- [[           ▄ ▄                     ]],
	-- [[       ▄   ▄▄▄ ▄▄▄▄ ▄ ▄▄▄ █ ▄      ]],
	-- [[       █ ▄ █▄█  ▄▄▄ █ █▄█ █ █      ]],
	-- [[     █ █▄█▄▄▄█ ▄█▄█▄█▄▄█▄▄█ █      ]],
	-- [[     █▄█ ▄ ▄▄▄ █ ▄▄▄▄▄▄▄▄▄▄ ▄ ▄ ▄  ]],
	-- [[  ▄ ▄▄▄ ▄▄▄ ▄ ▄ ▄▄▄▄▄ ▄ ▄▄▄ ▄▄▄ █ ▄]],
	-- [[  █ ▄▄▄ █▄█ █ █ ▄▄▄   █ ▄▄▄ █▄█ █ █]],
	-- [[█ █▄█▄█▄▄█▄▄█ █ █▄█ █ █ █▄█▄▄▄█▄█ █]],
	-- [[█▄█ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄█ █▄█ ▄▄█ ▄▄▄▄▄▄▄]],

	[[           ▄ ▄                    ]],
	[[       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ]],
	[[       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ]],
	[[    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ]],
	[[  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ]],
	[[  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄]],
	[[▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █]],
	[[█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █]],
	[[    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ]],

-- [[      ▄   ▄ ▄      ▄ ▄▄▄ ▄ ▄     ]],
-- [[      █ ▄ ▄▄▄  ▄▄▄ █ █▄█ █ █     ]],
-- [[    █ █▄█▄█▄█ ▄█▄█▄█▄▄█▄▄█ █     ]],
-- [[    █▄█ ▄ ▄▄▄ █ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ]],
-- [[  █ ▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄]],
-- [[  █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █]],
-- [[█ █▄█ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█ █ █]],
-- [[█▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█▄█ █]],


	-- [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
    dashboard.button("SPC f", "  Find file"),--, "<cmd>lua require'telescope.builtin'.>
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("p", "  Find project", ":Telescope projects <R>"),
	dashboard.button("r", "  Recently used files", "<cmd>lua require'telescope.builtin'.oldfiles(require('marat.telescope').get_custom_dropdown())<cr>"),
    dashboard.button("s", "  Open last session", "<cmd>RestoreSession<cr><cr>"),
    dashboard.button("SPC F", "  Find text"),--, "<cmd>Telescope live_grep theme=ivy<c>
    dashboard.button("SPC v", "  Configuration"),--, '<cmd>lua require("telescope.buil>
    dashboard.button("SPC q", "  Quit Neovim"),--, ":qa<CR>"),
}

local function footer()
	-- local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
	-- local date = thingy:read("*a")
	-- thingy:close()
	-- return "Reject VSCode\t\t\t" .. date

	return "#RejectVSCode_ExceptWhenYouHaveToUseADebugger"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Include"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

