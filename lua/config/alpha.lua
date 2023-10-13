return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
  
      -- Set header
      dashboard.section.header.val = {
        [[          _____                    _____                   _______                   _____                    _____                    _____          ]],
        [[         /\    \                  /\    \                 /::\    \                 /\    \                  /\    \                  /\    \         ]],
        [[        /::\____\                /::\    \               /::::\    \               /::\____\                /::\    \                /::\____\        ]],
        [[       /::::|   |               /::::\    \             /::::::\    \             /:::/    /                \:::\    \              /::::|   |        ]],
        [[      /:::::|   |              /::::::\    \           /::::::::\    \           /:::/    /                  \:::\    \            /:::::|   |        ]],
        [[     /::::::|   |             /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /                    \:::\    \          /::::::|   |        ]],
        [[    /:::/|::|   |            /:::/__\:::\    \       /:::/    \:::\    \       /:::/____/                      \:::\    \        /:::/|::|   |        ]],
        [[   /:::/ |::|   |           /::::\   \:::\    \     /:::/    / \:::\    \      |::|    |                       /::::\    \      /:::/ |::|   |        ]],
        [[  /:::/  |::|   | _____    /::::::\   \:::\    \   /:::/____/   \:::\____\     |::|    |     _____    ____    /::::::\    \    /:::/  |::|___|______  ]],
        [[ /:::/   |::|   |/\    \  /:::/\:::\   \:::\    \ |:::|    |     |:::|    |    |::|    |    /\    \  /\   \  /:::/\:::\    \  /:::/   |::::::::\    \ ]],
        [[/:: /    |::|   /::\____\/:::/__\:::\   \:::\____\|:::|____|     |:::|    |    |::|    |   /::\____\/::\   \/:::/  \:::\____\/:::/    |:::::::::\____\]],
        [[\::/    /|::|  /:::/    /\:::\   \:::\   \::/    / \:::\    \   /:::/    /     |::|    |  /:::/    /\:::\  /:::/    \::/    /\::/    / ~~~~~/:::/    /]],
        [[ \/____/ |::| /:::/    /  \:::\   \:::\   \/____/   \:::\    \ /:::/    /      |::|    | /:::/    /  \:::\/:::/    / \/____/  \/____/      /:::/    / ]],
        [[         |::|/:::/    /    \:::\   \:::\    \        \:::\    /:::/    /       |::|____|/:::/    /    \::::::/    /                       /:::/    /  ]],
        [[         |::::::/    /      \:::\   \:::\____\        \:::\__/:::/    /        |:::::::::::/    /      \::::/____/                       /:::/    /   ]],
        [[         |:::::/    /        \:::\   \::/    /         \::::::::/    /         \::::::::::/____/        \:::\    \                      /:::/    /    ]],
        [[         |::::/    /          \:::\   \/____/           \::::::/    /           ~~~~~~~~~~               \:::\    \                    /:::/    /     ]],
        [[         /:::/    /            \:::\    \                \::::/    /                                      \:::\    \                  /:::/    /      ]],
        [[        /:::/    /              \:::\____\                \::/____/                                        \:::\____\                /:::/    /       ]],
        [[        \::/    /                \::/    /                 ~~                                               \::/    /                \::/    /        ]],
        [[         \/____/                  \/____/                                                                    \/____/                  \/____/         ]]
        }
  
      -- Set menu
    --   dashboard.section.buttons.val = {
    --     dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
    --     dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
    --     dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
    --     dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    --     dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
    --     dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    --   }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
  
      -- Send config to alpha
      alpha.setup(dashboard.opts)
  
      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
  }