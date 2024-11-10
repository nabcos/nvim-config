-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "yes", autoindent = true}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
vim.keymap.set("c", "w!!", "%!sudo tee >/dev/null %<cr>", {desc = "Re[w]rite file as root"})
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {desc = "move lines down"})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {desc = "move lines up"})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {desc = "move lines down"})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {desc = "move lines up"})
vim.keymap.set("n", "<M-t>", "<c-w>5<")
vim.keymap.set("n", "<M-s>", "<c-w>5>")
vim.keymap.set("n", "<M-,>", "<C-W>+")
vim.keymap.set("n", "<M-.>", "<C-W>-")
vim.keymap.set("n", "<tab>", "za", {desc = "Toggle fold"})
local function _2_()
  return vim.keymap.set("i", "<esc>", "<esc>:update<cr>")
end
vim.api.nvim_create_autocmd("FileType", {pattern = {"markdown"}, callback = _2_})
return {}
