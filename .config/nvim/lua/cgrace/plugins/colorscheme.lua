return {
    -- {
    --     'EdenEast/nightfox.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     init = function()
    --         vim.cmd.colorscheme 'nordfox'
    --     end,
    -- },
    -- {
    --     'sainnhe/gruvbox-material',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Optionally configure and load the colorscheme
    --         -- directly inside the plugin declaration.
    --         vim.g.gruvbox_material_background = 'hard'
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.cmd.colorscheme('gruvbox-material')
    --     end
    -- },
    -- {
    --     'sainnhe/sonokai',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Optionally configure and load the colorscheme
    --         -- directly inside the plugin declaration.
    --         vim.g.sonokai_style = 'shusia'
    --         vim.g.sonokai_enable_italic = true
    --         vim.cmd.colorscheme('sonokai')
    --     end
    -- },
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.cmd.colorscheme('kanagawa-dragon')
        end
    },
}
