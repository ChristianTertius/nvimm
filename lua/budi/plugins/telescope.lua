return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		-- local transform_mod = require("telescope.actions.mt").transform_mod

		-- local trouble = require("trouble")
		-- local trouble_telescope = require("trouble.providers.telescope")

		-- or create your custom action
		-- local custom_actions = transform_mod({
		--   open_trouble_qflist = function(prompt_bufnr)
		--     trouble.toggle("quickfix")
		--   end,
		-- })
		file_ignore_patterns =
			{ "node_modules/", ".git/", "dist/", "%.log" }, telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							-- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						},
					},
				},
			})

		telescope.load_extension("fzf")

		-- transparent background

		vim.cmd([[
      highlight TelescopeNormal guibg=NONE ctermbg=NONE
      highlight TelescopeBorder guibg=NONE ctermbg=NONE 
      highlight TelescopePromptNormal guibg=NONE ctermbg=NONE
      highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
      highlight TelescopeResultsNormal guibg=NONE ctermbg=NONE
      highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
      highlight TelescopePreviewNormal guibg=NONE ctermbg=NONE
      highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
    ]])

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set(
			"n",
			"<leader>fs",
			"<cmd>Telescope live_grep --grep-prg=rg<cr>",
			{ desc = "Find string in cwd using ripgrep" }
		)
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
	end,
}
