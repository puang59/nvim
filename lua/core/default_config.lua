local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,
    header = {
      [[                                                                   ]],
      [[ ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ]],
      [[ ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ]],
      [[ ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
      [[ ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
      [[ ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
      [[ ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ]],
      [[ ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ]],
      [[  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ]],
      [[                                                                   ]],
    },
    -- header = {
    --   [[                                                   ]],
    --   [[                                              ___  ]],
    --   [[                                           ,o88888 ]],
    --   [[                                        ,o8888888' ]],
    --   [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
    --   [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
    --   [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
    --   [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
    --   [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
    --   [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
    --   [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
    --   [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
    --   [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
    --   [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
    --   [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
    --   [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
    --   [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
    --   [[     ...:.'.:.::::"'    . . . . .'                 ]],
    --   [[    .. . ....:."' `   .  . . ''                    ]],
    --   [[  . . . ...."'                                     ]],
    --   [[  .. . ."'                                         ]],
    --   [[ .                                                 ]],
    --   [[                                                   ]],
    -- },    -- header = {
    --   "           ▄ ▄                   ",
    --   "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    --   "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    --   "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    --   "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    --   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    --   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    --   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    --   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    -- },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = {}

return M
