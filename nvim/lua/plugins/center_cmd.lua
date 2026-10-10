return{
  "rachartier/tiny-cmdline.nvim",
  init = function()
    vim.o.cmdheight = 0
  end,
  config = function()
    require("tiny-cmdline").setup({
      width = { value = "35%" },
    })
  end,
}

