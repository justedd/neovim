local saga = require 'lspsaga'

-- TODO: understand how to not show the diagnostics
require'lspconfig'.solargraph.setup{
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
}

require('nvim-autopairs').setup()

saga.init_lsp_saga({
})
