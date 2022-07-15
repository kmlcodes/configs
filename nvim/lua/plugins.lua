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

   -- Nvim tree (file explorer)
   use {
    "kyazdani42/nvim-tree.lua",
    opt = true,
    wants = "nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    -- module = "nvim-tree",
    config = function()
      require("config.nvimtree").setup()
    end,
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
  