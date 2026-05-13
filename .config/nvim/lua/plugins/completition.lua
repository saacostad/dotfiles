-- ~/.config/nvim/lua/plugins/completion.lua
return {
   {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
	
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
  require("todo-comments").setup({
   highlight = {
    comments_only = false,
    before  = "fg",
    keyword = "fg",
    after   = "fg",
  },
  colors = {
    error   = { "#f38ba8" }, -- Red
    warning = { "#fab387" }, -- Peach
    info    = { "#89b4fa" }, -- Blue
    hint    = { "#94e2d5" }, -- Teal
    default = { "#cba6f7" }, -- Mauve
    test    = { "#a6e3a1" }, -- Green
  },
  })
  vim.cmd([[highlight clear Todo]])
  end,
}
}
