-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('media_files')

telescope.setup {
  defaults = {
    prompt_prefix = "(╯°□°）╯ >>> ",
    path_display = { "truncate" },
    dynamic_preview_title = true
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

local justed = {
  mappings = {}
}

--require('gitsigns').setup()


require("indent_blankline").setup {
    char = '▏',
    buftype_exclude = {"terminal"}
}

require('justed_statusline')


local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_root_path = '/home/justed/core/apps/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

  -- Setup nvim-cmp.
local cmp = require'cmp'

require("copilot").setup()

cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-n>'] = function ()
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_next_item()
      end
    end,
    ['<C-p>'] = function ()
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_prev_item()
      end
    end,
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    {
      name = 'copilot',
      keyword_length = 0,
      group_index = 1,
    },
    {
      name = 'nvim_lsp',
      group_index = 1,
    },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'vim-dadbod-completion' },
  }, {
    {
      name = 'buffer',
      max_item_count = 5,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      },
    },
  })
})

-- TODO: understand how to not show the diagnostics
require'lspconfig'.solargraph.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        underline = false
      }
    )
  },
  on_attach = function()
    -- remap documentation only for current buffer
    -- second press moves you to the documentation window
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  end
}

require'lspconfig'.rust_analyzer.setup{
  cmd = { "/home/justed/core/apps/rust-analyzer" },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false
      }
    )
  },
}

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false
      }
    )
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

return justed
