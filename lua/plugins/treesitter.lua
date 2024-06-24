return {
    "nvim-treesitter/nvim-treesitter",
    -- automatically update the parsers with every new release of treesitter
    build = ":TSUpdate",

    -- since treesitter's setup call is `require("nvim-treesitter.configs").setup`,
    -- instead of `require("nvim-treesitter").setup` like other plugins do, we
    -- need to tell lazy.nvim which module to via the `main` key
    main = "nvim-treesitter.configs",

    opts = {
        highlight = { enable = true }, -- enable treesitter syntax highlighting
        ensure_installed = {
            -- auto-install the Treesitter parser for python and related languages
            "python",
            "toml",
            "rst",
            "ninja",
            -- needed for formatting code-blockcs inside markdown via conform.nvim
            "markdown", 
            "markdown_inline", 
        },
    },
}