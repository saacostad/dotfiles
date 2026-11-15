return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "none",
          show_buffer_close_icons = false,
          show_close_icon = false,
          diagnostics = "nvim_lsp",

          offsets = {
            {
              filetype = "NvimTree",
              text = "Directory",
              highlight = "Directory",
              separator = false,
            },
          },
        },
      })

      local map = vim.keymap.set
      map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
      map("n", "<A-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
      map("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close buffer" })
    end,
  },
}
