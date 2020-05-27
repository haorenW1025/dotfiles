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
  ensure_installed = {'c', 'cpp', 'lua', 'rust'}
}

local on_attach = function(client)
  require'lsp_status'.on_attach(client)
  require'diagnostic'.on_attach()
  require'completion'.on_attach({
      sorter = 'alphabet',
      matcher = {'exact', 'fuzzy'}
    })
end


-- lsp setup
lsp.sumneko_lua.setup{
  on_attach= on_attach;
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Disable";
      };
      runtime = {
        version = "LuaJIT";
        };
      diagnostics={
        enable=true,
        globals={
          "vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"
        },
      },
    },
  };
}

lsp.vimls.setup{
  on_attach = on_attach;
}

lsp.pyls.setup{
  on_attach = on_attach;
  settings = {
    pyls = {
      plugins = {
        pycodestyle = { enabled = false; },
      }
    }
  }
}

-- lsp.pyls_ms.setup{
  -- on_attach = require'on_attach'.on_attach;
-- }

lsp.clangd.setup{
  on_attach = on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true
  }
}

lsp.rust_analyzer.setup{
  on_attach = on_attach;
}

lsp.metals.setup{
  on_attach = on_attach;
}

lsp.intelephense.setup{
  -- cmd = {'/usr/bin/intelephense', '--stdio'}
  on_attach = on_attach;
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true
  }
}

-- local metals = require'metals'

