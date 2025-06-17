-- [nfnl] fnl/plugins/orgmode.fnl
local function _1_()
  local orgmode = require("orgmode")
  local bullets = require("org-bullets")
  orgmode.setup({org_agenda_files = "~/orgfiles/**/*", org_default_notes_file = "~/orgfiles/refile.org", org_adapt_indentation = true, mappings = {org_return_uses_meta_return = true}, org_capture_templates = {t = {description = "Todo", template = "* TODO %?\nDEADLINE: %T"}, n = {description = "Note", template = "* %?\n"}, m = {description = "Meeting", template = "* %?\nSCHEDULED: %^t"}}})
  return bullets.setup({concealcursor = true, symbols = {list = "\226\128\162", headlines = {"\239\146\170 ", "\243\176\186\149 ", "\226\156\184", "\226\156\191"}, checkboxes = {half = {"\239\128\151", "OrgTSCheckboxHalfChecked"}, done = {"\226\156\147", "OrgDone"}, todo = {"\195\151", "OrgTODO"}}}})
end
return {{"nvim-orgmode/orgmode", dependencies = {"akinsho/org-bullets.nvim"}, event = "VeryLazy", ft = {"org"}, config = _1_}}
