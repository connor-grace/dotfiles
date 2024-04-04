local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    spec = {
        --"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

        require 'cgrace/plugins/cmp',
        require 'cgrace/plugins/colorscheme',
        require 'cgrace/plugins/conform',
        require 'cgrace/plugins/gitsigns',
        require 'cgrace/plugins/harpoon',
        require 'cgrace/plugins/indent_line',
        require 'cgrace/plugins/lspconfig',
        require 'cgrace/plugins/mini',
        require 'cgrace/plugins/noice',
        require 'cgrace/plugins/telescope',
        require 'cgrace/plugins/todo-comments',
        require 'cgrace/plugins/treesitter',
        require 'cgrace/plugins/which-key',

        --  Uncomment the following line and add your plugins to `lua/cgrace/plugins/*.lua` to get going.
        --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
        -- { import = "custom.plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        missing = true,
        colorscheme = { 'tokyonight' },
    },
    checker = {
        enabled = true,
    },
}
