-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' '             -- change leader to a comma
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.numberwidth = 5
opt.cmdheight = 1
opt.showmatch = true          -- highlight matching parenthesis
opt.signcolumn = 'number'
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.linebreak = true          -- wrap on word boundary

opt.cursorbind = true
opt.cursorline = true
opt.wrapscan = true
opt.wrap = false
opt.whichwrap = '<,>,h,l,[,]'

opt.pumheight = 10

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- statusline
opt.showmode = false
opt.showcmd = true
opt.report = 0
opt.title = false

-- highlight on yank
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

opt.lines = 31
opt.columns = 91
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors

-- onedark, catppuccin
g.theme = 'catppuccin'

-----------------------------------------------------------
-- Files
-----------------------------------------------------------
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileformats = 'unix,dos,mac'
opt.formatoptions:append('rnlm')

opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 500

opt.autoread = true
opt.autowrite = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
cmd [[
filetype on
filetype plugin indent on
]]

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.autoindent = true
opt.backspace = 'indent,eol,start'

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menu,menuone,noselect'

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- Visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
autocmd TermOpen * startinsert
autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append "sI"


-----------------------------------------------------------
-- Reload
-----------------------------------------------------------
local config_dir = vim.fn.stdpath('config')
local vim_modules = config_dir .. '/vim'
local lua_modules = config_dir .. '/lua'

local function execute_dir(dir_path, func)
  local p = io.popen('find "'..dir_path..'" -type f')
  for file in p:lines() do
    func(file)
  end
end

local function check_file(file_path)
  cmd('au! BufWritePost '..file_path..' lua Reload()')
end

local function check_dir(dir_path)
  execute_dir(dir_path, check_file)
end

local function reload_file(file_path)
  cmd('source '..file_path)
end

local function reload_dir(dir_path)
  execute_dir(dir_path, reload_file)
end

check_file('$MYVIMRC')
check_dir(lua_modules)
check_dir(vim_modules)

local reload_list = {
  '$MYVIMRC',
  lua_modules..'/globals.lua',
  lua_modules..'/utils.lua',
  lua_modules..'/plugins/init.lua',
  lua_modules..'/settings.lua',
  lua_modules..'/themes/init.lua',
  lua_modules..'/keymaps.lua'
}

function _G.Reload()
  for _, file in ipairs(reload_list) do
    reload_file(file)
  end
  reload_dir(vim_modules)
end

