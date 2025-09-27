-- Text editing enhancements and utilities
return {
  -- Enhanced increment/decrement
  {
    'monaqa/dial.nvim',
    keys = {
      { '<C-a>', function() require('dial.map').manipulate('increment', 'normal') end, desc = 'Increment' },
      { '<C-x>', function() require('dial.map').manipulate('decrement', 'normal') end, desc = 'Decrement' },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gnormal') end, desc = 'Increment' },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gnormal') end, desc = 'Decrement' },
      { '<C-a>', function() require('dial.map').manipulate('increment', 'visual') end, mode = 'v', desc = 'Increment' },
      { '<C-x>', function() require('dial.map').manipulate('decrement', 'visual') end, mode = 'v', desc = 'Decrement' },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gvisual') end, mode = 'v', desc = 'Increment' },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gvisual') end, mode = 'v', desc = 'Decrement' },
    },
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
  },

  -- Enhanced yank/paste operations (yanky already in lazy-lock)
  {
    'gbprod/yanky.nvim',
    keys = {
      { '<leader>p', function() require('yanky.telescope').yank_history() end, desc = 'Open Yank History' },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
      { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
      { '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
      { ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },
      { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
    opts = {
      highlight = { timer = 500 },
      ring = { history_length = 100 },
    },
  },

  -- Rename with live preview (inc-rename already in lazy-lock)
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    keys = {
      {
        '<leader>rn',
        function()
          return ':IncRename ' .. vim.fn.expand('<cword>')
        end,
        expr = true,
        desc = 'Rename',
      },
    },
    config = true,
  },

  -- Enhanced search and replace (grug-far already in lazy-lock)
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    keys = {
      {
        '<leader>sr',
        function()
          local grug = require('grug-far')
          local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n', 'v' },
        desc = 'Search and Replace',
      },
    },
    config = function()
      require('grug-far').setup({
        headerMaxWidth = 80,
      })
    end,
  },

  -- TODO comments highlighting (todo-comments already in lazy-lock)
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
      { '<leader>xt', '<cmd>TodoTrouble<cr>', desc = 'Todo (Trouble)' },
      { '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
      { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
      { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
    },
    opts = {},
  },
}