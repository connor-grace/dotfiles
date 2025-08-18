return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        default_file_explorer = true,
        columns = { 'icon' },
        view_options = { show_hidden = true },
        skip_confirm_for_simple_edits = true,

        use_default_keymaps = false,
        keymaps = {
            ['g?'] = { 'actions.show_help', mode = 'n' },
            ['<CR>'] = 'actions.select',

            ['<C-v>'] = {
                'actions.select',
                opts = {
                    vertical = true,
                    close = true,
                },
                mode = 'n',
                nowait = true,
            },
            ['<C-x>'] = {
                'actions.select',
                opts = {
                    horizontal = true,
                    close = true,
                },
                mode = 'n',
                nowait = true,
            },
            ['<C-t>'] = {
                'actions.select',
                opts = { tab = true },
                mode = 'n',
                nowait = true,
            },

            ['<C-p>'] = 'actions.preview',
            ['<C-c>'] = { 'actions.close', mode = 'n' },
            ['<C-l>'] = 'actions.refresh',
            ['-'] = { 'actions.parent', mode = 'n' },
            ['_'] = { 'actions.open_cwd', mode = 'n' },
            ['`'] = { 'actions.cd', mode = 'n' },
            ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
            ['gs'] = { 'actions.change_sort', mode = 'n' },
            ['gx'] = 'actions.open_external',
            ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
            ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
        },
    },
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            cond = function()
                return vim.g.have_nerd_font
            end,
        },
    },
}
