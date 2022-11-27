_G.usernvim = {}
usernvim.user_terminals = {}
local lazy = require("toggleterm.lazy")
local ui = lazy.require("toggleterm.ui")
local api = vim.api

local function opener(size, term)
  local direction = term.direction
  if term:is_split() then
    ui.open_split(size, term)
  elseif direction == "tab" then
    ui.open_tab(term)
  elseif direction == "float" then
    ui.open_float(term)
  else
    error("Invalid terminal direction")
  end
end

local function on_close(term)
  if term:is_split() then
    api.nvim_win_close(term.window, true)
  elseif term:is_tab() then
    api.nvim_win_close(term.window, true)
  elseif term.window and api.nvim_win_is_valid(term.window) then
    api.nvim_win_close(term.window, true)
  end
end

local function create_term_buf_if_needed(term)
  local valid_win = term.window and api.nvim_win_is_valid(term.window)
  local window = valid_win and term.window or api.nvim_get_current_win()
  -- If the buffer doesn't exist create a new one
  local valid_buf = term.bufnr and api.nvim_buf_is_valid(term.bufnr)
  local bufnr = valid_buf and term.bufnr or api.nvim_create_buf(false, false)

  term.window, term.bufnr = window, bufnr
  term:__set_options()
  if valid_buf then return end
  -- If the buffer didn't previously exist then assign it the window
  api.nvim_set_current_buf(bufnr)
  api.nvim_win_set_buf(window, bufnr)
end

local function on_open(term)
  local direction = term.direction
  if not term.bufnr or not vim.api.nvim_buf_is_valid(term.bufnr) then
    if term:is_split() then
      vim.cmd("botright split")
      ui.resize_split(term, size)
      create_term_buf_if_needed(term)
      term:__add()
      term:__spawn()
    elseif direction == "float" then
      ui.open_float(term)
      term:__add()
      term:__spawn()
    else
      error("Invalid terminal direction")
      return
    end
  else
    if term:is_split() then
      vim.cmd("botright split")
      ui.resize_split(term, size)
      create_term_buf_if_needed(term)
      ui.switch_buf(term.bufnr)
      term:__add()
      term:__spawn()
    elseif direction == "float" then
      ui.open_float(term)
      term:__add()
      term:__spawn()
    else
      error("Invalid terminal direction")
      return
    end
  end
  -- 美化外框
  ui.hl_term(term)
end

function usernvim.toggle_term_tab(opts)
  if not opts then
    opts = {hidden = true}
  end
  local terms = usernvim.user_terminals
  local size = nil

  local num_b = vim.api.nvim_get_current_tabpage()
  local num_c = num_b
  local num_a = { num_b + 0, num_b + 1, num_b + 2, num_b + 3}
  if (opts.direction == "float") then
    num_c = num_b+0
  elseif (opts.direction == "horizontal") then
    num_c = num_b+1
    size = 10
  elseif (opts.direction == "vertical") then
    num_c = num_b+2
    size = 80
  else
    num_c = num_b+3
  end
  local tabpage = tostring(num_b)
  -- if terminal doesn't exist yet, create it
  if not terms[tabpage] then terms[tabpage] = {} end
  if not terms[tabpage][num_c] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num_c end
    --print("new terminal count = ", opts.count)
    terms[tabpage][num_c] = require("toggleterm.terminal").Terminal:new(opts)
  end

  for _, v in ipairs(num_a) do
    if (v ~= num_c and terms[tabpage][v]) then
      if (terms[tabpage][v]:is_open() and terms[tabpage][v]:is_float()) then
        --terms[tabpage][v]:close()
        on_close(terms[tabpage][v])
        --print("close other")
        --on_close(terms[tabpage][v])
      end
    end
  end
  if (terms["float"] and terms["float"][1] and terms["float"][1]:is_open()) then
      --terms["float"][1]:close()
      on_close(terms["float"][1])
      --print("close float")
  end
  if (terms["horizontal"] and terms["horizontal"][1] and terms["horizontal"][1]:is_open()) then
    --terms["horizontal"][1]:close()
    on_close(terms["horizontal"][1])
    --print("close horizontal")
  end
  if (terms["vertical"] and terms["vertical"][1] and terms["vertical"][1]:is_open()) then
    --terms["vertical"][1]:close()
    on_close(terms["vertical"][1])
    --print("close vertical")
  end

  if (terms[tabpage][num_c]:is_open()) then
    --terms[tabpage][num_c]:close()
    on_close(terms[tabpage][num_c])
    --print("close curr")
    --on_close(terms[tabpage][num_c])
  else
    -- TODO: 没有自动startinsert
    terms[tabpage][num_c]:open(size, opts.direction)
    --print("open curr")
    --on_open(terms[tabpage][num_c])
  end

end

function usernvim.toggle_term_float()
  local opts = {hidden = true, direction = "float"}
  local terms = usernvim.user_terminals

  local num = 1
  local tabpage = "float"
  -- if terminal doesn't exist yet, create it
  if not terms[tabpage] then terms[tabpage] = {} end
  if not terms[tabpage][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
  terms[tabpage][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  usernvim.user_terminals[tabpage][num]:toggle()
end

function usernvim.toggle_term_horizontal()
  local opts = {hidden = true, direction = "horizontal"}
  local terms = usernvim.user_terminals

  local num = 1
  local tabpage = "horizontal"
  local num_b = vim.api.nvim_get_current_tabpage()
  local num_c = num_b
  local num_a = { num_b + 0, num_b + 1, num_b + 2, num_b + 3}
  local num_page = tostring(num_b)
  for _, v in ipairs(num_a) do
    if (v ~= num_c and terms[num_page] and terms[num_page][v]) then
      if (terms[num_page][v]:is_open()) then
        terms[num_page][v]:close()
      end
    end
  end
  -- 只要tabpage打开就关闭

  -- if terminal doesn't exist yet, create it
  if not terms[tabpage] then terms[tabpage] = {} end
  if not terms[tabpage][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
  terms[tabpage][num] = require("toggleterm.terminal").Terminal:new(opts)
  end

  -- toggle the terminal
  usernvim.user_terminals[tabpage][num]:toggle()
end

function usernvim.toggle_term_vertical()
  local opts = {hidden = true, direction = "vertical"}
  local terms = usernvim.user_terminals

  local num = 1
  local tabpage = "vertical"
  -- if terminal doesn't exist yet, create it
  if not terms[tabpage] then terms[tabpage] = {} end
  if not terms[tabpage][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
  terms[tabpage][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  usernvim.user_terminals[tabpage][num]:toggle()
end

