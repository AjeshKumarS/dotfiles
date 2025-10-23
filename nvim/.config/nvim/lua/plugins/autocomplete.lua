return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- The 'super-tab' preset configures <Tab> and <S-Tab>
      -- to select/cycle through completion items.
      opts.keymap = {
        preset = "super-tab",
        -- You can also add more specific keymaps here to accept a completion
        ["<Tab>"] = {
          "select_and_accept",
          "snippet_forward",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
        },
      }
    end,
  },
}