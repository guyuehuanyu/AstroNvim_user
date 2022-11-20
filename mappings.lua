local mappings = {
  n = {
    -- Telescope
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
    -- NeoTree
    ["<leader>e"] = false,
    ["<leader>o"] = false,
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
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
