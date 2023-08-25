local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap

-- bufferの移動
keymap("n", "<C-n>", ":bnext<Return>", opts)
keymap("n", "<C-p>", ":bprevious<Return>", opts)

-- filer
keymap("n", "<C-t>", ":NeoTreeShowToggle<Return>", opts)

--telescope
keymap("n", "f", ":Telescope find_files hideen=true<Return>", opts)
keymap("n", "gr", ":Telescope live_grep<Return>", opts)
keymap("n", "gb", ":Telescope git_branches<Return>", opts)
keymap("n", "<C-o>", ":Telescope oldfiles<Return>", opts)
keymap("n", "bf", ":Telescope buffers<Return>", opts)
--keymap("n", "<C-f>", ":Telescope frecency<Return>", opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		local buf_opts = { buffer = ev.buf }
		keymap("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, buf_opts)
	end,
})
