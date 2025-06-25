return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({'pull'})
    end, opts)
  end
}
