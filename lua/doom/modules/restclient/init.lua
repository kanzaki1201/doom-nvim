local restclient = {}

restclient.defaults = {}

restclient.packages = {
  ["rest.nvim"] = {
    "NTBBloodbath/rest.nvim",
    commit = "2826f6960fbd9adb1da9ff0d008aa2819d2d06b3",
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
  },
}


restclient.configure_functions = {}
restclient.configure_functions["rest.nvim"] = function()
  require("rest-nvim").setup(doom.restclient)
end

restclient.binds = {
  { "<F7>", "<cmd>RestNvim<CR>", name = "Open http client" },
  {
    "<leader>",
    name = "+prefix",
    {
      {
        "o",
        name = "+open/close",
        {
          { "h", "<cmd>RestNvim<CR>", name = "Http" },
        },
      },
    },
  }
}

return restclient
