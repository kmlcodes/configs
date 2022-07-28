local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end

    -- Run PackerCompile if there are changes in this file
    -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = "init.lua", command = "source <afile> | PackerCompile", group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
    
     -- Packer
    use { "wbthomason/packer.nvim" }

    -- Performance
    use { "lewis6991/impatient.nvim" }

    -- Icons
    use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }

  -- Color scheme
  use {
      "sainnhe/gruvbox-material",
      config = function()
        vim.cmd "colorscheme gruvbox-material"
      end
    }
    
   -- Nvim tree (file explorer)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("config.nvimtree").setup()
    end,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  
-- Lualine Status bar
    use {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  config = function()
   require("config.lualine").setup()
  end,
  requires = { "nvim-web-devicons" },
}

-- For status line appearance
use {
  "SmiteshP/nvim-gps",
  requires = "nvim-treesitter/nvim-treesitter",
  module = "nvim-gps",
  config = function()
    require("nvim-gps").setup()
  end,
}

-- Treesitter 
use {
  "nvim-treesitter/nvim-treesitter",
   config = function()
     require("config.treesitter").setup()
   end,
}

-- LSP 
use {
  "neovim/nvim-lspconfig",
   config = function()
     require("config.lsp").setup()
   end,
   requires = {
        "williamboman/nvim-lsp-installer",
      }
}
-- Completion 
use {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  opt = true,
  config = function()
        require("config.cmp").setup()
  end,
  wants = { "LuaSnip" },
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "ray-x/cmp-treesitter",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",

    -- Snippets
    "saadparwaiz1/cmp_luasnip",
    { 
    "L3MON4D3/LuaSnip",
    wants = { "friendly-snippets", "vim-snippets" },
    config = function()
      require("config.snip").setup()
          end,
    },
    "rafamadriz/friendly-snippets",
    "honza/vim-snippets",
  }
}

  -- Bootstrap Neovim
  if packer_bootstrap then
    print "Neovim restart is required after installation!"
    require("packer").sync()
  end
  end

    -- Init and start packer
    packer_init()
    local packer = require "packer"
  
    -- Performance
    pcall(require, "impatient")
    -- pcall(require, "packer_compiled")
  
    packer.init(conf)
    packer.startup(plugins)
  end
  
  return M
  
