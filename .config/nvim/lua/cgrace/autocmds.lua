-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Start vim in Explore mode',
  group = vim.api.nvim_create_augroup('explore-mode', { clear = true }),
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd ':Explore'
    end
  end,
})
