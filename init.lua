vim.cmd[[set termguicolors]]
vim.cmd[[set number]]

-- IMPORTS (lua/)
require("config.lazy")
require("plugins")
require("remap")

vim.cmd("colorscheme everforest")
--vim.cmd[[colorscheme kanagawa]]
--vim.cmd("colorscheme kanagawa-wave")

vim.opt.shell = '/usr/bin/zsh'

