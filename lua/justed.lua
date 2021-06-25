local saga = require 'lspsaga'

--require'lsp_signature'.on_attach()

-- TODO: understand how to not show the diagnostics
require'lspconfig'.solargraph.setup{
  on_attach = function(client)
    require'lsp_signature'.on_attach()
  end, 
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
}

require'lspconfig'.rust_analyzer.setup{
  cmd = { "/home/justed/core/apps/rust-analyzer" },
  --settings = {
    --["rust-analyzer"] = {
      --["diagnostics.enable"] = false
    --}
  --}
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual_text
        virtual_text = false,
        signs = false
      }
    )
  },
}

saga.init_lsp_saga({})

require('telescope').setup {
  defaults = {
    prompt_prefix = "(╯°□°）╯ >>> ",
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')

local justed = {
  mappings = {}
}

justed.mappings.telescope_snippets = function()
  local options = require('telescope.themes').get_dropdown()

  require('telescope').extensions.ultisnips.ultisnips(options)
end

return justed
