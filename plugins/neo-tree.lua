local config = {
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      o = "open",
      O = function(state) astronvim.system_open(state.tree:get_node():get_id()) end,
      ["/"] = false,
      ["m"] = false,
      ["q"] = false,
      ["<C-v>"] = "open_vsplit",
      ["<C-x>"] = "open_split",
      ["<C-t>"] = "open_tabnew",
      ["s"] = false,
      ["S"] = false,
      ["t"] = false,
      ["z"] = false,
      ["h"] = false,
      ["f"] = false,
      [">>"] = false,
      ["<<"] = false,
      ["H"] = false,
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { 
      mappings = { 
        ["H"] = "toggle_hidden",
        ["h"] = false,
      } ,
    },
  },
  git_status = {
    window = { 
      mappings = { 
      },
    },
  }
}
return config
