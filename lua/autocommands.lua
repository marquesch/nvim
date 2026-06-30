-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Check if any buffer was changed on disk and reload it.
--  `autoread` only reloads when something triggers a check, so we run
--  `:checktime` on focus, buffer enter, and when the editor goes idle.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	desc = "Reload buffer if the underlying file changed on disk",
	group = vim.api.nvim_create_augroup("auto-checktime", { clear = true }),
	callback = function()
		-- Don't run checktime in command-line mode or in the command-line window.
		if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
			vim.cmd("checktime")
		end
	end,
})

-- Let you know when a buffer was reloaded because the file changed on disk.
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	desc = "Notify when a file was changed on disk",
	group = vim.api.nvim_create_augroup("auto-checktime-notify", { clear = true }),
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
	end,
})
