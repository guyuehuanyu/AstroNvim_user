return {
  ["windwp/nvim-autopairs"] = { disable = true },
  ["rebelot/heirline.nvim"] = { disable = true },
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

  ["nvim-lualine/lualine.nvim"] = {
    disable = false,
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            --lualine_c = {'filename'},
            lualine_c = { 'filename', 'tabs' },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true,      -- Displays file status (readonly status, modified status)
              newfile_status = false,   -- Display new file status (new file means no write after created)
              path = 1,                -- 0: Just the filename
              shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
              symbols = {
                modified = '[+]',      -- Text to show when the file is modified.
                readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '[New]',     -- Text to show for new created file before first writting
              }
            },
            {
              'tabs',
              tabs_color = {
                active = '',
                inactive = '',
              },
            }
          }
        },
      })
    end
  },
  ['voldikss/vim-translator'] = {
    config = function()
    end
  },
  ['guyuehuanyu/jumps-section.nvim'] = {
    config =function()
      require "jumps"
    end
  }
}
