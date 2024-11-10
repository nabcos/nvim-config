-- [nfnl] Compiled from fnl/plugins/barbar.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(...)
  local args = {...}
  vim.g.barbar_auto_setup = false
  return nil
end
local function _2_(_, options)
  do
    local barbar = require("barbar")
    barbar.setup(options)
  end
  vim.keymap.set("n", "<C-A-Left>", "<Cmd>BufferPrevious<CR>", {noremap = true, silent = true})
  return vim.keymap.set("n", "<C-A-Right>", "<Cmd>BufferNext<CR>", {noremap = true, silent = true})
end
return {{"romgrk/barbar.nvim", dependencies = {"lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons"}, init = _1_, config = _2_, opts = {focus_on_close = "previous"}}}
