-- [nfnl] fnl/plugins/project.fnl
local function _1_()
  return vim.keymap.set("n", "<leader>gp", ":lua require('telescope').extensions.projects.projects()<CR>", {noremap = true})
end
local function _2_()
  local plugin = require("project_nvim")
  return plugin.setup({})
end
return {{"ahmedkhalf/project.nvim", init = _1_, config = _2_}}
