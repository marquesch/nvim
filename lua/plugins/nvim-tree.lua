return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 50,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { "^\\.git$", "venv", "\\.venv", "__pycache__" },
			},
			update_focused_file = {
				enable = true,
			},
		})

		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<leader>te", api.tree.toggle, { desc = "File [E]xplorer" })
	end,
}
