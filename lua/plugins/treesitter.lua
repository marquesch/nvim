return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- the rewrite; required for Neovim 0.12+
	lazy = false, -- main branch does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- Parsers to always have installed.
		local ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		}

		-- Languages that should keep vim's regex highlighting on top of
		-- treesitter (some depend on it for indent rules).
		local additional_vim_regex_highlighting = { ruby = true }
		-- Languages where treesitter indentation is disabled.
		local indent_disable = { ruby = true }

		ts.install(ensure_installed)

		-- Track installed parsers so we can auto-install on demand.
		local installed = {}
		for _, lang in ipairs(ts.get_installed("parsers")) do
			installed[lang] = true
		end
		local available = {}
		for _, lang in ipairs(ts.get_available()) do
			available[lang] = true
		end

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter highlighting/indent (auto-installing parsers)",
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)
				if not lang or not available[lang] then
					return
				end

				local function enable()
					if not vim.api.nvim_buf_is_valid(buf) then
						return
					end
					vim.treesitter.start(buf, lang)
					if additional_vim_regex_highlighting[lang] then
						vim.bo[buf].syntax = "ON"
					end
					if not indent_disable[lang] then
						vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end

				if installed[lang] then
					enable()
				else
					-- auto_install: fetch the parser, then enable when ready.
					installed[lang] = true
					ts.install({ lang }):await(function()
						vim.schedule(enable)
					end)
				end
			end,
		})
	end,
}
