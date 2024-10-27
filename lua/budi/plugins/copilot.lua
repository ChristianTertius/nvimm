-- copilot.lua
return {
	"github/copilot.vim",
	config = function()
		-- Konfigurasi Copilot opsional
		vim.g.copilot_no_tab_map = true -- Agar Copilot tidak menggantikan tombol <Tab>
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end,
}
