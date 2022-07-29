local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Run in debug mode 
keymap("n" , "<leader>d", ":Cargo run<cr>", default_opts)

-- Run in release mode 
keymap("n" , "<leader>r", ":Cargo run --release<cr>", default_opts)

-- Build only 
keymap("n" , "<leader>b", ":Cargo build<cr>", default_opts)

-- Check only 
keymap("n" , "<leader>c", ":Cargo check<cr>", default_opts)
