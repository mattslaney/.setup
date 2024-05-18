vim.g.undotree_WindowLayout = 3

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local wk = require("which-key")
wk.register({
    u = "Toggle undo tree"
}, { prefix = "<leader>" })

