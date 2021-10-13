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
   -- map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
   map('n', " gy", ":Gina tag<cr>", opt)
   map('n', " wx", ":only<cr>", opt)
   map('n', " gb", ":Gina branch<cr>", opt)
   map('n', " go", ":Gina log --graph --all<cr>", opt)
   map('n', " gp", ":Gina pull<cr>", opt)
   map('n', " g*", ":Gina push<cr>", opt)
   map('n', 'e', ":HopChar1<cr>", opt)
   map('n', " cd", ":cd %:p:h<cr>", opt)
   map('n', " gf", ":Telescope git_files<cr>", opt)
   map('n', " ff", ":Telescope git_files<cr>", opt)
   map('n', " ee", ":NvimTreeFocus<cr>", opt)
   map('n', " ef", ":NvimTreeFindFile<cr>", opt)
-- GIT mapping
   map('n', " gm", ":Neogit<cr>", opt)
   map('n', " ge", ":Gina commit --opener=\"to split\" --group=\"test\"<cr>", opt)
   map('n', " gg", ":Gina grep  --opener=tabnew --group=\"test\" -ie ", opt)
   map('n', " gx", ":Gina grep  --opener=tabnew --group=\"test\" -ie \"\"\b<C-R><C-W>\b\"", opt)
   map('n', " gw", ":Telescope live_grep<cr>", opt)
   map('n', " gr", ":Gina tag<cr>", opt)
   map('n', " gd", ":Gvdiffsplit<cr>", opt)
   map('n', " gz", ":Gina branch<cr>", opt)
   map('n', " ga", ":Gina commit --amend --opener=\"to split\" --group=\"test\"<cr> ", opt)
   map('n', " gs", ":Gina status  --opener=\"to split\" --group=\"test\"<cr>", opt)

   map('n', " a", ":ClangdSwitchSourceHeader<cr>", opt)
    map('n', " wx", ":only<cr>", opt)
    map('n', "à", ":ToggleTerm<cr>", opt)
    -- map('n', "<leader>o", ":lua vim.lsp.buf.workspace_symbol()<cr>", opt)
    map('n', "<leader>o", ":Telescope lsp_dynamic_workspace_symbols<cr>", opt)
    map('n', "<leader>td", ":Telescope lsp_document_diagnostics<cr>", opt)
    map('n',"<C-h>",":%s/",opt)
    map('v',"<C-h>",":s/",opt)
    map('n',"<C-a>","GVgg",opt)
    map('n',"<A-:>","q:i",opt)
    map('n',"<A-/>","q/i",opt)
    map( 'v',"*", [[y/\V<C-r>=escape(@",'/\')<CR><CR>]],opt)
    map('n',"<leader>hh", [[:%s/<c-r><c-w>/<c-r><c-w>/g]],opt )
    map('n',"<leader>hv", [[<c-v>]],opt )
    map('n', "<C-S-Left>", "<C-W>h",opt)
    map('n', "<C-S-Right>", "<C-W>l",opt)
    map('n', "<C-S-Up>", "<C-W>k",opt)
    map('n', "<C-S-Down>", "<C-W>j",opt)
    -- map('n',"<leader>\"", "[[ysiw]],opt)
    map('n',"<leader>ww", ":tabclose<cr>",opt) 
    map('n',"<leader>wx", ":only<cr>",opt)
    map('n',"<leader>wq", ":q<cr>",opt)
    map('n',"<leader>wv", "<c-v>",opt)
    map('n',"<leader>wa", ":tabnew<cr>",opt)

    map('n',"<leader>na",":CodeActionMenu<cr>",opt)
    map('n',"<F3>",":MundoToggle<cr>",opt)
    map('n', "²", ":CloseAll<cr>", opt)
    map('i', "²", "<C-o>:CloseAll<cr>", opt)
    map('t', "²", "<C-\\><C-n>CloseAll<cr>", opt)
    map('n', "<F4>", ":SymbolsOutline<cr>", opt)

-- mapping not seems to work with lspconfig
-- personal lsp config
   map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   map("n", "<leader>nh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   map("n", "<leader>ni", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   map("n", "<leader>nk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   map("n", "<leader>nwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   map("n", "<leader>nwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   map("n", "<leader>nwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   map("n", "<leader>nt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   map("n", "<leader>nr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   map("n", "<leader>nz", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   map("n", "<leader>ne", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   map("n", "<leader>nk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   map("n", "<leader>nj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   map("n", "<leader>nq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   map("n", "<leader>nf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
   map("v", "<leader>nz", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)


   map("n", "<leader>q", "<cmd>copen<CR>", opts)
   map("n", "<F7>", "<cmd>CMake build_all<CR>", opts)


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
  'phaazon/hop.nvim',
  as = 'hop',
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
use {"akinsho/toggleterm.nvim",
config =function()
  if vim.loop.os_uname().sysname=="Windows_NT" then
  require("toggleterm").setup {
  open_mapping = [[<C-à>]],
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  shell ="pwsh.exe", -- change the default shell
}else
  require("toggleterm").setup {
  open_mapping = [[<C-à>]],
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- shell ="pwsh.exe", -- change the default shell
}
  end
end
}
use {
  "blackCauldron7/surround.nvim",
  config = function()
    require"surround".setup {mappings_style = "surround"}
  end
}
use {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
use {'mfussenegger/nvim-dap',
config = function()
require("custom.plugin_confs.nvim_dap")
end
}
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use {"Pocco81/DAPInstall.nvim"}

use {
  -- Optional but recommended
  -- 'nvim-treesitter/nvim-treesitter',
  'lewis6991/spellsitter.nvim',
}
use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}
use {'simrat39/symbols-outline.nvim'}
use {'b3nj5m1n/kommentary'}
use {
'dominikduda/vim_current_word'
-- ,require('vim_current_word').setup{
-- vim.api.nvim_command('let g:vim_current_word#highlight_current_word = 0')
--  -- vim_current_word#highlight_current_word = 0
-- }
}
use {'voldikss/vim-translator',
config = function()
  require("custom.plugin_confs.vim_translator")
end
}
use{'airblade/vim-rooter'}
use{'Shatur/neovim-cmake',config=function ()
  require("custom.plugin_confs.neovim_cmake")
end
}
use {'sindrets/diffview.nvim'}
use {'lambdalisue/gina.vim'}
use {'tpope/vim-fugitive'}
-- use {'mbbill/undotree'} --replaced by mundo
--[[ use{'frazrepo/vim-rainbow',
config = function()
vim.api.nvim_set_var("rainbow_active" , 1)
end} --don't work with nvim-treesitter]]

--[[ use {  'p00f/nvim-ts-rainbow',
config = function()
 require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
} -- bug 
end
}]]
use {
  "ahmedkhalf/lsp-rooter.nvim",
  config = function()
    require("lsp-rooter").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
-- use {'alexaandru/nvim-lspupdate'}
-- use {'williamboman/nvim-lsp-installer'}
use{'skywind3000/asyncrun.vim'}
use{'gelguy/wilder.nvim'}
 use{"simnalamburt/vim-mundo"}
use{"rhysd/committia.vim"}
use {'kevinhwang91/nvim-hlslens'}
use{'vim-scripts/DoxygenToolkit.vim'}
use{'alexaandru/nvim-lspupdate'}
use{'tjdevries/nlua.nvim'}
use {"p00f/nvim-ts-rainbow", event = "BufRead"} 
use{"kosayoda/nvim-lightbulb",
   config = function()
      require("custom.plugin_confs.nvim_lightbulb")
    end
}
use{"tami5/sqlite.lua"}
   --[[ use {
      "hrsh7th/cmp-path",
      after = "cmp-nvim-lsp",
   } ]]
   use {
      "hrsh7th/cmp-calc",
      after = "cmp-nvim-lsp",
   }
use {
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
}
use{"mhinz/vim-grepper"}
use {
    -- 'neovim/nvim-lsp-config',
    'williamboman/nvim-lsp-installer',
    -- config = "custom.plugin_confs.nvim-lsp-installer"
    config = function()
      require("custom.plugin_confs.nvim_lsp_installer")
    end
}
-- use{'kabouzeid/nvim-lspinstall'} "only linux"


use{
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
}

--[[ use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
} ]]
use {
  'hoob3rt/lualine.nvim',
  config = function()
    require("custom.plugin_confs.lualine")
  end
}
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

require "custom.fred"
