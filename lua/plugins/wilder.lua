return {
"gelguy/wilder.nvim",

config = function ()
    local wilder = require("wilder")
    wilder.setup({
        modes = {':', '/', '?'},
       next_key = '<Tab>',
       previous_key =  '<S-Tab>',
       accept_key = '<Down>',
       reject_key ='<Up>',
       })

    wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline(),
        wilder.search_pipeline()
    ),
    })
    
    wilder.set_option('renderer', wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
    }))
end

}