return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    'linux-cultist/venv-selector.nvim',
  },
  config = function()
    -- Update the path passed to setup to point to your system or virtual env python binary
    require('dap-python').setup(require('venv-selector').get_active_path())
  end,
}
