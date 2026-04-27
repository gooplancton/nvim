return {
  -- Remap all <leader>c LSP keys to <leader>l
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = opts.servers and opts.servers["*"] and opts.servers["*"].keys
      if keys then
        for _, key in ipairs(keys) do
          if type(key) == "table" and type(key[1]) == "string" then
            key[1] = key[1]:gsub("^<leader>c", "<leader>l")
          end
        end
      end
    end,
  },

  -- Remap Mason from <leader>cm to <leader>lm
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },

  -- Disable <leader>l keybinding from LazyVim (which opens :Lazy)
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>l", false },
    },
  },
}
