vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false})
vim.g.mapleader = " "
vim.g.maplocalleader="\\"

-- General keymaps
vim.keymap.set("n", "<Enter>", "o<ESC>k")
vim.keymap.set("n", "<S-Enter>", "O<ESC>j")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('i', '<C-j>', '<Esc>jgi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Esc>kgi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<Esc>hgi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<Esc>lgi', { noremap = true, silent = true })

vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", '<C-r>+', { noremap = true, silent = true })


-- "Bad habits"
vim.keymap.set('n', '<PageUp>', '<Nop>', { noremap = true, silent = true }) -- Use <C-u> / <C-b>
vim.keymap.set('n', '<PageDown>', '<Nop>', { noremap = true, silent = true }) -- Use <C-d> / <C-f>
