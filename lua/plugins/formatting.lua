-- Code formatting and linting
return {
  -- Formatter runner (conform already in lazy-lock)
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'goimports', 'gofmt' },
        rust = { 'rustfmt' },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- Linter runner (nvim-lint already in lazy-lock)
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        python = { 'pylint' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        go = { 'golangcilint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- none-ls for additional formatting/diagnostics sources
  {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      local nls = require('null-ls')
      return {
        sources = {
          -- Additional formatters that aren't in conform
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.terraform_fmt,
          
          -- Code actions
          nls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}