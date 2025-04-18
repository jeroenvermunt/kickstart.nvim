return {
  'SergioRibera/cmp-dotenv',
  setup = function()
    local cmp = require 'cmp'
    cmp.setup.buffer {
      sources = {
        { name = 'dotenv' },
      },
    }
  end,
}
