
--[[

TODO:
  - Add lspsaga
    https://github.com/glepnir/lspsaga.nvim

--]]

local M = {}

local overrides = require "custom.overrides"

M.mappings = require "custom.mappings"

M.plugins = {
    user = {
        ["christoomey/vim-tmux-navigator"] = { },

        ["iamcco/markdown-preview.nvim"] = {
            run = function() vim.fn["mkdp#util#install"]() end,
        },

        ["mjbrownie/swapit"] = {},

        ["glepnir/lspsaga.nvim"] = {
            branch = 'main',
            config = function()
                local saga = require("lspsaga")

                saga.init_lsp_saga({
                    -- your configuration
                })
            end
        },

        -- better matcher
        ["wellle/targets.vim"] = {
            -- keys = "%"
            config = function()
                vim.cmd[[
                let g:targets_aiAI = 'aIAi'
                ]]
            end
        },
        ["goolord/alpha-nvim"] = {
            disable = false,
        },
        ["folke/which-key.nvim"] = {
            disable = false,
            -- keys = {"<leader>", "'", '"', "`", "@"},
            keys = nil,
            -- config = function()
            --     require'which-key'.setup {
            --         spelling = {
            --             enabled = true,
            --             suggestions = 10,
            --         },
            --     }
            -- end
        },

        ["kylechui/nvim-surround"] = {
            config = function()
                require("nvim-surround").setup({ })
            end
        },

        ["junegunn/vim-easy-align"] = { },

        ["neovim/nvim-lspconfig"] = {
            config = function()
                require "plugins.configs.lspconfig"
                require "custom.plugins.lspconfig"
            end,
        },

        -- autoclose tags in html, jsx etc
        ["windwp/nvim-ts-autotag"] = {
            ft = { "html", "javascriptreact" },
            after = "nvim-treesitter",
            config = function()
                require("custom.plugins.smallConfigs").autotag()
            end,
        },
    },

    override = {
        ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
        ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
        ["goolord/alpha-nvim"] = overrides.alpha,
        ["folke/which-key"] = overrides.whichkey,
        ["nvim-telescope/telescope.nvim"] = overrides.telescope,
        ["NvChad/ui"] = overrides.ui,
        ["lukas-reineke/indent-blankline.nvim"] = overrides.blankline,
        ["lewis6991/gitsigns.nvim"] = overrides.gitsigns,
        ["williamboman/mason.nvim"] = overrides.mason,
    }
}

M.ui = {
    theme = "gruvbox",
    theme_toggle = { "gruvbox", "gruvbox_light" },
    hl_override = {
        Comment = { italic = true },
        DiffAdd = { fg = "yellow" },
        AlphaHeader = { fg = "sun", },
    },
}


return M

