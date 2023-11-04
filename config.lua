-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
doom.use_package({
  "ur4ltz/surround.nvim",
  config = function()
    require("surround").setup({ mappings_style = "surround" })
  end,
})

-- Sane jk behaviour
doom.use_keybind({
  {
    { "j", "gj" },
    { "k", "gk" },
  },
})

doom.use_keybind({
  -- The `name` field will add the keybind to whichkey
  {
    "<leader>t",
    name = "+tweak/toggle",
    {
      -- Bind to a vim command
      { "w", "<cmd>set wrap!<CR>", name = "Toggle word wrap" },
    },
  },
})

doom.use_package({
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
  end,
})
doom.use_keybind({
  { "<Space>", "<Nop>" },
  -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
  {
    mode = "i",
    {
      {
        options = { expr = true, script = true, replace_keycodes = false },
        {
          { "<C-g>",  'copilot#Accept("<CR>")' },
          { "<C-CR>", 'copilot#Accept("<CR>")' },
        },
      },
      { "<C-j>", "<Plug>(copilot-next)" },
      { "<C-k>", "<Plug>(copilot-previous)" },
      { "<C-o>", "<Plug>(copilot-dismiss)" },
      { "<C-f>", "<Plug>(copilot-suggest)" },
    },
  },
})

doom.use_package({
  "jackMort/ChatGPT.nvim",
  config = function()
    require("chatgpt").setup({})
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
})

-- ADDING A KEYBIND
--
-- doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--     -- Or to a lua function
--     {"p", function()
--       print("Not implemented yet")
--     end, name = ""}
--   }}
-- })
-- doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--   }}
-- })

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

-- vim: sw=2 sts=2 ts=2 expandtab
