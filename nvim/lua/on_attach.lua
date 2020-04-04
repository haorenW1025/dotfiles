local M = {}

M.on_attach = function()
  require'diagnostic'.on_attach()
  require'completion'.on_attach()
end

return M
