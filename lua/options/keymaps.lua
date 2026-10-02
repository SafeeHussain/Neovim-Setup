-- leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- MOVEMENT KEYBINDS:

-- Unmapping all arrow keys while in normal mode
--vim.cmd("nnoremap <Left> :echo 'h to go left'<CR>")
--vim.cmd("nnoremap <Right> :echo 'l to go right'<CR>")
--vim.cmd("nnoremap <Up> :echo 'k to go up'<CR>")
--vim.cmd("nnoremap <Down> :echo 'j to go down'<CR>")
-- Unmapping all arrow keys while in insert mode
-- vim.cmd("inoremap <Left> <Nop>")
-- vim.cmd("inoremap <Right> <Nop>")
-- vim.cmd("inoremap <Up> <Nop>")
-- vim.cmd("inoremap <Down> <Nop>")
-- Converts Alt + hjkl to be the movement keys whilst in insert mode
keymap("i", "<A-k>", "<Up>", opts)
keymap("i", "<A-j>", "<Down>", opts)
keymap("i", "<A-h>", "<Left>", opts)
keymap("i", "<A-l>", "<Right>", opts)

-- Redirects the directory to .config
vim.keymap.set("n", "<leader>cd", function()
	vim.cmd("cd ~/.config/nvim")
end, { desc = "nvim config dir" })

-- TAB KEYBINDS

-- Making a new tab
vim.keymap.set("n", "<C-`>", function()
	vim.cmd("tabnew")
	vim.notify("Successfully opened a tab")
end, {
	desc = "make a new tab",
})

-- Closing a tab
-- COMMENTED OUT: REDUNDANT
-- vim.keymap.set("n", "<A-`>", function()
-- 	local function savenclose()
-- 		if unexpected_condition then
-- 			error()
-- 		end
-- 		vim.cmd("w")
-- 	end
--
--     local function close()
-- 		if unexpected_condition then
-- 			error()
-- 		end
-- 		vim.cmd("tabclose")
--     end
--
-- 	if pcall(savenclose) then
--         if pcall(close) then
--             vim.notify("Tab saved and closed")
--         else
--             vim.notify("Cannot close current tab", "error")
--         end
--     else
--         if pcall(close) then
--             vim.notify("Tab closed, not saved")
--         else
--             vim.notify("Cannot close current tab", "error")
--         end
-- 	end
-- end, {
-- 	desc = "writes and saves current tab",
-- })


-- Moving to next tab
vim.keymap.set(
    "n", "<A-9>",
    function()
        vim.cmd("+tabnext")
    end,
    {
        desc = "Moves to the next tab"
    }
)
-- Moving to previous tab
vim.keymap.set(
    "n", "<A-0>",
    function()
        vim.cmd("-tabnext")
    end,
    {
        desc = "Moves to the prev tab"
    }
)


----
-- PLUGIN KEYBINDS:
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal session" })

-- Neo-tree Keybind
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})

-- stay-centered Keybind
vim.keymap.set({ "n", "v" }, "<leader>st", function()
	require("stay-centered").toggle()
end, { desc = "Toggle stay-centered.nvim" })

-- Toggling image rendering (used for support)
vim.keymap.set("n", "<leader>ti", function()
	if require("image").is_enabled() then
		require("image").disable()
	else
		require("image").enable()
	end
end, { desc = "Toggle images" })
----

-- lua/options/keymaps.lua

-- Other important keymap notes
-- Ctrl + f for full page down
-- Ctrl + b for full page up
-- Ctrl + d for half page down
-- Ctrl + u for half page up
-- $ for end of a line
-- ^ for first non-blank character of a line
