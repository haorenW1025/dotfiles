local vim = vim
local api = vim.api
local log = require 'vim.lsp.log'
local util = require 'vim.lsp.util'

local function open_quickfix()
  api.nvim_command("botright copen")
  api.nvim_command("wincmd p")
end

local function location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(method, 'No location found')
    return nil
  end
  util.jump_to_location(result[1])
  if #result > 1 then
    util.set_qflist(util.locations_to_items(result))
    api.nvim_command("botright copen")
    api.nvim_command("wincmd p")
  end
end

vim.lsp.callbacks['textDocument/references'] = location_callback
vim.lsp.callbacks['textDocument/declaration'] = location_callback
vim.lsp.callbacks['textDocument/definition'] = location_callback
vim.lsp.callbacks['textDocument/typeDefinition'] = location_callback
vim.lsp.callbacks['textDocument/implementation'] = location_callback
vim.lsp.callbacks['textDocument/documentSymbol'] = function(_, _, result, _, bufnr)
  if not result or vim.tbl_isempty(result) then return end

  util.set_qflist(util.symbols_to_items(result, bufnr))
  open_quickfix()
end

