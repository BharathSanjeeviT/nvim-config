return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Set key mapping to toggle neo-tree
		vim.keymap.set("n", "go", "<Cmd>Neotree toggle<CR>")

		-- Set up neo-tree with event handlers
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened", -- Correct event name
					handler = function()
						-- Close neo-tree after a file is opened
						vim.cmd("Neotree close")
					end,
				},
			},
		})
	end,
}
