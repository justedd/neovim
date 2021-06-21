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

require "pears".setup()

saga.init_lsp_saga({})






