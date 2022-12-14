local config = {
  options = {
    buffer_close_icon = "",
    show_tab_indicators = true,
    show_duplicate_prefix = false,
    truncate_names = true,
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

      if (buf.tabnr == vim.api.nvim_get_current_tabpage()) then
        local name = ".~/" .. path .. "/"
        userbufferline[buf.tabnr] = name
        return name
      else
        return userbufferline[buf.tabnr]
      end
    end,
    max_name_length = 40,
  },

}

return config
