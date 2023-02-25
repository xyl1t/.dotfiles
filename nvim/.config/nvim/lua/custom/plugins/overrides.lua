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
        show_on_dirs = true,
    },

    view = {
        width = 24,
        hide_root_folder = false,
    },

    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "✗",--"",
        },
    },

    renderer = {
        symlink_destination = false,
        highlight_git = false,
        indent_markers = {
          enable = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "●",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
}


local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

M.alpha = {
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

        -- val = {
        --     "██  ██  ██████████",
        --     "██  ██  ██      ██",
        --     "██  ██  ██  ██████",
        --     "██  ██  ██  ██  ██",
        --     "██████  ██  ██████",
        --     "  ██              ",
        --     "██████  ██  ██  ██",
        --     "██  ██  ██  ██  ██",
        --     "██████████████████",
        -- },

        -- val = {
        --     "     ▄ █▀█ ▄     ",
        --     "     █ ▄▄█ █ █   ",
        --     "   █▄█▄█▄█▄█▄█   ",
        --     " ▄ ▄ ▄ ▄▄▄▄▄▄▄ ▄ ",
        --     " ▄▄▄ ▄ ▄ ▄ ▄ █ █ ",
        --     " █▄█▄█▄█▄█▄█▄█ █ ",
        --     "▄ ▄▄▄ ▄▄▄ ▄ ▄▄▄▄▄",
        --     "█ █▄█▄█▄▄ █ █ ▄▄▄",
        --     "█ ▄▄▄ ▄▄▄ █ █ █▄█",
        --     "█▄█▄█▄▄▄█▄█ █ ▄▄█",
        -- },

        -- val = {
        --     "▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄ ▄",
        --     "█ █ ▄▄▄▄▄ ▄ ▄▄▄▄▄ █ █ █▄█ █",
        --     "█▄█ ▄▄▄▄█▄█ █ ▄▄▄ █▄█ █▄█ █",
        --     "▄█▄▄█▄█ ▄ █▄█ █▄█ ▄█▄▄▄▄█ █",
        --     "█▄█ █▄█ █▄▄▄▄▄▄▄█ █▄█ ▄▄▄▄█",
        -- },

        -- val = {
        --     "       ▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄      ",
        --     "     ▄ █ █ █ ▄▄▄▄▄ ▄ ▄▄▄▄▄ █ █ ▄▄▄    ",
        --     "  ▄▄ █ █ █▄█ ▄▄▄▄█▄█ █ ▄▄▄ █▄█ █▄█ ▄  ",
        --     "  █▄ █ ▄ ▄█▄▄█▄█ ▄ █▄█ █▄█ ▄█▄ █▄█ █  ",
        --     "█▄▄▄▄█▄█ █▄█ █▄█ █▄▄▄▄▄▄▄█ █▄█▄▄▄█ █▄▄█",
        -- },
    },

    buttons = {
        type = "group",
        val = {
            button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
            button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
            button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
            button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
            button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
            button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
        },
        opts = {
            spacing = 1,
        },
    },
}

M.whichkey = {
    spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
    },
}

M.telescope = function()
    return {
        defaults = {
            prompt_prefix = "   ",
            mappings = {
                n = { ["q"] = require("telescope.actions").close },
                i = { ["<ESC>"] = require("telescope.actions").close }
            },
        }
    }
end

M.blankline = {
    use_treesitter = true,
    show_current_context = false,
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
    }
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
