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
map('n', " gy", ":Gina tag<cr>", opt),
map('n', " wx", ":only<cr>", opt),
   map('n', " gb", ":Gina branch<cr>", opt),
   map('n', " go", ":Gina log --graph --all<cr>", opt),
   map('n', " gp", ":Gina pull<cr>", opt),
   map('n', " g*", ":Gina push<cr>", opt),
   map('n', 'e', ":HopChar1<cr>", opt),
   map('n', " cd", ":cd %:p:h<cr>", opt),
   map('n', " gf", ":Telescope git_files<cr>", opt),
   map('n', " ff", ":Telescope git_files<cr>", opt),
   map('n', " ee", ":NvimTreeFocus<cr>", opt),
   map('n', " ef", ":NvimTreeFindFile<cr>", opt),
-- GIT mapping
   map('n', " gm", ":Neogit<cr>", opt),
   map('n', " ge", ":Gina commit --opener=\"to split\" --group=\"test\"<cr>", opt),
   map('n', " gg", ":Gina grep  --opener=tabnew --group=\"test\" -ie ", opt),
   map('n', " gw", ":Gina grep  --opener=tabnew --group=\"test\" -ie \"\"\b<C-R><C-W>\b\"", opt),
   map('n', " gx", ":Telescope live_grep<cr>", opt),
   map('n', " gt", ":Gina tag<cr>", opt),
   map('n', " gd", ":Gvdiffsplit<cr>", opt),
   map('n', " gz", ":Gina branch<cr>", opt),
   map('n', " ga", ":Gina commit --amend --opener=\"to split\" --group=\"test\"<cr> ", opt),
   map('n', " gs", ":Gina status  --opener=\"to split\" --group=\"test\"<cr>", opt),

   map('n', " a", ":ClangdSwitchSourceHeader<cr> ", opt),
    map('n', " wx", ":only<cr>", opt),
    map('n', "à", ":ToggleTerm<cr>", opt),
    map('n', "<leader>o", ":Telescope lsp_workspace_symbols<cr>", opt),
    map('n', "<leader>td", ":Telescope lsp_document_diagnostics<cr>", opt),


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
  require("toggleterm").setup {
  open_mapping = [[<C-à>]],
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  shell ="pwsh.exe", -- change the default shell
}
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
use 'mfussenegger/nvim-dap'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use "Pocco81/DAPInstall.nvim"
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
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
use {'voldikss/vim-translator'}
use{'airblade/vim-rooter'}
use{'Shatur/neovim-cmake'}
use {'sindrets/diffview.nvim'}
use {'lambdalisue/gina.vim'}
-- use {'mbbill/undotree'}
-- use {  'p00f/nvim-ts-rainbow'}
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
use{"kosayoda/nvim-lightbulb"}
use{"tami5/sqlite.lua"}
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
