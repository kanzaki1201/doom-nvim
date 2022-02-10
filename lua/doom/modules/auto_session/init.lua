local auto_session = {}

auto_session.defaults = {
  dir = vim.fn.stdpath("data") .. "/sessions/",
}

auto_session.packages = {
  ["persistence.nvim"] = {
    "folke/persistence.nvim",
    commit = "77cf5a6ee162013b97237ff25450080401849f85",
  },
}

auto_session.configure_functions = {}
auto_session.configure_functions["persistence.nvim"] = function()
  require("persistence").setup(doom.auto_session)
end

auto_session.binds = {
  "<leader>",
  name = "+prefix",
  {
    {
      "q",
      name = "+quit",
      {
        {
          "r",
          function()
            require("persistence").load({ last = true })
          end,
          name = "Restore session",
        },
      },
    },
  },
}

return auto_session
