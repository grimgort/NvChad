local present, telescope = pcall(require, "telescope")
if not present then
   return
end

  local actions = require("telescope.actions")
telescope.setup {
  pickers = {
        buffers = {
          sort_mru = true,
            --[[ ignore_current_buffer = true,
            sort_lastused = true, ]]
        },
  },
   defaults = {
     history = {

     },
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.45,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.99,
         height = 0.80,
         -- preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      -- path_display = { "shorten" },
      path_display = {  truncate = 4  },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
  i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<S-j>"] = require('telescope.actions').cycle_history_next,
      ["<S-k>"] = require('telescope.actions').cycle_history_prev,
      ["²"] = actions.close,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<A-k>"] = actions.preview_scrolling_up,
      ["<A-j>"] = actions.preview_scrolling_down,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-l>"] = actions.complete_tag,
      ["<C-?>"] = actions.which_key, -- keys from pressing <C-/>
    },
    n = {
      ["<esc>"] = actions.close,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,
      ["<S-j>"] = require('telescope.actions').cycle_history_next,
      ["<S-k>"] = require('telescope.actions').cycle_history_prev,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      -- TODO: This would be weird if we switch the ordering.
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["H"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["L"] = actions.move_to_bottom,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["?"] = actions.which_key,
    },


      }
   },
   extensions = {
      fzf = {
         fuzzy = true, -- false will only do exact matching
         override_generic_sorter = false, -- override the generic sorter
         override_file_sorter = true, -- override the file sorter
         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
         -- the default case_mode is "smart_case"
      },
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
         find_cmd = "rg", -- find command (defaults to `fd`)
      }
    },
 
}

local extensions = { "themes", "terms", "fzf" }
-- local extensions = { "themes", "terms", "fzf","projects" }
local packer_repos = [["extensions", "telescope-fzf-native.nvim"]]
if vim.fn.executable "ueberzug" == 1 then
   table.insert(extensions, "media_files")
   packer_repos = packer_repos .. ', "telescope-media-files.nvim"'
end
-- require('telescope').load_extension('projects')
-- telescope.load_extension("mapper")
pcall(function()
   for _, ext in ipairs(extensions) do
      telescope.load_extension(ext)
   end
end)

vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap')
