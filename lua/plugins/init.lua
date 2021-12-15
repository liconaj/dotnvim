-----------------------------------------------------------
-- Packer
-----------------------------------------------------------

-- Autoinstall
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Install plugins
return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-sleuth'

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require 'plugins.nvim-tree'
    end
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require 'plugins.bufferline'
    end
  }

  -- Themes
  use 'navarasu/onedark.nvim'
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  use {
    'thaerkh/vim-indentguides',
    config = function()
      require 'plugins.indentguides'
    end
  }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require 'plugins.toggleterm'
    end
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'plugins.lualine'
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'BufReadPost'
  }

  -- Completion

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      cmd 'source ~/.config/nvim/vim/coc.vim'
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'plugins.autopairs'
    end
  }

  -- Asyncchronyc run
  use {
    'tpope/vim-dispatch',
    config = function()
      cmd 'source ~/.config/nvim/vim/dispatch.vim'
    end
  }
  use 'radenling/vim-dispatch-neovim'

  -- Sessions
  use 'xolox/vim-misc'
  use {
    'xolox/vim-session',
    requires = {'xolox/vim-misc'},
    config = function()
      require 'plugins.session'
    end
  }

  -- Navigation
  use {
    'ctrlpvim/ctrlp.vim',
    config = function ()
      cmd '~/.config/nvim/vim/ctrlp.vim'
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

