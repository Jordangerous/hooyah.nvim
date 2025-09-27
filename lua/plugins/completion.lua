-- Completion engines and sources
return {
  -- Disable LazyVim's default nvim-cmp stack so blink.cmp can take over completely
  { 'hrsh7th/nvim-cmp', enabled = false },
  { 'hrsh7th/cmp-nvim-lsp', enabled = false },
  { 'hrsh7th/cmp-buffer', enabled = false },
  { 'hrsh7th/cmp-path', enabled = false },
  { 'hrsh7th/cmp-cmdline', enabled = false },
  { 'saadparwaiz1/cmp_luasnip', enabled = false },

  -- Primary completion engine (blink.cmp already in lazy-lock, so configure it)
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },

  -- GitHub Copilot integration for blink.cmp
  {
    'giuxtaposition/blink-cmp-copilot',
    event = 'InsertEnter',
    dependencies = { 'saghen/blink.cmp' },
    opts = {},
  },

  -- GitHub Copilot base plugin
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false }, -- Disable to avoid conflicts with blink
      panel = { enabled = false },
    },
  },

  -- Copilot Chat interface
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    cmd = 'CopilotChat',
    keys = {
      { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'Copilot Chat' },
    },
    opts = {
      debug = false,
    },
  },
}