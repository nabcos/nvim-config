-- [nfnl] fnl/plugins/oil.fnl
local function _1_()
  local oil = require("oil")
  oil.setup()
  vim.keymap.set("n", "<leader>fs", "<cmd>Oil --float<cr>", {desc = "Open [F]ile[S]ystem view"})
  return vim.keymap.set("n", "<leader>FS", "<cmd>Oil<cr>", {desc = "Open [F]ile[S]ystem view"})
end
return {{"stevearc/oil.nvim", config = _1_, dependencies = {"nvim-tree/nvim-web-devicons"}, lazy = false}}
