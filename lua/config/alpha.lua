local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local session_manager = require("session_manager")

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

local buttons = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", ":FzfLua files<CR>"),
	dashboard.button("r", "  > Recent", ":FzfLua oldfiles<CR>"),
	dashboard.button("q", "   > Quit NVIM", ":qa<CR>"),
}

if session_manager.current_dir_session_exists() then
	local button = dashboard.button("s", "   > Load last session", ":SessionManager load_current_dir_session<CR>")
	table.insert(buttons, 4, button)
end

dashboard.section.footer.val = "Se todo mundo fosse humilde como eu..."

dashboard.section.buttons.val = buttons
-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
