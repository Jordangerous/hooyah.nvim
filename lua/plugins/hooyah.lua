-- Core plugins and overrides
-- Note: Most plugins are now organized in separate files by category.
-- This file is for LazyVim core overrides and any remaining miscellaneous plugins.

return {
  -- Enhanced Treesitter with auto-update
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    init = function()
      vim.treesitter.language.register('bash', 'sh')
    end,
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
        'go',
        'rust',
        'zsh',
      },
    },
  },

  -- Session persistence (persistence already in lazy-lock)
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    keys = {
      { '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
      { '<leader>qS', function() require('persistence').select() end, desc = 'Select Session' },
      { '<leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
      { '<leader>qd', function() require('persistence').stop() end, desc = "Don't Save Current Session" },
    },
    opts = {},
  },
}

