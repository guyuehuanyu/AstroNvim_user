
local mappings = {
  n = {
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
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<C-p>"] = { function() require("aerial").toggle() end, desc = "Symbols outline" },
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
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<A-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
  },
  t = {
    ["<C-'>"] = false, -- maps.n["<F7>"]
    ["<Esc>"] = { "<c-\\><c-n>", desc = "Enter normal" },
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<A-v>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
  },
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
