-- Keymaps

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Convenience
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>x', ':bd<CR>')


-- NVim Tree
vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
vim.keymap.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>')
vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
