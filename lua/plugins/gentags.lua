return {
	"linrongbin16/gentags.nvim",
	opts = {
		ctags = {
			-- exclude logs
			"--exclude=*.log",

			-- exclude vcs
			"--exclude=*.git",
			"--exclude=*.svg",
			"--exclude=*.hg",

			-- exclude nodejs
			"--exclude=node_modules",

			-- exclude tags/cscope
			"--exclude=*tags*",
			"--exclude=*cscope.*",

			-- exclude VS project generated
			"--exclude=*.pdb",
			"--exclude=*.sln",
			"--exclude=*.csproj",
			"--exclude=*.csproj.user",

			-- exclude blobs
			"--exclude=*.exe",
			"--exclude=*.dll",
			"--exclude=*.mp3",
			"--exclude=*.ogg",
			"--exclude=*.flac",
			"--exclude=*.swp",
			"--exclude=*.swo",
			"--exclude=*.bmp",
			"--exclude=*.gif",
			"--exclude=*.ico",
			"--exclude=*.jpg",
			"--exclude=*.png",
			"--exclude=*.rar",
			"--exclude=*.zip",
			"--exclude=*.tar",
			"--exclude=*.tar.gz",
			"--exclude=*.tar.xz",
			"--exclude=*.tar.bz2",
			"--exclude=*.pdf",
			"--exclude=*.doc",
			"--exclude=*.docx",
			"--exclude=*.ppt",
			"--exclude=*.pptx",
		},
	},
}
