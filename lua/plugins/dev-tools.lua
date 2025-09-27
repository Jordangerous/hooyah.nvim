-- Development and testing tools
return {
  -- Package manager for LSP/DAP/linters/formatters
  {
  'mason-org/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    opts = {
      ensure_installed = {
        'stylua',
        'shfmt',
        'prettierd',
        'black',
        'isort',
        'pylint',
        'eslint_d',
      },
    },
  },

  -- Testing framework (neotest already in lazy-lock)
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- Test adapters
      'nvim-neotest/neotest-python',
      'fredrikaverpil/neotest-golang',
    },
    keys = {
      { '<leader>tt', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run File' },
      { '<leader>tT', function() require('neotest').run.run(vim.uv.cwd()) end, desc = 'Run All Test Files' },
      { '<leader>tr', function() require('neotest').run.run() end, desc = 'Run Nearest' },
      { '<leader>tl', function() require('neotest').run.run_last() end, desc = 'Run Last' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Toggle Summary' },
      { '<leader>to', function() require('neotest').output.open({ enter = true, auto_close = true }) end, desc = 'Show Output' },
      { '<leader>tO', function() require('neotest').output_panel.toggle() end, desc = 'Toggle Output Panel' },
      { '<leader>tS', function() require('neotest').run.stop() end, desc = 'Stop' },
    },
    opts = {
      adapters = {
        'neotest-python',
        'neotest-golang',
      },
    },
  },

  -- Database interface (vim-dadbod suite already in lazy-lock)
  {
    'tpope/vim-dadbod',
    cmd = 'DB',
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    keys = {
      { '<leader>Du', '<cmd>DBUIToggle<cr>', desc = 'Toggle DBUI' },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Rust development tools (rustaceanvim already in lazy-lock)
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
  },

  -- Crates.nvim for Rust dependency management (already in lazy-lock)
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        cmp = { enabled = true },
      },
    },
  },

  -- Python virtual environment selector (venv-selector already in lazy-lock)
  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp',
    cmd = 'VenvSelect',
    keys = {
      { '<leader>cv', '<cmd>VenvSelect<cr>', desc = 'Select VirtualEnv' },
    },
    opts = function()
      return {
        options = {
          notify_user_on_venv_activation = true,
        },
      }
    end,
  },
}