--[[
Other cool plugins:
sindrets/diffview.nvim
karb94/neoscroll.nvim
anuvyklack/windows.nvim
--]]

local overrides = require "custom.plugins.overrides"

return {
    ["christoomey/vim-tmux-navigator"] = { },

    -- ["neoclide/vim-jsx-improve"] = { },

    ["anuvyklack/middleclass"] = {},
    ["anuvyklack/animation.nvim"] = {},
    ["anuvyklack/windows.nvim"] = {
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },

    ["andweeb/presence.nvim"] = {},

    ["folke/todo-comments.nvim"] = {
        config = function()
            require('todo-comments').setup{}
        end
    },

    ["lervag/vimtex"] = {
        config = function()
        end
    },

    -- ["karb94/neoscroll.nvim"] = {
    --     config = function()
    --         require('neoscroll').setup({
    --             mappings = {}
    --         })
    --
    --         local t = {}
    --         -- Syntax: t[keys] = {function, {function arguments}}
    --         t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '50'}}
    --         t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '50'}}
    --         t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '50'}}
    --         t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50'}}
    --         -- t['<C-y>'] = {'scroll', {'-0.10', 'false', '10'}}
    --         -- t['<C-e>'] = {'scroll', { '0.10', 'false', '10'}}
    --         t['zt']    = {'zt', {'50'}}
    --         t['zz']    = {'zz', {'50'}}
    --         t['zb']    = {'zb', {'50'}}
    --
    --         require('neoscroll.config').set_mappings(t)
    --     end
    -- },

    -- ['gen740/SmoothCursor.nvim'] = {
    --     config = function()
    --         require('smoothcursor').setup()
    --     end
    -- },

    -- format & linting
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end,
    },

    ["iamcco/markdown-preview.nvim"] = {
        run = function() vim.fn["mkdp#util#install"]() end,
    },

    ['winston0410/cmd-parser.nvim'] = {},
    ['winston0410/range-highlight.nvim'] = {
        config = function() require'range-highlight'.setup{} end
    },

    -- ["mjbrownie/swapit"] = {},

    ["glepnir/lspsaga.nvim"] = {
        branch = 'main',
        config = function()
            require('lspsaga').setup({})
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

    ["kylechui/nvim-surround"] = {
        config = function()
            require("nvim-surround").setup({ })
        end
    },

    ["junegunn/vim-easy-align"] = { },

    ["neovim/nvim-lspconfig"] = {
        config = function()
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

    ["simrat39/rust-tools.nvim"] = {
        after = "nvim-lspconfig",
    },

    -- overrides --

    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter,
    },
    ["nvim-tree/nvim-tree.lua"] = {
        override_options = overrides.nvimtree,
    },
    ["goolord/alpha-nvim"] = {
        disable = false,
        override_options = overrides.alpha,
    },
    ["folke/which-key.nvim"] = {
        disable = false,
        keys = nil,
        override_options = overrides.whichkey,
    },
    ["nvim-telescope/telescope.nvim"] = {
        override_options = overrides.telescope,
    },
    ["NvChad/ui"] = {
        override_options = overrides.ui,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        override_options = overrides.blankline,
    },
    ["lewis6991/gitsigns.nvim"] = {
        override_options = overrides.gitsigns,
    },
    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason,
    },
}

