-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jj/jk → Escape in insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })

-- ; → end of line (replaces f/t repeat — intentional)
vim.keymap.set({ "n", "x" }, ";", "$", { desc = "End of line" })

-- Move format/diagnostics from <leader>c to <leader>l (LSP keys moved in lua/plugins/lsp.lua)
vim.keymap.set({ "n", "x" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

vim.schedule(function()
  pcall(vim.keymap.del, { "n", "x" }, "<leader>cf")
  pcall(vim.keymap.del, "n", "<leader>cd")
end)
