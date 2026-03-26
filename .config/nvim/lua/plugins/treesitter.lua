-- ~/.config/nvim/lua/plugins/treesitter.lua


return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua", "python", "c", "cpp", "javascript",
          "typescript", "bash", "html", "css", "json", "markdown",
        },
      })
    end,
  },
}
