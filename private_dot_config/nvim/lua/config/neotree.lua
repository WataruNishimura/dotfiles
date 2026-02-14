require("neo-tree").setup(
  {
    enable_git_status=true,
    close_if_last_window=false,
    default_component_configs={
      git_status = {
        symbols = {
          -- Change type
          added = "+", -- or "✚"
          modified = "⚫︎", -- or ""
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    file_size = {
      enabled=true,
      width=12,
    },
    filesystem = {
      filtered_items = {
        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    }
  }
)
