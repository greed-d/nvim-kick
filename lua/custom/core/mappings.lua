local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map({ 'n', 'i', 'v' }, '<A-k>', "V:m '<-2<cr>gv=gv<esc>", { desc = 'Move line up' })
map({ 'n', 'i', 'v' }, '<A-j>', "V:m '>+1<cr>gv=gv<esc>", { desc = 'Move line down' })
map({ 'n', 'v', 'x' }, '<S-h>', '^', { desc = 'Move to front of line' })
map({ 'n', 'v', 'x' }, '<S-l>', '$', { desc = 'Move to end of line' })
map({ 'n', 'v' }, '<', '<gv', { desc = 'Move indent left once' })
map({ 'n', 'v' }, '>', '>gv', { desc = 'Move indent left once' })
map({ 'n', 'v', 't', 'x' }, '<A-,>', '<C-w><', { desc = 'Decrease window size' })
map({ 'n', 'v', 't', 'x' }, '<A-.>', '<C-w>>', { desc = 'Move indent left once' })

map('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
map('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

map('n', '<leader>sa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'telescope [S]earch [A]ll files' })

-- terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- map({ 'n', 'v', 'i', 't' }, '<C-b>', function()
--   local terminal = require 'nvterm.terminal'
--   local file = vim.fn.expand '%'
--   local sfile = vim.fn.expand '%:r'
--   local ft_cmds = {
--     sh = 'bash ' .. file,
--     rust = 'cargo ' .. file,
--     python = 'python3 ' .. file,
--     javascript = 'node ' .. file,
--     java = 'javac ' .. file .. ' && java ' .. sfile,
--     go = 'go build && go run ' .. file,
--     c = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
--     cpp = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
--     typescript = 'deno compile ' .. file .. ' && deno run ' .. file,
--   }
--   terminal.send(ft_cmds[vim.bo.ft], 'float')
-- end, { desc = 'Build and Run file' })

map({ 'n', 'v', 'i', 't' }, '<C-b>', function()
  local terminal = require 'nvterm.terminal'
  local file = vim.fn.expand '%'
  local sfile = vim.fn.expand '%:r'
  local ft_cmds = {
    sh = 'bash ' .. file,
    rust = 'cargo ' .. file,
    python = 'python3 ' .. file,
    javascript = 'node ' .. file,
    java = 'javac ' .. file .. ' && java ' .. sfile,
    go = 'go build && go run ' .. file,
    c = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
    cpp = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
    typescript = 'deno compile ' .. file .. ' && deno run ' .. file,
  }

  -- Save current buffer
  local current_bufnr = vim.fn.bufnr '%'
  vim.cmd 'w'

  -- Open terminal and run command
  terminal.send(ft_cmds[vim.bo.ft], 'float')

  -- Focus back to terminal window
  vim.cmd 'wincmd p'
end, { desc = 'Build and Run file' })

-- toggleable
map({ 'n', 't' }, '<A-v>', function()
  require('nvterm.terminal').toggle 'vertical'
end, { desc = 'Show vertical terminal' })

map({ 'n', 't' }, '<A-h>', function()
  require('nvterm.terminal').toggle 'horizontal'
end, { desc = 'Show horizontal terminal' })

map({ 'n', 't' }, '<A-i>', function()
  require('nvterm.terminal').toggle 'float'
end, { desc = 'Show floating terminal' })
