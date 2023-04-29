vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "<C-w>w")

-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor stays at start of line after J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in center after half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in center on search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without overwriting buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- New tmux window
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Global search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
