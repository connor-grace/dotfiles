return {
    'ThePrimeagen/harpoon',
    lazy = false,
    branch = 'harpoon2',
    init = function()
        local harpoon = require 'harpoon'

        harpoon:setup()

        vim.keymap.set('n', '<leader>a', function()
            harpoon:list():add()
        end, { desc = 'harpoon file' })
        vim.keymap.set('n', '<C-e>', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'harpoon menu' })

        vim.keymap.set('n', '<leader>1', function()
            harpoon:list():select(1)
        end, { desc = 'harpoon switch 1' })
        vim.keymap.set('n', '<leader>2', function()
            harpoon:list():select(2)
        end, { desc = 'harpoon switch 2' })
        vim.keymap.set('n', '<leader>3', function()
            harpoon:list():select(3)
        end, { desc = 'harpoon switch 3' })
        vim.keymap.set('n', '<leader>4', function()
            harpoon:list():select(4)
        end, { desc = 'harpoon switch 4' })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
            harpoon:list():prev()
        end, { desc = 'harpoon previous' })
        vim.keymap.set('n', '<C-S-N>', function()
            harpoon:list():next()
        end, { desc = 'harpoon next' })
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
}
