return {
    {
        'eriks47/generate.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            vim.keymap.set(
                'n',
                '<leader>gi',
                '<cmd>Generate implementations<cr>',
                { desc = '[G]enerate [I]mplementation for c++ header' }
            )
        end,
    },
}
