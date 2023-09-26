-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- Fix for windows
-- require 'nvim-treesitter.install'.compilers = { "clang" }

-- ADDING A PACKAGE
--
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
doom.use_package({
  "ur4ltz/surround.nvim",
  config = function()
    require("surround").setup({mappings_style = "sandwich"})
  end
})

doom.use_package({
  "luk400/vim-jukit",
})


doom.use_package({
  "nvim-orgmode/orgmode",
  config = function()
    require('orgmode').setup_ts_grammar()
      -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = 'C:\\Users\\Lain\\logseqsecondbrain\\**\\*',
    })
  end
})
-- run :TSUpdate orgmode for the first time

-- orgmode autocomplete
-- require'nvim-cmp'.setup({
--   sources = {
--     { name = 'orgmode' }
--   }
-- })
--

doom.use_package({
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    local keymap = vim.keymap.set
    -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
    keymap(
      "i",
      "<C-g>",
      'copilot#Accept("<CR>")',
      { silent = true, expr = true, script = true, replace_keycodes = false }
    )
    keymap("i", "<C-j>", "<Plug>(copilot-next)")
    keymap("i", "<C-k>", "<Plug>(copilot-previous)")
    keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
    keymap("i", "<C-f>", "<Plug>(copilot-suggest)")
  end
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
