return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		require("fzf-lua").setup({
			grep = {
				rg_glob = true,
			},
			tags = {
				file_path = "tags",
			},
		})

		local fzflua = require("fzf-lua")

		vim.keymap.set("n", "<leader>sh", fzflua.help_tags, { desc = "[S]earch [H]elp (fzf-lua)" })
		vim.keymap.set("n", "<leader>sk", fzflua.keymaps, { desc = "[S]earch [K]eymaps (fzf-lua)" })
		vim.keymap.set("n", "<leader>sf", fzflua.files, { desc = "[S]earch [F]iles (fzf-lua)" })
		vim.keymap.set("n", "<leader>sg", fzflua.live_grep, { desc = "[S]earch by [G]rep (fzf-lua)" })
		vim.keymap.set("n", "<leader>sr", fzflua.resume, { desc = "[S]earch [R]esume (fzf-lua)" })
		vim.keymap.set("n", "<leader><leader>", fzflua.buffers, { desc = "[ ] Find existing buffers (fzf-lua)" })

		vim.keymap.set(
			"n",
			"<leader>/",
			fzflua.lgrep_curbuf,
			{ desc = "[/] Fuzzily search in current buffer (fzf-lua)" }
		)

		vim.keymap.set("n", "<leader>sn", function()
			fzflua.files({
				cwd = vim.fn.stdpath("config"),
				prompt = "Search Neovim config files:",
			})
		end, { desc = "[S]earch [N]eovim files (fzf-lua)" })
	end,
}
