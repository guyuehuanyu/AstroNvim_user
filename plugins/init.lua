return {
  --["saadparwaiz1/cmp_luasnip"] = { disable = true },
  --["hrsh7th/cmp-buffer"] = { disable = true},
  --["hrsh7th/cmp-path"] = { disable = true},
  --["hrsh7th/cmp-nvim-lsp"] = { disable = true},
  --["hrsh7th/nvim-cmp"] = { disable = true},
  ["quangnguyen30192/cmp-nvim-tags"] = {
    disable = false,
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "tags" end,
  },
  ['ms-jpq/coq_nvim'] = {
    disable = true,
    config = function()
      --vim.cmd [[ let g:coq_settings = { 'auto_start': v:true, 'keymap.jump_to_mark': "" } ]]
      vim.g.coq_settings = { 
        auto_start = true,
        ['keymap.recommended'] = false,
        ['keymap.jump_to_mark'] = "",
        ['coq_settings.keymap.pre_select'] = true,
      }
      require("coq")
      --vim.cmd [[ COQnow ]]

    end
  },
  ["guyuehuanyu/block"] = {},
  ['LukasPietzschmann/telescope-tabs'] = {
    config = function()
      require'telescope-tabs'.setup{
      }
    end
  },
}
