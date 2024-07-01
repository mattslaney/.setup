-- Return to Project View ⌴pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted lines up and down in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join line, retain cursor posistion
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumps with scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Navigate search with scrolling
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- Paste whilst retaining buffer
vim.keymap.set("x", " p", "\"_dP")

-- Copies to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- 
vim.keymap.set("n", "Q", "<nop>")

-- Replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Reload current file from disk
vim.keymap.set("n", "<C-F3>", ":e!<CR>")
-- Save file
vim.keymap.set("n", "<C-s>", ":up<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:up<CR>gi")
-- New File
vim.keymap.set("n", "<C-M-n>", ":e %:h/")
-- New Directory
vim.keymap.set("n", "<C-M-d>", ":!mkdir %:h/")

