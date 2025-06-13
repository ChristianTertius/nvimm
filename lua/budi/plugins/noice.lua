return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- Nonaktifkan semua fitur Noice kecuali cmdline search (/)
			cmdline = {
				enabled = true, -- aktifkan hanya untuk cmdline (tapi akan kita filter)
				view = "cmdline_popup", -- tampilan khusus untuk search
			},
			messages = {
				enabled = false, -- matikan pesan biasa (seperti :echo)
			},
			popupmenu = {
				enabled = false, -- matikan popupmenu (agar tidak mengganggu completion default)
			},
			notify = {
				enabled = false, -- matikan notifikasi (biarkan nvim-notify atau default handle ini)
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false,
				},
				message = {
					enabled = false, -- matikan pesan LSP
				},
			},
			presets = {
				bottom_search = false, -- jangan pakai bottom search
				command_palette = false, -- matikan command palette
				long_message_to_split = false, -- jangan split pesan panjang
				inc_rename = false, -- matikan rename popup
				lsp_doc_border = false, -- jangan pakai border doc LSP
			},
			routes = {
				-- Skip semua event kecuali cmdline dengan jenis / (search)
				{
					filter = {
						event = "cmdline",
						kind = "/", -- HANYA aktif untuk search dengan /
					},
					view = "cmdline_popup", -- pakai tampilan popup
				},
				-- Skip semua event lainnya (termasuk :, ?, @, dll.)
				{
					filter = { event = "msg_show" },
					opts = { skip = true }, -- skip pesan biasa
				},
				{
					filter = { event = "notify" },
					opts = { skip = true }, -- skip notifikasi
				},
				{
					filter = { event = "cmdline", kind = { ":", "?", "@" } }, -- skip command line selain /
					opts = { skip = true },
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = "50%", -- tengah layar vertikal
						col = "50%", -- tengah layar horizontal
					},
					size = {
						width = 60, -- lebar popup
						height = "auto", -- tinggi menyesuaikan konten
					},
					border = {
						style = "rounded", -- border melengkung
					},
				},
			},
		})
	end,
}
