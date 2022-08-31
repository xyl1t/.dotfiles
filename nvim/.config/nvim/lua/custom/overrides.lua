local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "yaml",
        "http",
        "markdown",
        "c",
        "cpp",
        "rust",
        "bash",
        "lua",
    },
    indent = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

M.nvimtree = {
    git = {
        enable = true,
    },

    view = {
        width = 24,
    },

    renderer = {
        symlink_destination = false,
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

M.alpha = function()
    -- local colors = require("base46").get_theme_tb "base_30"
    -- vim.api.nvim_set_hl(0, "AlphaHeader", {fg = colors.sun})

    return {
        header = {
            val = {
                "           ▄ ▄                    ",
                "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄      ",
                "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █      ",
                "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █      ",
                "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ",
                "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄ ",
                "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █ ",
                "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █ ",
                "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█     ",
            },
        },
    }
end

M.whichkey = function()
    return {
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    }
end

M.telescope = function()
    return {
        defaults = {
            -- prompt_prefix = "",
            mappings = {
                n = { ["q"] = require("telescope.actions").close },
                i = { ["<ESC>"] = require("telescope.actions").close }
            }
        }
    }
end

M.blankline = {
    -- use_treesitter = true,
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "norg",
        "mason.nvim",
        "",
    },
}

M.gitsigns = {
    signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" }, -- 
        topdelete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" }, -- ‾
        changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- C/C++
        "clangd",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
    },
}


M.ui = {
    statusline = {
        separator_style = {
            right = "█▓▒░",
            left = "░▒▓█",
        },
    },
}

return M
