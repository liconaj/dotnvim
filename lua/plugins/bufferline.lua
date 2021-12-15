require("bufferline").setup{
  options = {
    offsets = {{ filetype = "NvimTree" }},
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
    end,
  }
}
