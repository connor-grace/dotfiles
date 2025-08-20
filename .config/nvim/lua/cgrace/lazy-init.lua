local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    spec = {
        --"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

        require 'cgrace/plugins/blink-cmp',
        require 'cgrace/plugins/colorscheme',
        require 'cgrace/plugins/conform',
        require 'cgrace/plugins/generate',
        require 'cgrace/plugins/gitsigns',
        require 'cgrace/plugins/harpoon',
        require 'cgrace/plugins/aerial',
        require 'cgrace/plugins/nvim-tree',
        require 'cgrace/plugins/oil',
        --require 'cgrace/plugins/indent_blankline',
        --require 'cgrace/plugins/lint',
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
        colorscheme = { 'kanagawa-dragon' },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = { notify = false },
}
