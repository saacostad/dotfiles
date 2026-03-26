-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local none = { bg = "NONE" }

      require("bufferline").setup({
        options = {
          mode            = "buffers",
          separator_style = "thin",   -- "thin" looks cleaner with transparency
          diagnostics     = "nvim_lsp",
          offsets = {
            {
              filetype  = "NvimTree",
              text      = " Files",
              highlight = "Directory",
              separator = true,
            },
          },
        },
        highlights = {
          fill                      = none,
          background                = none,
          tab                       = none,
          tab_selected              = none,
          tab_separator             = none,
          tab_separator_selected    = none,
          tab_close                 = none,
          close_button              = none,
          close_button_visible      = none,
          close_button_selected     = none,
          buffer_visible            = none,
          buffer_selected           = { bg = "NONE", bold = true, italic = false },
          separator                 = { bg = "NONE", fg = "#504945" },
          separator_selected        = { bg = "NONE", fg = "#504945" },
          separator_visible         = { bg = "NONE", fg = "#504945" },
          indicator_selected        = { bg = "NONE", fg = "#d4be98" },
          indicator_visible         = none,
          modified                  = none,
          modified_visible          = none,
          modified_selected         = none,
          duplicate                 = none,
          duplicate_selected        = none,
          duplicate_visible         = none,
          offset_separator          = none,
          diagnostic                = none,
          diagnostic_visible        = none,
          diagnostic_selected       = none,
        },
      })

      local map = vim.keymap.set
      map("n", "<Tab>",      "<cmd>BufferLineCycleNext<cr>",   { desc = "Next buffer tab" })
      map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>",   { desc = "Previous buffer tab" })
      map("n", "<leader>bc", "<cmd>bdelete<cr>",               { desc = "Close buffer" })
      map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
    end,
  },
}
