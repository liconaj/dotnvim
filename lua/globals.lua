-----------------------------------------------------------
-- Neovim API globals
-----------------------------------------------------------
_G.cmd = vim.cmd
_G.api = vim.api
_G.cmd = vim.cmd              -- execute Vim commands
_G.exec = vim.api.nvim_exec   -- execute Vimscript
_G.fn = vim.fn                -- call Vim functions
_G.g = vim.g                  -- global variables
_G.opt = vim.opt              -- global/buffer/windows-scoped options
