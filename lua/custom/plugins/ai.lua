return {

  -- custom config which piggybacks on the copilot extras in lazy.lua.
  {
    'zbirenbaum/copilot.lua',
    enabled = true,
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    cmd = 'Copilot',
    build = ':Copilot auth',

    -- opts = {
    --   suggestion = { enabled = true, auto_trigger = true, keymap = { accept = '<C-j>' } },
    --   panel = {
    --     enabled = true,
    --     auto_refresh = false,
    --     keymap = {
    --       jump_prev = '<C-p>',
    --       jump_next = '<C-n>',
    --       accept = '<C-j>',
    --       refresh = 'gr',
    --       open = '<C-k>',
    --     },
    --     layout = {
    --       position = 'bottom', -- | top | left | right
    --       ratio = 0.4,
    --     },
    --   },
    -- },

    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          -- use the built-in keymapping for "accept" (<M-l>)
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
        },
      }

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      -- local cmp_status_ok, cmp = pcall(require, 'cmp')
      -- if cmp_status_ok then
      --   cmp.event:on('menu_opened', function()
      --     vim.b.copilot_suggestion_hidden = true
      --   end)

      --   cmp.event:on('menu_closed', function()
      --     vim.b.copilot_suggestion_hidden = false
      --   end)
      -- end
    end,
  },

  -- -- copilot status in lualine
  -- -- this is taken from the copilot lazyvim extras at:
  -- -- https://www.lazyvim.org/plugins/extras/coding.copilot
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   optional = true,
  --   event = 'VeryLazy',
  --   opts = function(_, opts)
  --     --  local Util = require 'lazyvim.util'
  --     local colors = {
  --       [''] = Util.ui.fg 'Special',
  --       ['Normal'] = Util.ui.fg 'Special',
  --       ['Warning'] = Util.ui.fg 'DiagnosticError',
  --       ['InProgress'] = Util.ui.fg 'DiagnosticWarn',
  --     }
  --     table.insert(opts.sections.lualine_x, 2, {
  --       function()
  --         local icon = require('lazyvim.config').icons.kinds.Copilot
  --         local status = require('copilot.api').status.data
  --         return icon .. (status.message or '')
  --       end,
  --       cond = function()
  --         local ok, clients = pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
  --         return ok and #clients > 0
  --       end,
  --       color = function()
  --         if not package.loaded['copilot'] then
  --           return
  --         end
  --         local status = require('copilot.api').status.data
  --         return colors[status.status] or colors['']
  --       end,
  --     })
  --   end,
  -- },

  -- https://github.com/jackMort/ChatGPT.nvim
  -- {
  --   'jackMort/ChatGPT.nvim',
  --   dependencies = {
  --     { 'MunifTanjim/nui.nvim' },
  --     { 'nvim-lua/plenary.nvim' },
  --     { 'nvim-telescope/telescope.nvim' },
  --   },
  --   -- event = "VeryLazy",
  --   config = function()
  --     require('chatgpt').setup {
  --       actions_paths = { '~/code/dotfiles/nvim-lazyvim/chatgpt-actions.json' },
  --       openai_params = {
  --         model = 'gpt-4',
  --         max_tokens = 4000,
  --       },
  --       openai_edit_params = {
  --         model = 'gpt-3.5-turbo',
  --         temperature = 0,
  --         top_p = 1,
  --         n = 1,
  --       },
  --     }
  --   end,
  -- },

  {
    -- help:
    -- /modellist
    -- /model  <model name from model list>
    -- /replace <number from code suggestion>
    -- exit with CTRL+C
    'dustinblackman/oatmeal.nvim',
    cmd = { 'Oatmeal' },
    keys = {
      { '<leader>om', mode = 'n', desc = 'Start Oatmeal session' },
    },
    opts = {
      backend = 'ollama',
      model = 'codellama:latest',
    },
  },
}
