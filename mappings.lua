
local mappings = {
  n = {
    ["<S-l>"] = false,
    ["<S-h>"] = false,
    ["<S-m>"] = false,
    ["<leader>e"] = false,
    ["<leader>o"] = false,
    ["<leader>sk"] = false, -- { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
    ["<leader>tf"] = false, -- { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
    ["<leader>th"] = false, -- { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
    ["<leader>tv"] = false, -- { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
    ["<F7>"] = false,       -- { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
    ["<C-'>"] = false,      -- maps.n["<F7>"]
    ["<leader>lS"] = false, -- { function() require("aerial").toggle() end, desc = "Symbols outline" }
    -- Telescope
    ["<leader><leader>"] = { "<cmd> Telescope <CR>", desc = "Telescope" },
    ["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" },
    ["<leader>fF"] = { function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, desc = "Search all files", },
    ["<leader>fg"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" },
    ["<leader>fG"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Search words in all files",
    },
    ["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" },
    ["<leader>fw"] = { function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor" },
    ["<leader>lk"] = { function() require("telescope.builtin").keymaps() end, desc = "List keymaps" },
    ["<leader>ls"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      desc = "Search symbols",
    },
    -- NeoTree
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Neotree Toggle Explorer" },
    ["<Bslash>h"] = { "<cmd>Neotree focus<cr>", desc = "Neotree Focus Explorer" },
    ["<C-p>"] = { function() require("aerial").toggle() end, desc = "aerial Symbols outline" },
    ["<Bslash>l"] = { function() require("aerial").focus() end, desc = "focus aerial" },
    -- Terminal
    --["<A-I>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-I>"] = { function() usernvim.toggle_term_float() end, desc = "ToggleTerm float global" },
    ["<A-i>"] = { function() usernvim.toggle_term_tab({direction = "float"}) end, desc = "ToggleTerm float tabpage" },
    ["<A-n>"] = { function() usernvim.toggle_term_tab({direction = "horizontal"}) end, desc = "ToggleTerm horizontal tabpage" },
    ["<A-N>"] = { function() usernvim.toggle_term_horizontal() end, desc = "ToggleTerm horizontal globa" },
    --["<A-v>"] = { function() usernvim.toggle_term_tab({direction = "vertical"}) end, desc = "ToggleTerm vertical tabpage" },
    --["<A-H>"] = { function() usernvim.toggle_term_tab({direction = "vertical"}) end, desc = "ToggleTerm vertical tabpage" },
    --["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    --["<A-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
    -- GitSigns
    ["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" },
    ["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" },

    ["<leader>ga"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage buffer git hunk" },
    ["<leader>gU"] = { function() require("gitsigns").undo_stage_buffer() end, desc = "Stage buffer git hunk" },

    ["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" },
    ["[c"] = { function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end, desc = "Previous git hunk" },
    ["]c"] = { function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end, desc = "Next git hunk" },
    -- Tabs
    ["<Bslash>1"] = { "<cmd> 1tabnext <CR>", desc = "Pick tabs 1" },
    ["<Bslash>2"] = { "<cmd> 2tabnext <CR>", desc = "Pick tabs 2" },
    ["<Bslash>3"] = { "<cmd> 3tabnext <CR>", desc = "Pick tabs 3" },
    ["<Bslash>4"] = { "<cmd> 4tabnext <CR>", desc = "Pick tabs 4" },
    ["<Bslash>5"] = { "<cmd> 5tabnext <CR>", desc = "Pick tabs 5" },
    ["<Bslash>6"] = { "<cmd> 6tabnext <CR>", desc = "Pick tabs 6" },
    ["<Bslash>7"] = { "<cmd> 7tabnext <CR>", desc = "Pick tabs 7" },
    ["<Bslash>8"] = { "<cmd> 8tabnext <CR>", desc = "Pick tabs 8" },
    ["<Bslash>9"] = { "<cmd> 9tabnext <CR>", desc = "Pick tabs 9" },
    ["<Bslash>x"] = { "<cmd> tabclose <CR>", desc = "close table" },
    ["<Bslash><Bslash>"] = { "<cmd> tab vsp <CR>", desc = "tab vsp page" },
    --["<lt>t"] = { "<cmd> tabprev <CR>", desc = "prev tab" },
    --[">t"] = { "<cmd> tabnext <CR>", desc = "next tab" },
    ["<Tab>"] = { "<cmd> tabnext <CR>", desc = "prev tab" },
    ["<S-Tab>"] = { "<cmd> tabprev <CR>", desc = "next tab" },
    ["<A-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<A-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<A-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<A-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    ["<Bslash>c"] = { "<cmd>bdelete! %<cr>", desc = "Force close buffer" },
  },
  t = {
    ["<C-'>"] = false, -- maps.n["<F7>"]
    ["<Esc>"] = { "<c-\\><c-n>", desc = "Enter normal" },
    ["<A-I>"] = { function() usernvim.toggle_term_float() end, desc = "ToggleTerm float global" },
    ["<A-i>"] = { function() usernvim.toggle_term_tab({direction = "float"}) end, desc = "ToggleTerm float tabpage" },
    ["<A-n>"] = { function() usernvim.toggle_term_tab({direction = "horizontal"}) end, desc = "ToggleTerm horizontal tabpage" },
    ["<A-N>"] = { function() usernvim.toggle_term_horizontal() end, desc = "ToggleTerm horizontal globa" },
    ["<Bslash>1"] = { "<cmd> 1tabnext <CR>", desc = "Pick tabs 1" },
    ["<Bslash>2"] = { "<cmd> 2tabnext <CR>", desc = "Pick tabs 2" },
    ["<Bslash>3"] = { "<cmd> 3tabnext <CR>", desc = "Pick tabs 3" },
    ["<Bslash>4"] = { "<cmd> 4tabnext <CR>", desc = "Pick tabs 4" },
    ["<Bslash>5"] = { "<cmd> 5tabnext <CR>", desc = "Pick tabs 5" },
    ["<Bslash>6"] = { "<cmd> 6tabnext <CR>", desc = "Pick tabs 6" },
    ["<Bslash>7"] = { "<cmd> 7tabnext <CR>", desc = "Pick tabs 7" },
    ["<Bslash>8"] = { "<cmd> 8tabnext <CR>", desc = "Pick tabs 8" },
    ["<Bslash>9"] = { "<cmd> 9tabnext <CR>", desc = "Pick tabs 9" },
    ["<Bslash>x"] = { "<cmd> tabclose <CR>", desc = "close table" },
    ["<Bslash>c"] = { "<cmd>bdelete! %<cr>", desc = "Force close buffer" },
    -- ["<Tab>"] = { "<cmd> tabprev <CR>", desc = "prev tab" },
    -- ["<S-Tab>"] = { "<cmd> tabnext <CR>", desc = "next tab" },
    ["<a-h>"] = { "<c-\\><c-n><c-w>h", desc = "Move to left split" },
    ["<a-j>"] = { "<c-\\><c-n><c-w>j", desc = "Move to below split" },
    ["<a-k>"] = { "<c-\\><c-n><c-w>k", desc = "Move to above split" },
    ["<a-l>"] = { "<c-\\><c-n><c-w>l", desc = "Move to right split" },
    --["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    --["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    --["<A-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
  },
  i = {
    ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    ["<A-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<A-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<A-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<A-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
  },
  v = {
    ["<"] = false,
    [">"] = false,
    ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    ["<A-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    ["<A-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
    ["<A-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
    ["<A-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
  }
}


-- add more text objects for "in" and "around"
--[[
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    mappings[mode]["i" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
    mappings[mode]["a" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
  end
end
--]]

return mappings
