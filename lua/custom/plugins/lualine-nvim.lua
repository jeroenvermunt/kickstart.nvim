local get_active_venv = function()
  local venv_name = require('venv-selector').get_active_venv()
  local python_version = vim.fn.system 'python --version'
  python_version = string.gsub(python_version, 'Python ', '')
  python_version = string.gsub(python_version, '^@', '')
  venv_name = venv_name .. ' ' .. python_version

  if venv_name ~= nil then
    -- If the venv is a poetry venv, replace the path with (poetry)
    if string.match(venv_name, '.*/pypoetry/virtualenvs/') then
      return string.gsub(venv_name, '.*/pypoetry/virtualenvs/', '(poetry) ')
    end

    -- If the venv is a conda venv, replace the path with (conda)
    if string.match(venv_name, '.*/anaconda3/envs/') then
      return string.gsub(venv_name, '.*/anaconda3/envs/', '(conda) ')
    end

    -- If the venv is a venv, replace the path with (venv)
    if string.match(venv_name, '.*/.venv/') then
      return string.gsub(venv_name, '.*/.venv/', '(venv) ')
    end

    return venv_name
  else
    return ''
  end
end

return {

  -- https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- fancy icons
    'linux-cultist/venv-selector.nvim',
    -- https://github.com/linrongbin16/lsp-progress.nvim
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  opts = {
    options = {
      -- For more themes, see https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
      theme = 'codedark', -- "auto, tokyonight, catppuccin, codedark, nord"
      -- theme = 'catppuccin', -- "auto, tokyonight, catppuccin, codedark, nord"
    },
    extensions = { 'fugitive', 'nvim-tree', 'quickfix', 'nvim-dap-ui' },
    sections = {
      lualine_c = {
        {
          -- Customize the filename part of lualine to be parent/filename
          'filename',
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 4, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          symbols = {
            modified = '[+]', -- Text to show when the file is modified.
            readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
          },
        },
      },
      -- lualine_d = {
      --   get_active_venv,
      -- },
      lualine_x = { get_active_venv, 'encoding', 'fileformat', 'filetype' },
    },
  },
}
