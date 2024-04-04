-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
--vim.keymap.set(
--    'n',
--    '[d',
--    vim.diagnostic.goto_prev,
--    { desc = 'Go to previous [D]iagnostic message' }
--)
--vim.keymap.set(
--    'n',
--    ']d',
--    vim.diagnostic.goto_next,
--    { desc = 'Go to next [D]iagnostic message' }
--)
--vim.keymap.set(
--    'n',
--    '<leader>e',
--    vim.diagnostic.open_float,
--    { desc = 'Show diagnostic [E]rror messages' }
--)
--vim.keymap.set(
--    'n',
--    '<leader>q',
--    vim.diagnostic.setloclist,
--    { desc = 'Open diagnostic [Q]uickfix list' }
--)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>ff', vim.cmd.Ex, { desc = 'Explorer' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up' })

-- Cursor stays at start of line after J
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Move lower line up' })

-- Keep cursor in center after half page jump
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })

-- Keep cursor in center on search terms
--vim.keymap.set("n", "n", "nzzzv", { desc = "Move down"})
--vim.keymap.set("n", "N", "Nzzzv", { desc = "Move down"})

vim.keymap.set(
    'x',
    '<leader>p',
    [["_dP]],
    { desc = 'Paste without overwriting' }
)
vim.keymap.set(
    { 'n', 'v' },
    '<leader>d',
    [["_d]],
    { desc = 'Delete without overwriting' }
)
vim.keymap.set(
    { 'n', 'v' },
    '<leader>y',
    [["+y]],
    { desc = 'Copy to clipboard' }
)
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy to clipboard' })

vim.keymap.set(
    { 'i', 'n' },
    '<C-c>',
    '<cmd>noh<cr><Esc>',
    { desc = 'Esc and clear hlsearch' }
)

-- Format file
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix
--vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- New tmux window
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set(
    'n',
    '<leader>r',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Global word replace' }
)

-- Make current file executable
vim.keymap.set(
    'n',
    '<leader>fx',
    '<cmd>!chmod +x %<CR>',
    { desc = 'Make file executable', silent = true }
)

-- Source
--vim.keymap.set("n", "<leader><leader>", function()
--  vim.cmd("so")
--end, { desc = "Source" })
