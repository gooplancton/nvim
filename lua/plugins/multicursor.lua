return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add cursor on next/prev match (like Ctrl+N in vim-visual-multi)
      set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add cursor on next match" })
      set({ "n", "x" }, "<C-p>", function() mc.matchAddCursor(-1) end, { desc = "Add cursor on prev match" })
      set({ "n", "x" }, "<C-s>", function() mc.matchSkipCursor(1) end, { desc = "Skip and next match" })

      -- Add cursors above/below current line
      set({ "n", "x" }, "<C-Up>", function() mc.addCursor("k") end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<C-Down>", function() mc.addCursor("j") end, { desc = "Add cursor below" })

      -- Add cursor to all matches in buffer
      set({ "n", "x" }, "<leader>ma", mc.matchAllAddCursors, { desc = "Cursor on all matches" })

      -- One cursor per line in visual selection
      set("x", "<leader>ml", mc.splitCursors, { desc = "Split cursors per line" })

      -- Cycle through cursors
      set({ "n", "x" }, "<M-,>", mc.prevCursor, { desc = "Prev cursor" })
      set({ "n", "x" }, "<M-.>", mc.nextCursor, { desc = "Next cursor" })

      -- Delete the current cursor
      set({ "n", "x" }, "<leader>mx", mc.deleteCursor, { desc = "Delete cursor" })

      -- Insert/append at each cursor from visual selection
      set("x", "I", mc.insertVisual, { desc = "Insert at cursors" })
      set("x", "A", mc.appendVisual, { desc = "Append at cursors" })

      -- Rotate cursor selections
      set("x", "<leader>mt", mc.transposeCursors, { desc = "Transpose cursors" })

      set({ "n", "x" }, "<leader>mc", mc.clearCursors, { desc = "Clear cursors" })
      -- -- Use autocmd to clear multicursors when entering normal mode from visual mode
      -- vim.api.nvim_create_autocmd("ModeChanged", {
      --   pattern = "*:[n]",
      --   callback = function()
      --     if mc.hasCursors() then
      --       mc.clearCursors()
      --     end
      --   end,
      -- })

      -- Highlight groups
      vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
      vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
