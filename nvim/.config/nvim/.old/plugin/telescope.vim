lua << EOF
local actions = require("telescope.actions")
require('telescope').setup{

  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close,
      }
    },
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}
require('telescope').load_extension('neoclip')
require('neoclip').setup()
EOF


nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({layout_strategy='flex'})<CR>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({layout_strategy='flex'})<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({layout_strategy='flex'})<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({layout_strategy='flex'})<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags({layout_strategy='flex'})<CR>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols({layout_strategy='flex'})<CR>
nnoremap <leader>vrc <cmd>lua require("telescope.builtin").find_files({ prompt_title = "< VimRC >", cwd = "~/.config/nvim", })<CR>
nnoremap <leader>fc <cmd>Telescope neoclip<CR>

