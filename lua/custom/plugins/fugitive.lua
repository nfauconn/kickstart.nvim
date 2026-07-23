vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status (Fugitive)' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git push (Fugitive)' })
