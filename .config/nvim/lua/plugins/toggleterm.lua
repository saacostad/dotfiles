-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping    = [[<C-\>]],
        direction       = "horizontal",
        size            = 15,
        shade_terminals = false,
        shell           = "/usr/bin/fish",

        -- auto-enter insert mode when opening/switching to terminal
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      local map = vim.keymap.set

      map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal" })
      map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Vertical terminal" })
      map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating terminal" })

      -- Ctrl+\ also exits terminal mode and toggles (smoother workflow)
      map("t", [[<C-\>]], [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = "Toggle terminal from inside" })

      -- navigate OUT of terminal to other splits
      map("t", "<C-a><Left>",  [[<C-\><C-n><C-w>h]])
      map("t", "<C-a><Down>",  [[<C-\><C-n><C-w>j]])
      map("t", "<C-a><Up>",    [[<C-\><C-n><C-w>k]])
      map("t", "<C-a><Right>", [[<C-\><C-n><C-w>l]])
    end,
  },
}
