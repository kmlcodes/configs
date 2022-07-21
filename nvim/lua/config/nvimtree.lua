local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },  
    view = {
      number = false,
      relativenumber = false,
    },
    filters = {
      custom = { ".git" },
    },
  }
end

return M