local parsers = {
  "bash",
  "css",
  "dockerfile",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  {
    -- main branch: a rewrite that only installs parsers and queries; features
    -- are started per buffer below. Needs the tree-sitter CLI to build parsers.
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers) -- async, no-op when installed

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
        callback = function(args)
          -- Errors when no parser exists for the filetype; leave those buffers alone
          if not pcall(vim.treesitter.start, args.buf) then
            return
          end
          -- C indent comes from vim-openbsd (see plugins/bsd-style.lua); don't override it
          if vim.bo[args.buf].filetype ~= "c" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      -- Incremental selection, built into Nvim 0.12 as visual-mode an / in
      vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Select treesitter node" })
      vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand to parent node" })
      vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Shrink to child node" })
    end,
  },
}
