local tree = {
  sections = {},
  inactive_sections = {},
  filetypes = {'NvimTree'}
}

require 'lualine'.setup{
  options = {
    disabled_filetypes = {'alpha'}
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        shorting_target = 40
      }
    }
  },
  extensions = {'toggleterm', tree}
}

