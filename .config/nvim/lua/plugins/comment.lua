-- [nfnl] Compiled from fnl/plugins/comment.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(opts)
  local commenter = require("Comment")
  local ft = require("Comment.ft")
  commenter.setup(opts)
  return ft.set("fennel", ";%s")
end
return {{"numToStr/Comment.nvim", opts = {}, config = _1_}}
