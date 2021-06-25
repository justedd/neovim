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

--require "pears".setup()
require('nvim-autopairs').setup()


saga.init_lsp_saga({})



local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end


remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})


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
