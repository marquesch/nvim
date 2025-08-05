return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({})
		vim.keymap.set("n", "<leader>tt", function()
			toggleterm.toggle(1, 20, vim.fn.getcwd(), "horizontal")
		end, { desc = "[T]erminal" })
	end,
}
