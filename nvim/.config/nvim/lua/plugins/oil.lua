local function toggle_oil(dir)
  return function()
    if vim.bo.filetype == "oil" then
      require("oil").close()
    else
      require("oil").open(dir)
    end
  end
end

return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", toggle_oil(), desc = "Toggle Oil file explorer" },
    { "<leader>fe", toggle_oil(), desc = "Toggle Oil file explorer" },
    { "<leader>E", toggle_oil(vim.uv.cwd()), desc = "Toggle Oil file explorer (cwd)" },
    { "<leader>fE", toggle_oil(vim.uv.cwd()), desc = "Toggle Oil file explorer (cwd)" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
}
