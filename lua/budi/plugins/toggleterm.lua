return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
			open_mapping = [[<c-\>]],
			-- hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = "1",
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = "powershell.exe",
			float_opts = {
				border = "curved",
				winblend = 20,
			},
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})

		return {
			"akinsho/toggleterm.nvim",
			version = "*",
			config = function()
				require("toggleterm").setup({
					size = 10,
					open_mapping = [[<c-\>]],
					shade_filetypes = {},
					shade_terminals = true,
					shading_factor = "1",
					start_in_insert = true,
					insert_mappings = true,
					terminal_mappings = true,
					persist_size = true,
					direction = "horizontal",
					close_on_exit = true,
					shell = "powershell.exe",
					float_opts = {
						border = "curved",
						winblend = 20,
					},
					winbar = {
						enabled = false,
						name_formatter = function(term)
							return term.name
						end,
					},
				})

				-- Menambahkan transparansi pada toggleterm
				vim.cmd([[
          augroup ToggleTermTransparent
          autocmd!
          autocmd TermOpen * highlight Normal guibg=NONE ctermbg=NONE
          autocmd TermOpen * highlight NonText guibg=NONE ctermbg=NONE
          augroup END
        ]])
			end,
		}
	end,
}
