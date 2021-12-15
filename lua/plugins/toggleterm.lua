map = utils.map

function _G.set_terminal_keymaps()
  map { 't', '<esc>', [[<C-\><C-n>]] }
  map { 't', 'jk', [[<C-\><C-n>]] }
  map { 't', '<C-h>', [[<C-\><C-n><C-W>h]] }
  map { 't', '<C-j>', [[<C-\><C-n><C-W>j]] }
  map { 't', '<C-k>', [[<C-\><C-n><C-W>k]] }
  map { 't', '<C-l>', [[<C-\><C-n><C-W>l]] }
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd [[ autocmd! TermOpen term://* lua set_terminal_keymaps() ]]


require 'toggleterm'.setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    winblend = 3,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    }
  }
}
