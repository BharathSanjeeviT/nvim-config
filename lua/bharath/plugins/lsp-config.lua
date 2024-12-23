return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Configure TypeScript/JavaScript (Node.js)
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			-- Configure Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Configure Ruby
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})

			-- Configure HTML
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Configure Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Define global `vim` for Lua
						},
					},
				},
			})

			-- Configure taiwindcss
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- Configure C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			--Configure Rust
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			-- Additional LSP setup
			-- Add more configurations if needed for other languages

			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
