-- ~/.config/nvim/lua/config/

require("config/packages")

vim.cmd("source ./nvim/lua/config/basic.vim")
vim.cmd("source ./nvim/lua/config/preferences.vim")
vim.cmd("source ./nvim/lua/config/mappings.vim")

require("config/clipboard")
require("config/packages-preferences")
require("config/debuggers-configuration")
-- vim.cmd("autocmd VimEnter * call timer_start(200, { tid -> execute('q')})")
