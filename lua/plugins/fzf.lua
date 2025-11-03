return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		require("fzf-lua").setup({
			grep = {
				rg_glob = true,
			},
		})

		local fzflua = require("fzf-lua")

		vim.keymap.set("n", "<leader>sh", fzflua.help_tags, { desc = "[H]elp (fzf-lua)" })
		vim.keymap.set("n", "<leader>sk", fzflua.keymaps, { desc = "[K]eymaps (fzf-lua)" })
		vim.keymap.set("n", "<leader>sf", fzflua.files, { desc = "[F]iles (fzf-lua)" })
		vim.keymap.set("n", "<leader>sg", fzflua.live_grep, { desc = "[G]rep (fzf-lua)" })
		vim.keymap.set("n", "<leader>sr", fzflua.resume, { desc = "[R]esume (fzf-lua)" })
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
				prompt = "Neovim config files:",
			})
		end, { desc = "[N]eovim files (fzf-lua)" })
	end,
}
