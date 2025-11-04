vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("options")

require("mappings")

require("config.lazy")
require("autocommands")

vim.cmd("colorscheme kanagawa-dragon")
