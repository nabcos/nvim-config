-- [nfnl] Compiled from fnl/plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", {desc = "Toggle [U]ndotree view"})
end
return {{"mbbill/undotree", config = _1_}}
