-- [nfnl] fnl/plugins/undotree.fnl
local function _1_()
  return vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", {desc = "Toggle [U]ndotree view"})
end
return {{"mbbill/undotree", config = _1_}}
