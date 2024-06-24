return {
    "danymat/neogen",
    opts = true,
    keys = {
        {
            "<leader>st",
            function() require("neogen").generate() end,
            desc = "Add Docstring",
        },
    },
}