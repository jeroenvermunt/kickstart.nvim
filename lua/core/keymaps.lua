-- Set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

-- General keymaps
-- keymap.set('i', 'fd', '<ESC>') -- exit insert mode with jk
-- keymap.set('i', 'df', '<ESC>') -- exit insert mode with jk
keymap.set('n', '<leader>wq', ':wq<CR>') -- save and quit
keymap.set('n', '<leader>qq', ':q!<CR>') -- quit without saving
keymap.set('n', '<leader>ww', ':w<CR>') -- save
keymap.set('n', 'gx', ':!open <c-r><c-a><CR>') -- open URL under cursor

-- general QoL
keymap.set('i', 'LK', '<ESC>/[]|)]<Enter><cmd>nohlsearch<CR>a') --  escape brackets
keymap.set('x', '<leader>p', '"_dP') -- paste without yanking
keymap.set('n', '<leader>p', '"+P') -- paste from system clipboard
keymap.set('n', '<leader>y', '*y') -- yank to system clipboard
keymap.set('n', '<C-A>', 'ggV/if __name__<Enter>k<cmd>nohlsearch<CR>') -- select all without if __name__ == '__main__':
-- keymap.set('i', '<C-h>', '<home>') -- move to beginning of line
-- keymap.set('i', '<C-l>', '<END>') -- move to end of line
-- keymap.set('i', '<C-b>', '<ESC>$a:<ESC>jo') -- move to beginning of line

-- Python QoL
keymap.set('i', 'VJ', '<ESC>/[]|)]<Enter><cmd>nohlsearch<CR>a:<Enter>') -- move to beginning of line
keymap.set('i', '<C-s>m', "<Enter><Enter>if __name__ == '__main__':<Enter>main()<ESC>3kidef main():<Enter>") -- move to end of line
keymap.set('i', '<C-s>c', '<ESC>$a:<Enter><Enter>def __init__()<C-o>i') -- move to end of line

-- Quickfix short
keymap.set('n', '<C-j>', ':cnext<CR>') -- move to next quickfix
keymap.set('n', '<C-k>', ':cprev<CR>') -- move to previous quickfix

-- Split window management
keymap.set('n', '<C-\\>', '<C-w>v') -- split window vertically

---- Keybinds to make split navigation easier.
----  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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
keymap.set('n', '<leader>ar', ':NeovimProjetLoadRecent<CR>', { desc = 'Load recent project' })

-- Toggle diagnostics
keymap.set('n', '<leader>td', ':ToggleDiag<CR>')

-- Toggle diff split-viewer
local diffState = false
local function toggleDiff()
  vim.api.nvim_command(diffState and 'windo diffoff' or 'windo diffthis')
  diffState = not diffState
end
vim.keymap.set('n', '<leader>dc', toggleDiff, { desc = 'Diff split view to [C]ompare documents' })
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

-- git commit
keymap.set('n', '<leader>gc', function()
  local commit_message = vim.fn.input 'Commit message: '

  if commit_message == '' then
    print 'Commit message cannot be empty'
    return
  end

  vim.api.nvim_command('Git commit -m "' .. commit_message .. '"')
end)

local function system(command)
  local file = assert(io.popen(command, 'r'))
  local output = file:read('*all'):gsub('%s+', '')
  file:close()
  return output
end

ENV_CONFIG = {
  ['Huurprijshulp'] = 'hph',
  ['huurprijshulp-check'] = 'hph',
  ['hubspot-iac'] = 'hubspot-iac',
}

-- keymap.set('n', '<leader>ht', function()
--   local environment_full_path = system 'which python'
--   local env_array = string.match(environment_full_path, '(.*)(/python)')

--   -- output "/mnt/tmp/" "myfile.txt"    "txt"
--   -- local environment = ENV_CONFIG[env_array]
--   local env_path = env_array[0]

--   require('harpoon.term').gotoTerminal(LAST_TERMINAL)
--   require('harpoon.term').sendCommand(LAST_TERMINAL, string.format('source %s/activate\n', env_array[1]))
-- end, { desc = 'Go to terminal and activate venv' })

local harpoon = require 'harpoon'

harpoon:setup()

keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end)
keymap.set('n', '<leader>hh', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set('n', '<leader>h1', function()
  harpoon:list():select(1)
end, { desc = 'Harpoon file 1' })
keymap.set('n', '<leader>h2', function()
  harpoon:list():select(2)
end, { desc = 'Harpoon file 2' })
keymap.set('n', '<leader>h3', function()
  harpoon:list():select(3)
end, { desc = 'Harpoon file 3' })
keymap.set('n', '<leader>h4', function()
  harpoon:list():select(4)
end, { desc = 'Harpoon file 4' })
keymap.set('n', '<leader>h5', function()
  harpoon:list():select(5)
end, { desc = 'Harpoon file 5' })
keymap.set('n', '<leader>h6', function()
  harpoon:list():select(6)
end, { desc = 'Harpoon file 6' })
keymap.set('n', '<leader>h7', function()
  harpoon:list():select(7)
end, { desc = 'Harpoon file 7' })
keymap.set('n', '<leader>h8', function()
  harpoon:list():select(8)
end, { desc = 'Harpoon file 8' })
keymap.set('n', '<leader>h9', function()
  harpoon:list():select(9)
end, { desc = 'Harpoon file 9' })

---@type HarpoonList
local term_list = harpoon:list 'terms'

---@return string name of the created terminal
local function create_terminal()
  vim.cmd 'terminal'
  local buf_id = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_get_name(buf_id)
end

---@param index number: The index of the terminal to select.
local function select_term(index)
  if index > term_list:length() then
    create_terminal()
    print('Creating terminal', index)
    -- just add the newly open terminal
    term_list:add()
  else
    -- find in list
    print('selecting terminal', index)
    term_list:select(index)
  end
end

--
local function send_command(index, command)
  select_term(index)
  local channel_id = vim.b.terminal_job_id
  vim.api.nvim_chan_send(channel_id, command)
end

-- TODO this wont work when term gets deleted by telescope
local function remove_closed_terms()
  for _, term in ipairs(term_list.items) do
    local bufnr = vim.fn.bufnr(term.value)
    if bufnr == -1 then
      print('Removing:' .. term.value)
      term_list:remove(term)
    end
    -- can get id here with nvim_buf_get_name because buffer is already deleted
    --term_list:remove(term_name)
    --
  end
end

-- Harpoon
CURRENT_TERMINAL = 1
MAIN_TERMINAL = 1
MAIN_FILE = nil

-- Autocommand to remove closed terminal from the list

-- "VimEnter" cleans terminals that were saved when you closed vim for the last time but were not removed
vim.api.nvim_create_autocmd({ 'TermClose', 'VimEnter' }, {
  pattern = '*',
  callback = remove_closed_terms,
})

-- This is needed because closing term with bd! won't trigger "TermClose"
vim.api.nvim_create_autocmd({ 'BufDelete', 'BufUnload' }, {
  pattern = 'term://*',
  callback = remove_closed_terms,
})

vim.keymap.set('n', '<leader>ht', function()
  print('Creating terminal', CURRENT_TERMINAL)
  select_term(CURRENT_TERMINAL)
end)

-- Command that I use for debugging
vim.api.nvim_create_user_command('HarpoonShowTermList', function()
  harpoon.ui:toggle_quick_menu(term_list)
end, {})

local init_terminal = function()
  -- local environment = vim.fn.input 'Set virtual environment (conda): '
  local environment = require('venv-selector').get_active_venv()
  send_command(CURRENT_TERMINAL, string.format('conda activate %s\n', environment))
end

keymap.set('n', '<leader>hv', init_terminal, { desc = 'Go to terminal and activate venv' })

-- vim.api.nvim_create_autocmd({ 'VenvSelect' }, {
--   callback = init_terminal,
-- })
--

keymap.set('n', '<leader>hm', function()
  MAIN_FILE = vim.fn.expand '%:p'
end, { desc = 'Set main file' })

keymap.set('n', '<leader>h<Enter>', function()
  -- save current file
  vim.api.nvim_command 'w'
  local current_file = vim.fn.expand '%:p'
  select_term(CURRENT_TERMINAL)
  local environment = require('venv-selector').get_active_venv()
  send_command(CURRENT_TERMINAL, string.format('conda activate %s && python %s \n', environment, current_file))
end, { desc = 'Run current python file' })

keymap.set('n', '<leader><Enter>', function()
  -- save all files current file
  vim.api.nvim_command 'wall'
  select_term(CURRENT_TERMINAL)
  local environment = require('venv-selector').get_active_venv()
  send_command(CURRENT_TERMINAL, string.format('conda activate %s && python %s \n', environment, MAIN_FILE))
end, { desc = 'Run current python file' })

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

-- Jupytext + Molten
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.ipynb' },
  callback = function()
    -- vim.api.nvim_command 'MoltenInit python3'
    --
    -- Run current cell
    vim.keymap.set('n', '<C-n>', '?```<Enter>jVNk:<C-u>MoltenEvaluateVisual<CR>Nk<cmd>nohlsearch<CR><ESC>', { noremap = true })
    -- Run current cell and move to next cell
    vim.keymap.set('n', '<C-m>', '?```<Enter>jVNk:<C-u>MoltenEvaluateVisual<CR>/```python<Enter>j<cmd>nohlsearch<CR>', { noremap = false })

    vim.keymap.set('n', '<leader>ji', '<cmd>MoltenInit python3<CR>')
    -- jump to next cell
    vim.keymap.set('n', '<C-j>', '/```python<Enter>j<cmd>nohlsearch<CR>', { noremap = true })
    -- Jump to previous cell
    vim.keymap.set('n', '<C-k>', '?```\\(p\\)\\@!<Enter>k<cmd>nohlsearch<CR>', { noremap = true })
  end,
})

-- vim.keymap.set('n', '<leader>jn', function()
--   -- excute ?```<Enter>jVNk<cmd>nohlsearch<CR>'
--   vim.api.nvim_command '?```<Enter>jVNk<cmd>nohlsearch<CR>'
-- end)

vim.keymap.set('n', '<leader>daf', function()
  require('azure-functions').deploy_app()
end)

vim.keymap.set('n', '<leader>das', function()
  require('azure-functions').start_app()
end)
