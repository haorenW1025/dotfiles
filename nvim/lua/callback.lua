local vim = vim
local api = vim.api
local log = require 'vim.lsp.log'
local util = require 'vim.lsp.util'
local buf = require 'vim.lsp.buf'

local M = {}

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

local function peek_definition(_, _, result)
  current_win = api.nvim_tabpage_get_win(0)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(method, 'No location found')
    return nil
  end
  if M.win_handler == nil or not api.nvim_win_is_valid(M.win_handler) then
    M.win_handler = api.nvim_open_win(0, true, {relative='cursor', width=100, height=40, row=-20, col=10})
  else
    return
  end
  util.jump_to_location(result[1])
  api.nvim_command("normal zt")
  api.nvim_command("wincmd p")
  if #result > 1 then
    util.set_qflist(util.locations_to_items(result))
    api.nvim_command("botright copen")
    api.nvim_set_current_win(current_win)
  end
  api.nvim_command("autocmd CursorMoved * ++once lua pcall(vim.api.nvim_win_close, "..M.win_handler..", true)")
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

local function request(method, params, callback)
  return vim.lsp.buf_request(0, method, params, callback)
end

function buf.peek_definition()
  local params = util.make_position_params()
  request('textDocument/definition', params, peek_definition)
end
