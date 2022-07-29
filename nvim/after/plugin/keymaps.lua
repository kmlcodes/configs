-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Insert blank line
keymap("n", "<leader>[", "O<Esc>", default_opts)
keymap("n", "<leader>]", "o<Esc>", default_opts)

-- No arrow keys
keymap({'n', 'i'}, "<Left>", "<nop>", default_opts)
keymap({'n', 'i'}, "<Right>", "<nop>", default_opts)
keymap({'n', 'i'}, "<Up>", "<nop>", default_opts)
keymap({'n', 'i'}, "<Down>", "<nop>", default_opts)
 
--Switch buffers
keymap("n" , "<left>", ":bp<cr>", default_opts)
keymap("n" , "<Right>", ":bn<CR>", default_opts)

-- Toggle buffers
keymap("n" , "<leader><leader>", "<c-^>", default_opts)
 
-- Close current buffer
keymap("n" , "<leader>w", ":bd<cr>", default_opts)

-- Open new file adjacent to current file
keymap("n" , "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <CR>', default_opts)

-- Jump to start and end of line
keymap("n" , "H", "^", default_opts)
keymap("n" , "L", "$", default_opts)

 -- Nvim-tree 
 keymap("n" , "<leader>e", ":NvimTreeRefresh<CR>:NvimTreeToggle<CR>", default_opts)

-- Save buffer  
keymap("n" , "<leader>s",":w<CR>", default_opts)

-- quit 
keymap("n" , "<leader>q",":q<CR>", default_opts)
