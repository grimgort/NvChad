-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"
-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   -- vim.api.nvim_set_keymap("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
   local opt = {}
   local opts = {}
   vim.api.nvim_set_keymap("i", "é", "é", opt)
   vim.api.nvim_set_keymap("i", "^", "^", opt)
   vim.api.nvim_set_keymap("n", " gy", ":Gina tag<cr>", opt)
   vim.api.nvim_set_keymap("n", " wx", ":only<cr>", opt)
   vim.api.nvim_set_keymap("n", " gb", ":Gina branch<cr>", opt)
   vim.api.nvim_set_keymap("n", " go", ":Gina log --graph<cr>", opt)
   vim.api.nvim_set_keymap("n", " gp", ":Gina pull<cr>", opt)
   vim.api.nvim_set_keymap("n", " g*", ":Gina push<cr>", opt)
   vim.api.nvim_set_keymap("n", "ee", "<cmd>HopChar1<cr>", opt)
   vim.api.nvim_set_keymap("n", "ej", "<cmd>HopLineStartAC<cr>", opt)
   vim.api.nvim_set_keymap("n", "el", "<cmd>HopWordAC<cr>", opt)
   vim.api.nvim_set_keymap("n", "ek", "<cmd>HopLineStartBC<cr>", opt)
   vim.api.nvim_set_keymap("n", "eh", "<cmd>HopWordBC<cr>", opt)
   vim.api.nvim_set_keymap("v", "ee", "<cmd>HopChar1<cr>", opt)
   vim.api.nvim_set_keymap("v", "ej", "<cmd>HopLineStartAC<cr>", opt)
   vim.api.nvim_set_keymap("v", "el", "<cmd>HopWordAC<cr>", opt)
   vim.api.nvim_set_keymap("v", "ek", "<cmd>HopLineStartBC<cr>", opt)
   vim.api.nvim_set_keymap("v", "eh", "<cmd>HopWordBC<cr>", opt)

   vim.api.nvim_set_keymap("n", " cd", ":cd %:p:h<cr>", opt)
   vim.api.nvim_set_keymap("n", " gf", ":Telescope git_files<cr>", opt)
   vim.api.nvim_set_keymap("n", " ff", ":Telescope git_files<cr>", opt)
   vim.api.nvim_set_keymap("n", " ee", ":NvimTreeToggle<cr>", opt)
   vim.api.nvim_set_keymap("n", " ef", ":NvimTreeFindFile<cr>", opt)
   -- GIT mapping
   vim.api.nvim_set_keymap("n", " gm", ":Neogit<cr>", opt)
   -- vim.api.nvim_set_keymap("n", " ge", ':Gina commit --opener="to split" --group="test"<cr>', opt)
   vim.api.nvim_set_keymap("n", " ge", ":Gina commit<cr>", opt)
   -- vim.api.nvim_set_keymap("n", " gg", ':Gina grep  --opener=tabnew --group="test" -ie ', opt)
   vim.api.nvim_set_keymap("n", " gg", ":Gina grep --opener=tabnew -ie ", opt)
   -- vim.api.nvim_set_keymap("n", " gx", ':Gina grep  --opener=tabnew --group="test" -ie ""\b<C-R><C-W>\b"', opt)
   -- vim.api.nvim_set_keymap("n", " gx", ':Gina grep  --opener=tabnew --group="test" -ie ""\b<C-R><C-W>\b"', opt)
   vim.api.nvim_set_keymap("n", " gx", ':Gina grep --opener=tabnew -ie ""\b<C-R><C-W>\b"', opt)
   vim.api.nvim_set_keymap("n", " gw", ":Telescope live_grep<cr>", opt)
   vim.api.nvim_set_keymap("n", " gr", ":Gina tag<cr>", opt)
   vim.api.nvim_set_keymap("n", " gd", ":Gvdiffsplit<cr>", opt)
   vim.api.nvim_set_keymap("n", " gz", ":Gina branch<cr>", opt)
   -- vim.api.nvim_set_keymap("n", " ga", ':Gina commit --amend --opener="to split" --group="test"<cr> ', opt)
   vim.api.nvim_set_keymap("n", " ga", ":Gina commit --amend<cr> ", opt)
   -- vim.api.nvim_set_keymap("n", " gs", ':Gina status  --opener="to split" --group="test"<cr>', opt)
   vim.api.nvim_set_keymap("n", " gs", ":Gina status<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>gh", ":diffget //3<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>gl", ":diffget //2<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>gu", ":GitBlameToggle<cr>", opt)
   vim.api.nvim_set_keymap("n", " gq", ":DiffviewFileHistory<cr>", opt)

   vim.api.nvim_set_keymap("n", " a", ":ClangdSwitchSourceHeader<cr>", opt)
   vim.api.nvim_set_keymap("n", " wx", ":only<cr>", opt)
   -- vim.api.nvim_set_keymap("n", "ç", ":ToggleTerm<cr>", opt)
   -- vim.api.nvim_set_keymap('n', "<leader>o", ":lua vim.lsp.buf.workspace_symbol()<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>o", ":Telescope lsp_dynamic_workspace_symbols<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>td", ":Telescope lsp_document_diagnostics<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>wc", ":%s/", opt)
   vim.api.nvim_set_keymap("v", "<leader>wc", ":s/", opt)
   vim.api.nvim_set_keymap("n", "<C-a>", "GVgg", opt)
   vim.api.nvim_set_keymap("n", "<A-:>", "q:i", opt)
   vim.api.nvim_set_keymap("n", "<A-/>", "q/i", opt)
   vim.api.nvim_set_keymap("n", "<leader>hv", [[<c-v>]], opt)
   vim.api.nvim_set_keymap("n", "<C-S-Left>", "<C-W>h", opt)
   vim.api.nvim_set_keymap("n", "<C-S-Right>", "<C-W>l", opt)
   vim.api.nvim_set_keymap("n", "<C-S-Up>", "<C-W>k", opt)
   vim.api.nvim_set_keymap("n", "<C-S-Down>", "<C-W>j", opt)
   -- vim.api.nvim_set_keymap('n',"<leader>\"", "[[ysiw]],opt)
   vim.api.nvim_set_keymap("n", "<leader>ww", ":tabclose<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>wx", ":only<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>wq", ":q<cr>", opt)
   vim.api.nvim_set_keymap("n", "<leader>wv", "[[<c-v>]]", opt)
   vim.api.nvim_set_keymap("n", "<leader>wa", ":tabnew<cr>", opt)

   vim.api.nvim_set_keymap("n", "<leader>na", ":CodeActionMenu<cr>", opt)
   vim.api.nvim_set_keymap("n", "<F3>", ":MundoToggle<cr>", opt)
   vim.api.nvim_set_keymap("n", "²", ":CloseAll<cr>", opt)
   vim.api.nvim_set_keymap("i", "²", "<C-o>:CloseAll<cr>", opt)
   vim.api.nvim_set_keymap("t", "²", "<C-\\><C-n>CloseAll<cr>", opt)
   vim.api.nvim_set_keymap("n", "<F4>", ":SymbolsOutline<cr>", opt)

   -- mapping not seems to work with lspconfig
   -- personal lsp config
   vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>ni", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   vim.api.nvim_set_keymap(
      "n",
      "<leader>nwl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      opts
   )
   vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nz", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>ne", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>nf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
   vim.api.nvim_set_keymap("v", "<leader>nz", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

   vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>copen<CR>", opts)
   vim.api.nvim_set_keymap("n", "<F7>", "<cmd>CMake build_all<CR>", opts)
   vim.api.nvim_set_keymap("n", "<F7>", "<cmd>CMake build_all<CR>", opts)

   vim.api.nvim_set_keymap("n", "<leader>tp", ":lua require'telescope'.extensions.project.project{}<CR>", opts)
   vim.api.nvim_set_keymap("n", "<leader>s", ":e#<cr>", opts)

   vim.api.nvim_set_keymap("c", "<C-k>", "<Up>", {})
   vim.api.nvim_set_keymap("c", "<C-j>", "<Down>", {})

   vim.api.nvim_set_keymap("v", "*", [[y/\V<C-r>=escape(@",'/\')<CR><CR>]], {})
   vim.api.nvim_set_keymap("n", "<leader>wh", [[:%s/<c-r><c-w>/<c-r><c-w>/g]], {})
   vim.api.nvim_set_keymap("n", "<leader>gc", ":Telescope grep_string<cr>", {})
   -- vim.api.nvim_set_keymap("c","<S-k>","<Up>",opts)
   --
   -- MARKDOWN-----------
   -- ------------------
   vim.api.nvim_set_keymap("n", "<leader>mm", "<cmd>Glow<cr>", {})
   vim.api.nvim_set_keymap("n", "<leader>ma", "<cmd>MarkdownPreview<cr>", {})
   local wk = require "which-key"
   wk.register {
      ["<leader>"] = {
         m = {
            name = "+markdown",
         },
         f = {
            name = "+file",
         },
         g = {
            name = "+git",
            t = {
               name = "+telescope",
            },
         },
         h = {
            name = "+gitsign",
         },
         n = {
            name = "+LSP",
         },
         t = {
            name = "+telescope",
         },
         u = {
            name = "+nvchad",
         },
         w = {
            name = "+basicVim",
         },
      },
   }
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:
hooks.add("install_plugins", function(use)
   --[[ use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   } ]]
   use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
         -- you can configure Hop the way you like here; see :h hop-config
         require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      end,
   }
   use {
      "folke/which-key.nvim",
      config = function()
         require("which-key").setup {
            {
               plugins = {
                  marks = true, -- shows a list of your marks on ' and `
                  registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                  spelling = {
                     enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                     suggestions = 20, -- how many suggestions should be shown in the list?
                  },
                  -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                  -- No actual key bindings are created
                  presets = {
                     operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                     motions = true, -- adds help for motions
                     text_objects = true, -- help for text objects triggered after entering an operator
                     windows = true, -- default bindings on <c-w>
                     nav = true, -- misc bindings to work with windows
                     z = true, -- bindings for folds, spelling and others prefixed with z
                     g = true, -- bindings for prefixed with g
                  },
               },
               -- add operators that will trigger motion and text object completion
               -- to enable all native operators, set the preset / operators plugin above
               operators = { gc = "Comments" },
               key_labels = {
                  -- override the label used to display some keys. It doesn't effect WK in any other way.
                  -- For example:
                  -- ["<space>"] = "SPC",
                  -- ["<cr>"] = "RET",
                  -- ["<tab>"] = "TAB",
               },
               icons = {
                  breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                  separator = "➜", -- symbol used between a key and it's label
                  group = "+", -- symbol prepended to a group
               },
               popup_mappings = {
                  scroll_down = "<c-d>", -- binding to scroll down inside the popup
                  scroll_up = "<c-u>", -- binding to scroll up inside the popup
               },
               window = {
                  border = "none", -- none, single, double, shadow
                  position = "bottom", -- bottom, top
                  margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                  padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                  winblend = 0,
               },
               layout = {
                  height = { min = 4, max = 25 }, -- min and max height of the columns
                  width = { min = 20, max = 50 }, -- min and max width of the columns
                  spacing = 3, -- spacing between columns
                  align = "left", -- align columns left, center or right
               },
               ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
               hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
               show_help = true, -- show help message on the command line when the popup is visible
               triggers = "auto", -- automatically setup triggers
               -- triggers = {"<leader>"} -- or specify a list manually
               triggers_blacklist = {
                  -- list of mode / prefixes that should never be hooked by WhichKey
                  -- this is mostly relevant for key maps that start with a native binding
                  -- most people should not need to change this
                  i = { "j", "k", "é", "^" },
                  v = { "j", "k", "é", "^" },
               },
            },
         }
      end,
   }

   use {
      "akinsho/toggleterm.nvim",
      config = function()
         if vim.loop.os_uname().sysname == "Windows_NT" then
            require("toggleterm").setup {
               open_mapping = [[ç]],
               start_in_insert = false,
               insert_mappings = true, -- whether or not the open mapping applies in insert mode
               shell = "pwsh.exe", -- change the default shell
            }
         else
            require("toggleterm").setup {
               open_mapping = [[ç]],
               start_in_insert = false,
               insert_mappings = true, -- whether or not the open mapping applies in insert mode
               -- shell ="pwsh.exe", -- change the default shell
            }
         end
      end,
   }
   use {
      "blackCauldron7/surround.nvim",
      config = function()
         require("surround").setup { mappings_style = "surround" }
      end,
   }
   use {
      "folke/twilight.nvim",
      config = function()
         require("twilight").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
      end,
   }
   use {
      "mfussenegger/nvim-dap",
      config = function()
         require "custom.plugin_confs.nvim_dap"
      end,
   }
   use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
   use { "Pocco81/DAPInstall.nvim" }

   use {
      -- Optional but recommended
      -- 'nvim-treesitter/nvim-treesitter',
      "lewis6991/spellsitter.nvim",
   }
   use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
   --[[ require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
} ]]
   use { "simrat39/symbols-outline.nvim" }
   use {
      "b3nj5m1n/kommentary",
      config = function()
         require("kommentary.config").configure_language({ "c", "lua", "cpp" }, {
            prefer_single_line_comments = true,
         })
      end,
   }
   use {
      "dominikduda/vim_current_word",
      -- ,require('vim_current_word').setup{
      -- vim.api.nvim_command('let g:vim_current_word#highlight_current_word = 0')
      --  -- vim_current_word#highlight_current_word = 0
      -- }
   }
   use {
      "voldikss/vim-translator",
      config = function()
         require "custom.plugin_confs.vim_translator"
      end,
   }
   -- use { "airblade/vim-rooter" } -- no work properly. no git project file
   use {
      "Shatur/neovim-cmake",
      config = function()
         require "custom.plugin_confs.neovim_cmake"
      end,
   }
   use { "sindrets/diffview.nvim" }
   use { "lambdalisue/gina.vim" }
   use { "tpope/vim-fugitive" }
   -- use {'mbbill/undotree'} --replaced by mundo
   --[[ use{'frazrepo/vim-rainbow',
config = function()
vim.api.nvim_set_var("rainbow_active" , 1)
end} --don't work with nvim-treesitter]]

   use {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
      config = function()
         require("nvim-treesitter.configs").setup {
            rainbow = {
               enable = true,
               extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
               max_file_lines = nil, -- Do not enable for files with more than n lines, int
               -- colors = {}, -- table of hex strings
               -- termcolors = {} -- table of colour name strings
            },
         } -- bug
      end,
   }
   use {
      "ahmedkhalf/lsp-rooter.nvim",
      config = function()
         require("lsp-rooter").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
      end,
   }
   -- use {'alexaandru/nvim-lspupdate'}
   -- use {'williamboman/nvim-lsp-installer'}
   use { "skywind3000/asyncrun.vim" }
   use { "skywind3000/asynctasks.vim" }
   use { "gelguy/wilder.nvim" }
   use { "simnalamburt/vim-mundo" }
   use { "rhysd/committia.vim" }
   use { "kevinhwang91/nvim-hlslens" }
   use { "vim-scripts/DoxygenToolkit.vim" }
   use { "alexaandru/nvim-lspupdate" }
   use { "tjdevries/nlua.nvim" }
   -- use {"p00f/nvim-ts-rainbow", event = "BufRead"}
   use {
      "kosayoda/nvim-lightbulb",
      config = function()
         require "custom.plugin_confs.nvim_lightbulb"
      end,
   }
   use { "tami5/sqlite.lua" }
   --[[ use {
      "hrsh7th/cmp-path",
      after = "cmp-nvim-lsp",
   } ]]
   use {
      "hrsh7th/cmp-calc",
      after = "cmp-nvim-lsp",
   }
   use {
      "sudormrfbin/cheatsheet.nvim",

      requires = {
         { "nvim-telescope/telescope.nvim" },
         { "nvim-lua/popup.nvim" },
         { "nvim-lua/plenary.nvim" },
      },
   }
   use { "mhinz/vim-grepper" }
   use {
      -- 'neovim/nvim-lsp-config',
      "williamboman/nvim-lsp-installer",
      -- config = "custom.plugin_confs.nvim-lsp-installer"
      config = function()
         require "custom.plugin_confs.nvim_lsp_installer"
      end,
   }
   -- use{'kabouzeid/nvim-lspinstall'} "only linux"

   use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
   }

   use {
      "hoob3rt/lualine.nvim",
      config = function()
         require "custom.plugin_confs.lualine"
      end,
   }

   use {
      "nvim-telescope/telescope-project.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").load_extension "project"
      end,
   }

   use { "sbdchd/neoformat" }
   use {
      "haringsrob/nvim_context_vt",
      after = "nvim-treesitter",
   }
   use {
      "nacro90/numb.nvim",
      config = function()
         require("numb").setup {
            show_numbers = true, -- Enable 'number' for the window while peeking
            show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
         }
      end,
   }
   use { "f-person/git-blame.nvim" }
   use { "junegunn/vim-easy-align" }
   use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
   use {
      "chipsenkbeil/distant.nvim",
      config = function()
         require("distant").setup {
            -- Applies Chip's personal settings to every machine you connect to
            --
            -- 1. Ensures that distant servers terminate with no connections
            -- 2. Provides navigation bindings for remote directories
            -- 3. Provides keybinding to jump into a remote file's parent directory
            ["*"] = require("distant.settings").chip_default(),
         }
      end,
   }
   -- use{"tveskag/nvim-blame-line"}
   -- use { "glepnir/lspsaga.nvim" }
   use {
      "rmagatti/goto-preview",
      config = function()
         require("goto-preview").setup {
            width = 120, -- Width of the floating window
            height = 15, -- Height of the floating window
            border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
            default_mappings = true, -- Bind default mappings
            debug = false, -- Print debug information
            opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
            post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
         }
      end,
   }
   use {
      "mhinz/vim-startify",
   }
   use {
      "GustavoKatel/telescope-asynctasks.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").load_extension "asynctasks"
      end,
   }
   use { "nvim-lua/popup.nvim" }
   use {
      "winston0410/commented.nvim",
      config = function()
         local opts = {
            comment_padding = " ", -- padding between starting and ending comment symbols
            keybindings = { n = "<leader>c", v = "<leader>c", nl = "<leader>cc" }, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
            prefer_block_comment = false, -- Set it to true to automatically use block comment when multiple lines are selected
            set_keybindings = true, -- whether or not keybinding is set on setup
            ex_mode_cmd = "Comment", -- command for commenting in ex-mode, set it null to not set the command initially.
         }
         require("commented").setup(opts)
      end,
   }
   use { "ellisonleao/glow.nvim" }
   use { "davidgranstrom/nvim-markdown-preview" }
   -- use {
   --    "nvim-telescope/telescope-frecency.nvim",
   --    config = function()
   --       require("telescope").load_extension "frecency"

   --    end,
   --    requires = { "tami5/sqlite.lua" },
   -- }
   use{ "cljoly/telescope-repo.nvim",
   config = function()
      require'telescope'.load_extension'repo'
   end,
 }
   -- use {
   --    "brymer-meneses/grammar-guard.nvim",
   --    requires = "neovim/nvim-lspconfig",
   --    after = "nvim-lspconfig",
   --    config = function()
   --      require("grammar-guard").init()
   --    end,
   -- }
   --[[ use {
      "rmagatti/auto-session",
      after = "telescope.nvim",

      config = function()
         local opts = {
            log_level = "info",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = nil,
            auto_restore_enabled = nil,
            auto_session_suppress_dirs = nil,
         }

         -- require("auto-session").setup(opts)
         require("auto-session").setup()

         -- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
      end,
   } ]]

   --[[ use {
      "rmagatti/session-lens",
      requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
      config = function()
         require("session-lens").setup {
         }
         require("telescope").load_extension "session-lens"
      end,
   }
 ]]
   --[[ use {
      "Shatur/neovim-session-manager",
      after = "telescope.nvim",
      config = function()
         local Path = require "plenary.path"
         require("session_manager").setup {
            sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
            path_replacer = "__", -- The character to which the path separator will be replaced for session files.
            colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
            autoload_last_session = true, -- Automatically load last session on startup is started without arguments.
            autosave_last_session = true, -- Automatically save last session on exit.
            autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
         }
require("telescope").load_extension "neovim-session-manager"
      end,
   } ]]
   -- use{"christoomey/vim-conflicted"}

-- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
-- config = function()
--   require'navigator'.setup()
-- end,
-- }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

require "custom.fred"

