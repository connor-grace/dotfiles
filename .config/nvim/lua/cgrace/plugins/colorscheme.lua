return {
    --{
    --    'folke/tokyonight.nvim',
    --    lazy = false,
    --    priority = 1000,
    --    opts = {},
    --    init = function()
    --        vim.cmd.colorscheme 'tokyonight-storm'
    --    end,
    --},
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd.colorscheme 'nordfox'
        end,
    },
    --{
    --    'ellisonleao/gruvbox.nvim',
    --    priority = 1000,
    --    config = true,
    --    opts = {},
    --    init = function()
    --        vim.cmd.colorscheme 'gruvbox'
    --    end,
    --},
}
