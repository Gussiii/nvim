-- vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/prjs/jupy_test/.virtualenvs/neovim/bin/python3"

local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs({ "config", "data", "state", "cache" }) do
  vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }}, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})


-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
-- vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
-- vim.g.molten_wrap_output = true

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
-- vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
-- vim.g.molten_virt_lines_off_by_1 = true

-- vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
-- vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
-- vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
-- vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
-- vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
-- vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"


local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<localleader>RA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })

-- change the configuration when editing a python file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function(e)
    if string.match(e.file, ".otter.") then
      return
    end
    -- if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
    --   vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
    --   vim.fn.MoltenUpdateOption("virt_text_output", false)
    -- else
    --   vim.g.molten_virt_lines_off_by_1 = false
    --   vim.g.molten_virt_text_output = false
    -- end
  end,
})

-- Undo those config changes when we go back to a markdown or quarto file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.qmd", "*.md", "*.ipynb" },
  callback = function(e)
    if string.match(e.file, ".otter.") then
      return
    end
    if require("molten.status").initialized() == "Molten" then
      vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
      vim.fn.MoltenUpdateOption("virt_text_output", true)
    else
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_output = true
    end
  end,
})