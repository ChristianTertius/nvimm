vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "pindah ke atas" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "pindah ke bawah" })

-- Remap for floating terminal with transparent background
-- Function to open floating terminal with transparency and advanced customization
local function open_floating_terminal()
	local term_opts = {
		direction = "float",
		float_opts = {
			border = "single", -- You can use 'single', 'double', 'shadow', 'none', etc.
			width = math.floor(vim.o.columns * 0.9), -- 90% of the width of the editor
			height = math.floor(vim.o.lines * 0.8), -- 80% of the height of the editor
			winblend = 20, -- Initial transparency level (0-100)
		},
	}

	-- Open ToggleTerm with the specified options
	vim.cmd("ToggleTerm direction=float")

	-- Get current terminal window ID
	local term_win = vim.api.nvim_get_current_win()

	-- Set the window transparency (winblend)
	vim.api.nvim_win_set_option(term_win, "winblend", term_opts.float_opts.winblend)

	-- Set border options dynamically (you can customize border style and sizes here)
	vim.api.nvim_win_set_config(term_win, {
		relative = "editor",
		row = math.floor((vim.o.lines - term_opts.float_opts.height) / 2), -- Centered vertically
		col = math.floor((vim.o.columns - term_opts.float_opts.width) / 2), -- Centered horizontally
		width = term_opts.float_opts.width,
		height = term_opts.float_opts.height,
		border = term_opts.float_opts.border, -- Set border style here
	})
end

-- Keymap to toggle the floating terminal with advanced options
vim.keymap.set("n", "<leader>tt", function()
	open_floating_terminal()
end, { noremap = true, silent = true })

keymap.set("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<CR>", { noremap = true, silent = true })

keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Term" })
keymap.set("n", "ZAQ", "<cmd>qa!<CR>", { desc = "quit semuanya" })
keymap.set("i", "jk", "<ESC>", { desc = "Keluar dari insert mode" })
keymap.set("i", "dw", "<C-w>", { desc = "Delete word by double d" })
keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save and go to normal mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement number" }) -- increment

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically window
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontal" }) -- split window vertically window
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" }) -- split window vertically window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to text tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>i", "<C-i>", { desc = "jump forward" })

keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Format paragraph and restore cursor position
function FormatParagraph()
	local pos = vim.fn.getpos(".")
	vim.cmd("normal! =ap")
	vim.fn.setpos(".", pos)
end

keymap.set("n", "<leader>ap", ":lua FormatParagraph()<CR>", opts)
