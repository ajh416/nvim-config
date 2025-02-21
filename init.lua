vim.cmd[[set termguicolors]]
vim.cmd[[set number]]

-- IMPORTS (lua/)
require("config.lazy")
require("plugins")
require("remap")

-- THE THEMES
--vim.cmd("colorscheme everforest")
--vim.cmd("colorscheme kanagawa-wave")
--vim.cmd("colorscheme carbonfox")
--vim.cmd("colorscheme terafox")
vim.cmd("colorscheme nightfox")
--vim.cmd("colorscheme onedark") -- adjust the style in after/plugin/onedark.lua

-- With no other theme set, this is default
--vim.cmd("colorscheme onenord")

-- SET THE SHELL, JUST IN CASE
vim.opt.shell = '/usr/bin/zsh'
