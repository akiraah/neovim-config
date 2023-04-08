require('telescope').setup()
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
"n",
"<space>fb",
":Telescope file_browser",
{ noremap = true }
)
