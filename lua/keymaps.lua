-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
map = utils.map
abbrev = utils.abbrev

-----------------------------------------------------------
-- Neovim
-----------------------------------------------------------

-- Open configuration
map {'n', '<leader>,', ':e $MYVIMRC<CR>'}

-- Save
map {'n', '<C-s>', ':w<CR>'}
map {'i', '<C-s>', '<C-c>:w<CR>a'}

-- Set working directory
map {'n', '<leader>.', ':lcd %:p:h<CR>0'}

-- Open from current file path
map {'n', '<leader>ed', ':e <C-r>=expand("%:p:h") . "/" <CR>'}
map {'n', '<leader>e', ':e<space>'}

-- Select all
map {'n', '<C-a>', '<esc>gg0vG$<CR>', noremap=false}

-- Move around splits
map {'n', '<C-h>', '<C-w>h'}
map {'n', '<C-j>', '<C-w>j'}
map {'n', '<C-k>', '<C-w>k'}
map {'n', '<C-l>', '<C-w>l'}

-- Buffer
map {'n', '<leader>j', ':bp!<CR>'}
map {'n', '<leader>k', ':bn!<CR>'}
map {'n', '<leader>c', ':bd!<CR>'}

map {'n', '<leader>x', ':BufOnly<CR>'}
map {'n', '<leader>n', ':enew<CR>'}

-- Close all windows and exit
map {'n', '<leader>q', ':qa!<CR>'}

-- Keep Visual Mode after shifting
map {'v', '<', '<gv', noremap=false}
map {'v', '>', '>gv', noremap=false}

-- Paste
map {'n', '<M-p>', '"+P=\']'}
map {'i', '<M-p>', '<C-o>"+P<C-o>=\']'}

-- Save as super user
map {'c', 'w!!', 'w !sudo tee %', noremap=false}

-----------------------------------------------------------
-- Applications & Plugins
-----------------------------------------------------------

-- NvimTree
map {'n', '<f3>', ':NvimTreeToggle<CR>'}


-- Ctrlp
map {'n', '<leader>w', ':CtrlPCurWD<CR>'}
map {'n', '<leader>f', ':CtrlPCurFile<CR>'}
map {'n', '<leader>p', ':CtrlPBookmarkDir<CR>'}
map {'n', '<leader>b', ':CtrlPBuffer<CR>'}
map {'n', '<leader>r', ':CtrlPMRUFiles<CR>'}
map {'n', '<leader>pa', ':CtrlPBookmarkDirAdd<space>'}

-- Sessions
map {'n', '<leader>so', ':OpenSession<Space>', silent=true}
map {'n', '<leader>ss', ':SaveSession<Space>', silent=true}
map {'n', '<leader>sd', ':DeleteSession<CR>', silent=true}
map {'n', '<leader>sc', ':CloseSession<CR>', silent=true}

-- Build system
map {'n', '<F5>', ':YabsDefaultTask<CR>'}
map {'n', '<F6>', ':YabsTask<space>'}


-----------------------------------------------------------
-- Abbreviations
-----------------------------------------------------------

abbrev {'c', 'W!', 'w!'}
abbrev {'c', 'Q!', 'q!'}
abbrev {'c', 'Qall!', 'qall!'}
abbrev {'c', 'Wq', 'wq'}
abbrev {'c', 'Wa', 'wa'}
abbrev {'c', 'wQ', 'wq'}
abbrev {'c', 'WQ', 'wq'}
abbrev {'c', 'W', 'w'}
abbrev {'c', 'Q', 'q'}
abbrev {'c', 'Qall', 'qall'}

