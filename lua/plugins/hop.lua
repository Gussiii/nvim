return {
    "phaazon/hop.nvim",
     branch = "v2",
     config = function ()
         local hop = require("hop")
         hop.setup({
             keys = 'etovxqpdygfblzhckisuran',
             quit_key = '<ESC>',
             jump_on_sole_occurrence = true,
             case_insensitive = true,
             multi_windows = true,
         })
     end
 }
 