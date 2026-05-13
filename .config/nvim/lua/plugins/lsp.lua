-- ~/.config/nvim/lua/plugins/lsp.lua
-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim", 
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "bashls",
	  "textlsp"
        },
      })
    end 
  },
  {
	"neovim/nvim-lspconfig",
	vim.lsp.enable("harper_ls");
	vim.lsp.enable("lua_ls");
	vim.lsp.enable("clangd");
	vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
  }

}
