local treesitter = require'nvim-treesitter.configs'
local lsp = require'nvim_lsp'

if vim.env.SNIPPETS then
  vim.snippet = require 'snippet'
end

-- treesitter setup
treesitter.setup {
  highlight = {
    enable = false,
    -- disable = { 'c', 'rust' },
  },
  incremental_selection = {
    enable = true,
    -- disable = { 'cpp', 'lua' },
    keymaps = {
      node_incremental = "grn",
      scope_incremental = "grc"
    }
  },
  node_movement = {
    enable = true,
    keymaps = {
      move_up = "[N",
      move_down = "]N",
      move_left = "[n",
      move_right = "]n",
    }
  },
  ensure_installed = {'c', 'cpp', 'lua', 'rust'}
}

-- lsp setup
lsp.sumneko_lua.setup{
  on_attach= require'on_attach'.on_attach;
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Disable";
      };
    runtime = {
        version = "LuaJIT";
      };
    };
  };
}

lsp.vimls.setup{
  on_attach = require'on_attach'.on_attach;
}

lsp.pyls.setup{
  on_attach = require'on_attach'.on_attach;
  settings = {
    pyls = {
      plugins = {
        pylint = { enabled = false; },
        pycodestyle = { enabled = false; },
      }
    }
  }
}

-- lsp.pyls_ms.setup{
  -- on_attach = require'on_attach'.on_attach;
-- }

lsp.clangd.setup{
  on_attach = require'on_attach'.on_attach;
}

lsp.rust_analyzer.setup{
  on_attach = require'on_attach'.on_attach;
}

lsp.metals.setup{
  on_attach = require'on_attach'.on_attach;
}

local metals = require'metals'
require'nvim_lsp'.metals.setup{
    on_attach = require'on_attach'.on_attach;
    callbacks = {
        ["textDocument/hover"] = metals.hover_wrap;
    };
}


lsp.tsserver.setup{
  -- on_attach = require'on_attach'.on_attach;
}


