local config = {
  options = {
    buffer_close_icon = "",
    mode = 'tabs',
    indicator = {
      style = 'underline',
    },
    name_formatter = function(buf)  -- buf contains:
      local path=vim.fn.getcwd()
      local path=path:match("/.-/.-/(.*)") or ""
      local len = path:len()
      if (len > 30) then
        path = "..." .. path:sub(len-30, -1)
      end
      --TODO: buf中应该有一个tabpagenr的值
      if (buf.tabnr == vim.api.nvim_get_current_tabpage()) then
        local name = tostring(vim.fn.tabpagenr()) .. ".~/" .. path .. "/"
        userbufferline[buf.tabnr] = name
        return name
      else
        return userbufferline[buf.tabnr]
      end

      -- name                | str        | the basename of the active file
      -- path                | str        | the full path of the active file
      -- bufnr (buffer only) | int        | the number of the active buffer
      -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    end,
    max_name_length = 40,
  },

}

return config
