return {
	"lukas-reineke/indent-blankline.nvim",
	commit = "29be0919b91fb59eca9e90690d76014233392bef",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		scope = { enabled = true },
		indent = {
			char = "┊",
		},
	},
}
