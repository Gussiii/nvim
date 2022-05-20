vim.opt.relativenumber=true
vim.opt.autoindent=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.smarttab=true
vim.opt.softtabstop=4
vim.opt.mouse="a"
vim.opt.backspace=indent,eol,start

-- Conditional Options for file types
vim.api.nvim_create_autocmd('FileType',{
    pattern = 'markdown',
    command = 'setlocal spell'
})

