-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'zbirenbaum/copilot.lua'

  --use {
    --"zbirenbaum/copilot.lua",
    --event = {"VimEnter"},
    --config = function()
      --vim.defer_fn(function()
        --require("copilot").setup({
          ----server_opts_overrides = { trace = "verbose", name = "AI" },
        --})
      --end, 100)
    --end,
  --}

  use 'zbirenbaum/copilot-cmp'
  --use {
    --"zbirenbaum/copilot-cmp",
    --after = { "copilot.lua", "nvim-cmp" },
  --}
end)
