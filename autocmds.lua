

vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("last_position", { clear = true }),
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("lasosition", { clear = true }),
      buffer = 0,
      callback = function()
        vim.cmd [[ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif ]]
      end,
      desc = "test",
      once = true,
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      command = 'normal! zx|zR'
    })

  end,
  desc = "test",
})

