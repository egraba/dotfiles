return {
  -- BSD style(9) indentation for C (upstream FreeBSD/OpenBSD vim script)
  {
    "zautomata/vim-openbsd",
    ft = "c",
    config = function()
      -- The script ships under syntax/, so it is never sourced automatically
      vim.cmd.runtime("syntax/openbsd.vim")
      -- It maps <Leader>f globally, which would shadow the <leader>f* keymaps
      pcall(vim.keymap.del, "n", "<Leader>f")

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("BsdCStyle", { clear = true }),
        pattern = "c",
        callback = function()
          vim.fn.OpenBSD_Style()
        end,
      })
      -- Apply to the buffer that triggered the lazy load
      if vim.bo.filetype == "c" then
        vim.fn.OpenBSD_Style()
      end
    end,
  },
}
