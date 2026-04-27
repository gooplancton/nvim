return {
  {
    "Pocco81/auto-save.nvim",
    opts = {
      enabled = true,
      execution_message = {
        message = function()
          return ""
        end,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      write_all_buffers = false,
      debounce_delay = 100
    },
  },
}
