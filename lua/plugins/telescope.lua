return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable("make") == 1, build = "make" },
      { "princejoogie/dir-telescope.nvim" },
    },
  },
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = opts.defaults.mappings.i or {}
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("bookmarks")
    opts.defaults.mappings.i["<A-g>"] = require("telescope-live-grep-args.actions").quote_prompt()
    opts.defaults.mappings.i["<A-i>"] =
      require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
    return opts
  end,
}
