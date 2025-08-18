return {
    'stevearc/aerial.nvim',
    lazy = true,
    keys = {
        {
            '<leader>ts',
            function()
                local function is_ft_open(ft)
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].filetype == ft then
                            return true
                        end
                    end
                    return false
                end

                if is_ft_open('NvimTree') then
                    if package.loaded['nvim-tree'] or package.loaded['nvim-tree.api'] then
                        pcall(function()
                            require('nvim-tree.api').tree.close()
                        end)
                    else
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            local buf = vim.api.nvim_win_get_buf(win)
                            if vim.bo[buf].filetype == 'NvimTree' then
                                pcall(vim.api.nvim_win_close, win, true)
                            end
                        end
                    end
                end

                require('aerial').toggle { direction = 'right' }
            end,
            desc = 'Toggle symbols outline (right)',
        },
    },
    opts = {
        layout = {
            default_direction = 'right',
            placement = 'edge',
            min_width = 30,
            max_width = { 50, 0.3 },
        },
        show_guides = true,
        manage_folds = false,
        link_folds_to_tree = false,
        link_tree_to_folds = false,
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
