--vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local wk = require("which-key")
wk.register({
    g = {
        s = { vim.cmd.Git, "View Git Status for Workspace"},
    },
}, { prefix = "<leader>" })

