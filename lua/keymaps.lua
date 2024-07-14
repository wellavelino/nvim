-- This has to be set before initializing lazy
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<leader>k>", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>j>", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>h>", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>l>", ":wincmd l<CR>")

-- VIM
vim.keymap.set("n", "<leader>nn", ":nohlsearch<CR>") -- clear search highlights
vim.keymap.set("n", "<leader>q", ":q<CR>") -- close buffer
vim.keymap.set("n", "<leader>Q", ":q!<CR>") -- close buffer without saving
vim.keymap.set("n", "<leader>W", ":w<CR>") -- save buffer
vim.keymap.set("n", "<leader>r", [[:%s/<C-r><C-w>//g<Left><Left>]])


-- Split window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
vim.keymap.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
vim.keymap.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
vim.keymap.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger

-- Tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- LSP
vim.keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
vim.keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- NEO TREE
--vim.keymap.set("n", "<C-a>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
vim.keymap.set("n", "<leader>gs", "<Cmd>Neotree float git_status<CR>", {})
vim.keymap.set("n", "<C-a>", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>") --close buffer

-- FUGITIVE
vim.keymap.set("n", "<leader>gs", ":Git<CR>") -- open git status
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>") -- open git commit
vim.keymap.set("n", "<leader>lo", ":Git log<CR>") -- open git log
vim.keymap.set("n", "<leader>ld", ":Gdiffsplit<CR>") -- open git dif


-- Float Terminal --
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<CR>", {})
