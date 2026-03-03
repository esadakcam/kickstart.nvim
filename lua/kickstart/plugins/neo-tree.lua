-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>E', ':Neotree reveal toggle<CR>', desc = 'NeoTree reveal toggle', silent = true },
    {
      '<leader>e',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd '1wincmd w'
          return
        end

        vim.cmd 'Neotree focus'
      end,
      desc = 'NeoTree focus',
      silent = true,
    },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          added = 'A',
          deleted = 'D',
          modified = 'M',
          renamed = 'R',
          untracked = '?',
          ignored = 'I',
          unstaged = 'U',
          staged = 'S',
          conflict = '!',
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      window = {
        position = 'right',
        mappings = {
          ['<bs>'] = 'noop',
          ['\\'] = 'close_window',
          ['O'] = function(state)
            require('neo-tree.sources.filesystem.commands').open(state)
            vim.cmd('wincmd p')
          end,
          ['Y'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path)
              vim.notify('Copied: ' .. path)
            end,
            desc = 'Copy path to clipboard',
          },
        },
      },
    },
  },
}
