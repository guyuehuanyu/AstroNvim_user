
_G.userchangelist = {}

vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI", "TextYankPost"}, {
  callback = function()
    local one = {
      lnum = vim.fn.line("."),
      bufnr = vim.fn.bufnr(),
      col = 0,
      coladd = 0,
      --filename = vim.fn.expand("%:p")
    }
    --print(vim.fn.line("."))
    --print(vim.fn.bufnr())
    --print(vim.fn.expand("%:p"))
    -- TODO: 保存到一个列表中，并且写入到文件中
    table.insert(userchangelist, one)
  end
  
})

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

