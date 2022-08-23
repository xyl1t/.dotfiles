local M = {}

M.custom = {
    n = {
        ["J"] = { "5gj", "5 lines down"},
        -- ["gJ"] = { "J", "Merge lines"},
        ["gj"] = { "J", "Merge lines"},
        ["K"] = { "5gk", "5 lines up"},
        ["+"] = { "<C-a>", "Increment" },
        ["-"] = { "<C-x>", "Decrement" },
        ["<space><space>"] = { "i la h", "Surround with sapce" },
        ["<F4>"] = { "<cmd>wa<CR><cmd>make!<CR>", "Save all and build" },
        ["<F5>"] = { "<cmd>make!<CR>", "Build" },
        ["yp"] = { 'my"yyy"yP`y', "Copy up" },
        ["<leader>p"] = { 'my"yyy"yP`y', "Copy up" },
        ["yP"] = { 'my"yyy"yp`y', "Copy down" },
        ["<leader>P"] = { 'my"yyy"yp`y', "Copy down" },
    },

    x = {
        ["<leader>p"] = { function()
            local currentMode = vim.fn.mode()
            if currentMode == "v" then
                print("visual")
                vim.cmd[[:norm V"yy"yPgvv]]
            elseif currentMode == "V" then
                print("line visual")
                vim.cmd[[:norm "yy"yPgv]]
            else
                vim.cmd[[:norm V"yy"yPgv]]
            end
        end, "Copy up" },
        ["<leader>P"] = { function()
            local currentMode = vim.fn.mode()
            if currentMode == "v" then
                print("visual")
                vim.cmd[[:norm V"yy`]"ypgvv]]
            elseif currentMode == "V" then
                print("line visual")
                vim.cmd[[:norm "yy`]"ypgv]]
            else
                vim.cmd[[:norm V"yy`]"ypgv]]
            end
        end, "Copy down" },
        ["<"] = { "<gv", "" },
        [">"] = { ">gv", "" },
        ["J"] = { ":move '>+1<CR>gv=gv", "" },
        ["K"] = { ":move '<-2<CR>gv=gv", "" },
    },
}

M.lsp = {
    n = {
        -- ["<leader>j"] = {"<CMD>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic"},
        -- ["<leader>k"] = {"<CMD>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic"},
        ["<leader>j"] = {"<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic"},
        ["<leader>k"] = {"<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev diagnostic"},
        ["<leader>lf"] = {"<cmd>Lspsaga lsp_finder<CR>", "Finder"},
        ["<leader>lr"] = {"<cmd>Lspsaga rename<CR>", "Rename"},
        ["<leader>lp"] = {"<cmd>Lspsaga preview_definition<CR>", "Preview definition"},
        ["<leader>ld"] = {"<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor diagnostics"},
        ["<leader>lk"] = {"<cmd>Lspsaga hover_doc<CR>", "Documentation"},
        ["<leader>ls"] = {"<Cmd>Lspsaga signature_help<CR>", "Signature help"},
        ["<leader>la"] = {"<Cmd>Lspsaga code_action<CR>", "Code action"},
    }
}

M.git = {
    n = {
		["<leader>gj"] = { function() require 'gitsigns'.next_hunk() end, "Next Hunk" },
		["<leader>gk"] = { function() require 'gitsigns'.prev_hunk() end, "Prev Hunk" },
		["<leader>gl"] = { function() require 'gitsigns'.blame_line() end, "Blame" },
		["<leader>gp"] = { function() require 'gitsigns'.preview_hunk() end, "Preview Hunk" },
		["<leader>gr"] = { function() require 'gitsigns'.reset_hunk() end, "Reset Hunk" },
		["<leader>gR"] = { function() require 'gitsigns'.reset_buffer() end, "Reset Buffer" },
		["<leader>gs"] = { function() require 'gitsigns'.stage_hunk() end, "Stage Hunk" },
		["<leader>gu"] = { function() require 'gitsigns'.undo_stage_hunk() end, "Undo Stage Hunk" },
		["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		["<leader>gd"] = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    }
}

M.easyAlign = {
    n = {
        ["ga"] = { "<Plug>(EasyAlign)", "Align" }
    },
    x = {
        ["ga"] = { "<Plug>(EasyAlign)", "Align" }
    }
}

return M
