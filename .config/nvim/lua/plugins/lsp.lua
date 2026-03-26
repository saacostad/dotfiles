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
      local lspconfig    = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "ts_ls",
          "bashls",
        },

        -- v2 API: handlers go HERE, inside setup()
        handlers = {
          -- default handler for every server
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- custom handler for lua_ls
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr",         vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K",          vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
