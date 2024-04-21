return {
  'sanathks/workspace.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('workspace').setup {
      workspaces = {
        { name = 'Huurprijshulp', path = '~/Documents/work_projects/Huurprijshulp/hph_python_files/source', keymap = { '<leader>ph' } },
      },
    }
  end,
}
