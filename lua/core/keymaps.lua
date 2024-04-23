-- Set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

-- General keymaps
keymap.set('i', 'fd', '<ESC>') -- exit insert mode with jk
keymap.set('i', 'df', '<ESC>') -- exit insert mode with jk
keymap.set('n', '<leader>wq', ':wq<CR>') -- save and quit
keymap.set('n', '<leader>qq', ':q!<CR>') -- quit without saving
keymap.set('n', '<leader>ww', ':w<CR>') -- save
keymap.set('n', 'gx', ':!open <c-r><c-a><CR>') -- open URL under cursor

-- general QoL
keymap.set('i', 'LK', '<ESC>/[]|)]<Enter><cmd>nohlsearch<CR>a') --  escape brackets
keymap.set('x', '<leader>p', '"_dP') -- paste without yanking
keymap.set('n', '<leader>p', '"+P') -- paste from system clipboard
keymap.set('n', '<leader>y', '*y') -- yank to system clipboard
-- keymap.set('i', '<C-h>', '<home>') -- move to beginning of line
-- keymap.set('i', '<C-l>', '<END>') -- move to end of line
-- keymap.set('i', '<C-b>', '<ESC>$a:<ESC>jo') -- move to beginning of line

-- Python QoL
keymap.set('i', 'VJ', '<ESC>/[]|)]<Enter><cmd>nohlsearch<CR>a:<Enter>') -- move to beginning of line
keymap.set('i', '<C-s>m', "if __name__ == '__main__':<Enter><Enter>") -- move to end of line
keymap.set('i', '<C-s>c', '<ESC>$a:<Enter><Enter>def __init__()<C-o>i') -- move to end of line

-- Quickfix short
keymap.set('n', '<C-j>', ':cnext<CR>') -- move to next quickfix
keymap.set('n', '<C-k>', ':cprev<CR>') -- move to previous quickfix

-- Split window management
keymap.set('n', '<C-\\>', '<C-w>v') -- split window vertically

---- Keybinds to make split navigation easier.
----  See `:help wincmd` for a list of all window commands
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab management
keymap.set('n', '<leader>to', ':tabnew<CR>') -- open a new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close a tab
keymap.set('n', '<leader>tn', ':tabn<CR>') -- next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') -- previous tab

-- Diff keymaps
keymap.set('n', '<leader>cc', ':diffput<CR>') -- put diff from current to other during diff
keymap.set('n', '<leader>cj', ':diffget 1<CR>') -- get diff from left (local) during merge
keymap.set('n', '<leader>ck', ':diffget 3<CR>') -- get diff from right (remote) during merge
keymap.set('n', '<leader>cn', ']c') -- next diff hunk
keymap.set('n', '<leader>cp', '[c') -- previous diff hunk

-- Quickfix keymaps
keymap.set('n', '<leader>qo', ':copen<CR>') -- open quickfix list
keymap.set('n', '<leader>qf', ':cfirst<CR>') -- jump to first quickfix list item
keymap.set('n', '<leader>qn', ':cnext<CR>') -- jump to next quickfix list item
keymap.set('n', '<leader>qp', ':cprev<CR>') -- jump to prev quickfix list item
keymap.set('n', '<leader>ql', ':clast<CR>') -- jump to last quickfix list item
keymap.set('n', '<leader>qc', ':cclose<CR>') -- close quickfix list

-- Vim-maximizer
keymap.set('n', '<leader>wm', ':MaximizerToggle<CR>') -- toggle maximize tab

-- Nvim-tree
keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>') -- toggle file explorer
keymap.set('n', '<leader>er', ':NvimTreeFocus<CR>') -- toggle focus to file explorer
keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>') -- find file in file explorer

-- recent projects
keymap.set('n', '<leader>ap', ':Telescope neovim-project history<CR>', { desc = 'Open recent project' })
keymap.set('n', '<leader>ad', ':Telescope neovim-project discover<CR>', { desc = 'Discover projects' })
keymap.set('n', '<leader>ar', ':NeovimProjectLoadRecent<CR>', { desc = 'Load recent project' })

-- Toggle diagnostics
keymap.set('n', '<leader>td', ':ToggleDiag<CR>')

-- Telescope
-- keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
-- keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
-- keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
-- keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
-- keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
-- keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
-- keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
-- keymap.set('n', '<leader>fm', function()
--   require('telescope.builtin').treesitter { default_text = ':method:' }
-- end)

