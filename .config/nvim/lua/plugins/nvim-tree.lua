-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = { file = true, folder = true, folder_arrow = true, git = true },
          },
        },
        filters = { dotfiles = false },
        git     = { enable = true, ignore = false },
      })

      -- force nvim-tree to inherit transparency after it loads
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function()
          vim.api.nvim_set_hl(0, "NvimTreeNormal",       { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeNormalNC",      { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",   { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeWinSeparator",  { bg = "NONE", fg = "#504945" })
          vim.api.nvim_set_hl(0, "NvimTreeCursorLine",    { bg = "#3c3836" }) -- subtle line highlight
        end,
      })

      vim.keymap.set("n", "<S-Tab>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", { desc = "Find current file in tree" })
    end,
  },
}
