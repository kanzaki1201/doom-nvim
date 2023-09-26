--- @class config
local config = {}

local configuration = {
  cursor_coloring = false,
  terminal_colors = false,
  italic_comments = true,
  enable_treesitter = true,
  transparent_background = true,
  pumblend = {
    enable = true,
    transparency_amount = 20,
  },
  plugins_integrations = {
    neorg = true,
    barbar = true,
    bufferline = true,
    gitgutter = true,
    gitsigns = true,
    telescope = true,
    neogit = true,
    nvim_tree = true,
    dashboard = true,
    startify = true,
    whichkey = true,
    indent_blankline = true,
    lspsaga = true,
  },
}

--- Get a configuration value
--- @param opt string
--- @return any
config.get = function(opt)
  if opt then
    return configuration[opt]
  end
  return configuration
end

--- Set user-defined configurations
--- @param user_configs table
--- @return table
config.set = function(user_configs)
  vim.validate({ user_configs = { user_configs, "table" } })

  configuration = vim.tbl_deep_extend("force", configuration, user_configs)
  return configuration
end

return config