-- Git-blame
keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>') -- toggle git blame

-- Open git menu
keymap.set('n', '<leader>gm', ':Git<CR>')

-- Harpoon
keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = 'Add file to harpoon' })
keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu, { desc = 'Toggle harpoon menu' })

keymap.set('n', '<leader>ht', function()
  require('harpoon.term').gotoTerminal(1)
end, { desc = 'Go to terminal' })
-- Harpoon

-- keymap.set('n', '<leader>ht', function()
--   require('harpoon.term').gotoTerminal(1)
-- end, { desc = 'Go to terminal' })

-- local harpoon = require 'harpoon'

-- harpoon:setup()

-- keymap.set('n', '<leader>ha', function()
--   harpoon:list():add()
-- end)
-- keymap.set('n', '<leader>hh', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)

-- keymap.set('n', '<leader>h1', function()
--   harpoon:list():select(1)
-- end, { desc = 'Harpoon file 1' })
-- keymap.set('n', '<leader>h2', function()
--   harpoon:list():select(2)
-- end, { desc = 'Harpoon file 2' })
-- keymap.set('n', '<leader>h3', function()
--   harpoon:list():select(3)
-- end, { desc = 'Harpoon file 3' })
-- keymap.set('n', '<leader>h4', function()
--   harpoon:list():select(4)
-- end, { desc = 'Harpoon file 4' })
-- keymap.set('n', '<leader>h5', function()
--   harpoon:list():select(5)
-- end, { desc = 'Harpoon file 5' })
-- keymap.set('n', '<leader>h6', function()
--   harpoon:list():select(6)
-- end, { desc = 'Harpoon file 6' })
-- keymap.set('n', '<leader>h7', function()
--   harpoon:list():select(7)
-- end, { desc = 'Harpoon file 7' })
-- keymap.set('n', '<leader>h8', function()
--   harpoon:list():select(8)
-- end, { desc = 'Harpoon file 8' })
-- keymap.set('n', '<leader>h9', function()
--   harpoon:list():select(9)
-- end, { desc = 'Harpoon file 9' })

keymap.set('n', '<leader>h1', function()
  require('harpoon.ui').nav_file(1)
end, { desc = 'Navigate to harpoon file 1' })
keymap.set('n', '<leader>h2', function()
  require('harpoon.ui').nav_file(2)
end, { desc = 'navigate to harpoon file 2' })
keymap.set('n', '<leader>h3', function()
  require('harpoon.ui').nav_file(3)
end, { desc = 'navigate to harpoon file 3' })
keymap.set('n', '<leader>h4', function()
  require('harpoon.ui').nav_file(4)
end, { desc = 'navigate to harpoon file 4' })
keymap.set('n', '<leader>h5', function()
  require('harpoon.ui').nav_file(5)
end, { desc = 'navigate to harpoon file 5' })
keymap.set('n', '<leader>h6', function()
  require('harpoon.ui').nav_file(6)
end, { desc = 'navigate to harpoon file 6' })
keymap.set('n', '<leader>h7', function()
  require('harpoon.ui').nav_file(7)
end, { desc = 'navigate to harpoon file 7' })
keymap.set('n', '<leader>h8', function()
  require('harpoon.ui').nav_file(8)
end, { desc = 'navigate to harpoon file 8' })
keymap.set('n', '<leader>h9', function()
  require('harpoon.ui').nav_file(9)
end, { desc = 'navigate to harpoon file 9' })

-- Vim REST Console
keymap.set('n', '<leader>xr', ':call VrcQuery()<CR>') -- Run REST query

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.form:at({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set('n', '<leader>go', function()
  if vim.bo.filetype == 'python' then
    vim.api.nvim_command 'PyrightOrganizeImports'
  end
end)

keymap.set('n', '<leader>tc', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_class()
  end
end)

keymap.set('n', '<leader>tm', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_method()
  end
end)

-- Debugging
keymap.set('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>")
keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<cr>")
keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_into()<cr>")
keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>")
keymap.set('n', '<leader>dd', function()
  require('dap').disconnect()
  require('dapui').close()
end)
keymap.set('n', '<leader>dt', function()
  require('dap').terminate()
  require('dapui').close()
end)
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>")
keymap.set('n', '<leader>di', function()
  require('dap.ui.widgets').hover()
end)
keymap.set('n', '<leader>d?', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end)
keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set('n', '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set('n', '<leader>de', function()
  require('telescope.builtin').diagnostics { default_text = ':E:' }
end)
