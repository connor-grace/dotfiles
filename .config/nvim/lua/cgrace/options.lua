vim.g.mapleader = ' '

-- Hide the default Neovim intro message on start
vim.opt.shortmess:append 'I'
vim.opt.termguicolors = true
vim.opt.guicursor = ''
vim.opt.mouse = 'a'
vim.opt.updatetime = 50
--
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.isfname:append '@-@'

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.opt.clipboard = 'unnamedplus'

--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
