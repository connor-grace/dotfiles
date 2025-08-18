return {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    keys = {
        {
            '<leader>tt',
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

                if is_ft_open('aerial') then
                    if package.loaded['aerial'] then
                        pcall(function()
                            require('aerial').close()
                        end)
                    else
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            local buf = vim.api.nvim_win_get_buf(win)
                            if vim.bo[buf].filetype == 'aerial' then
                                pcall(vim.api.nvim_win_close, win, true)
                            end
                        end
                    end
                end

                require('nvim-tree.api').tree.toggle { focus = true }
            end,
            desc = 'Toggle file tree (right)',
        },
    },
    opts = {
        view = {
            side = 'right',
        },
        renderer = {
            group_empty = true,
        },
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = false,
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
