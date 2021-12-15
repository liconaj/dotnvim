_G.utils = {}

function utils.abbrev(t)
  local mode, input, replace = t[1], t[2], t[3]
  local opt = 'nore'
  local remap = t.noreabbrev
  if remap == false then
    opt = ''
  end
  local command = '%s%sabbrev %s %s'
  command = command:format(mode, opt, input, replace)
  cmd(command)
end

function utils.map(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then
      opts[i] = v
    end
  end

  -- asic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

function utils.systemlist(...)
  local rv = api.nvim_call_function('systemlist', ...)
  local err = api.nvim_get_vvar('shell_error')
  local args_str = api.nvim_call_function('string', ...)
  if 0 ~= err then
    error('command failed: '..args_str)
  end
  return rv
end

function utils.preserve(cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  api.nvim_command(cmd)
  fn.winrestview(original_cursor)
end

cmd([[cnoreab cls Preserve]])
cmd([[command! Preserve lua utils.preserve('%s/\\s\\+$//ge')]])
cmd([[command! Reindent lua utils.preserve("sil keepj normal! gg=G")]])
cmd([[command! BufOnly lua utils.preserve("silent! %bd|e#|bd#")]])

