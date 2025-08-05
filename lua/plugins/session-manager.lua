-- TODO Make it work
return {
	"Shatur/neovim-session-manager",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local Path = require("plenary.path")
		local config = require("session_manager.config")

		require("session_manager").setup({
			sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
			autoload_mode = config.AutoloadMode.Disabled,
		})
	end,
}
