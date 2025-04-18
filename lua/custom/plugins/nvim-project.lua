-- local Path = require 'plenary.path'
-- local config = require 'session_manager.config'

return {
  {
    'Shatur/neovim-session-manager',

    -- config = function()
    --   require('neovim-session-manager').setup {
    --     sessions_dir = Path:new(vim.fn.stdpath 'data', 'sessions'), -- The directory where the session files will be saved.
    --     -- session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
    --     -- dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
    --     autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    --     autosave_last_session = true, -- Automatically save last session on exit and on session switch.
    --     autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    --     autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
    --     autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    --       'gitcommit',
    --       'gitrebase',
    --     },
    --     autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
    --     autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    --     max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    --   }
    -- end,
  },
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        -- '~/projects/*',
        '~/.config/nvim',
        '~/Documents/python_repos/*',
        '~/Documents/python_repos/hph-azure-functions/*',
        '~/Documents/lua_plugins/*',
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
}
