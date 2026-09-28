return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " 🔍 ",
        selection_caret = "  ",
        path_display = { "smart" },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "__pycache__",
          "%.pyc",
          ".venv",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  },
}
