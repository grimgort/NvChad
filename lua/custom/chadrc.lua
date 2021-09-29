-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the strucutre of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

-- M.options = {
--    relativenumber = true,
-- }

M.ui = {
  theme = "uwu"
}
M.mappings = {
   -- custom = {}, -- all custom user mappings
   -- close current focused buffer
   close_buffer = "<leader>!!!!!!x",
   copy_whole_file = "<C-a>", -- copy all contents of the current buffer
   line_number_toggle = "<leader>!!!!!!!!!!n", -- show or hide line number
   new_buffer = "<S-t>", -- open a new buffer
   new_tab = "<C-t>b", -- open a new vim tab
   save_file = "<C-s>", -- save file using :w
   theme_toggler = "<leader>tt", -- for theme toggler, see in ui.theme_toggler
   -- navigation in insert mode, only if enabled in options
   insert_nav = {
      backward = "<C-h>",
      end_of_line = "<C-e>",
      forward = "<C-l>",
      next_line = "<C-k>",
      prev_line = "<C-j>",
      top_of_line = "<C-a>",
   },
   --better window movement
   window_nav = {
      moveLeft = "<C-h>",
      moveRight = "<C-l>",
      moveUp = "<C-k>",
      moveDown = "<C-j>",
   },
   -- terminal related mappings
   terminal = {
      -- multiple mappings can be given for esc_termmode and esc_hide_termmode
      -- get out of terminal mode
      esc_termmode = { "jk" }, -- multiple mappings allowed
      -- get out of terminal mode and hide it
      esc_hide_termmode = { "JK" }, -- multiple mappings allowed
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<leader>!!!!!!!!W",
      -- below three are for spawning terminals
      new_horizontal = "<leader>!!!!!!!!h",
      new_vertical = "<leader>!!!!!!!!!!v",
      new_window = "<leader>!!!!!!!!w",
   },
   -- update nvchad from nvchad, chadness 101
   update_nvchad = "<leader>uu",
}
M.mappings.plugins = {
   -- list open buffers up the top, easy switching too
   bufferline = {
      next_buffer = "<leader>!!!!!!!!!", -- next buffer
      prev_buffer = "<leader>!!!!!!!!!a", -- previous buffer
   },
   -- easily (un)comment code, language aware
   comment = {
      toggle = "<leader>cc", -- toggle comment (works on multiple lines)
   },
   -- NeoVim 'home screen' on open
   dashboard = {
      bookmarks = "<leader>bm",
      new_file = "<leader>bn", -- basically create a new buffer
      open = "<leader>bb", -- open dashboard
      session_load = "<leader>bl", -- load a saved session
      session_save = "<leader>bs", -- save a session
   },
   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = { "jk" }, -- multiple mappings allowed
   },
   -- file explorer/tree
   nvimtree = {
      toggle = "<C-n>",
      focus = "<leader>e",
   },
   -- universal code formatter
   neoformat = {
      format = "<leader>fm",
   },
   -- multitool for finding & picking things
   telescope = {
      buffers = "<leader>tb",
      find_files = "<leader>tf",
      git_commits = "<leader>tm",
      git_status = "<leader>tt",
      help_tags = "<leader>th",
      live_grep = "<leader>tw",
      oldfiles = "<leader>to",
      themes = "<leader>th",
      telescope_media = {
         media_files = "<leader>fp",
      },
   },
   -- distraction free & minimalist UI mode
   truezen = {
      ataraxis_mode = "<leader>zz", -- center
      focus_mode = "<leader>zf",
      minimalistic_mode = "<leader>zm", -- as it is
   },
}






-- NvChad included plugin options & overrides
M.plugins = {
  plugin_status ={
      autosave = false, -- to autosave files
      blankline = true, -- show code scope with symbols
      bufferline = false, -- list open buffers up the top, easy switching too
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true, -- NeoVim 'home screen' on open
      esc_insertmode = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true, -- gitsigns in statusline
      lspsignature = true, -- lsp enhancements
      neoformat = true, -- universal code formatter
      neoscroll = false, -- smooth scroll
      telescope_media = true, -- media previews within telescope finders
      truezen = true, -- distraction free & minimalist UI mode
      vim_matchup = true, -- % operator enhancements
      cmp = true,

  },
   options = {
       lspconfig = {
         -- servers = {"html", "cssls"}
         servers = {"clangd","jedi_language_server", "clangd", "cmake", "fortls", "sumneko_lua","jsonls"},
      },
   },

   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
     nvim_cmp = "custom.plugin_confs.cmp",
     -- luasnip = "custom.plugin_confs.luasnip",
     -- lspconfig = "custom.plugin_confs.lspconfig",
   },
}

return M
