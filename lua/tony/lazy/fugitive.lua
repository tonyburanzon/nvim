return {
  "tpope/vim-fugitive",
  config = function() 
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>co", ":Git checkout ")
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git({'pull',  '--rebase'})
    end, opts)
  end
}
