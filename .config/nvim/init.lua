local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn
local g = vim.g

-- Options
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.wrap = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 1
opt.completeopt = 'menuone,noinsert,noselect'
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.conceallevel = 0
opt.concealcursor = ''
opt.lazyredraw = true
opt.synmaxcol = 300
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = fn.expand('~/.vim/undodir')
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false
opt.hidden = true
opt.errorbells = false
opt.backspace = 'indent,eol,start'
opt.autochdir = false
opt.iskeyword:append('-')
opt.path:append('**')
opt.selection = 'exclusive'
opt.mouse = 'a'
opt.clipboard:append('unnamedplus')
opt.modifiable = true
opt.encoding = 'UTF-8'
opt.splitbelow = true
opt.splitright = true
opt.wildmenu = true
opt.wildmode = 'longest:full,full'
opt.wildignore:append({ '*.o', '*.obj', '*.pyc', '*.class', '*.jar' })
opt.diffopt:append('linematch:60')
opt.redrawtime = 10000
opt.maxmempattern = 20000
opt.showtabline = 1

-- Theme
cmd.colorscheme('unokai')
api.nvim_set_hl(0, 'Normal', { bg = 'none' })
api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
api.nvim_set_hl(0, 'StatusLineBold', { bold = true })
cmd([[hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE]])

-- Keymaps
g.mapleader = ' '
g.maplocalleader = ' '
local map = vim.keymap.set
local map_opts = { silent = true, noremap = true }

map('i', '(', '()<Left>', map_opts)
map('i', '"', '""<Left>', map_opts)
map('i', "'", "''<Left>", map_opts)
map('i', '<', '<><Left>', map_opts)
map('i', '{', '{}<Left>', map_opts)
map('i', '[', '[]<Left>', map_opts)
map('n', '<leader>c', ':nohlsearch<CR>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map({ 'n', 'v' }, '<leader>d', '"_d')
map('n', '<leader>bn', ':bnext<CR>')
map('n', '<leader>bp', ':bprevious<CR>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>sv', ':vsplit<CR>')
map('n', '<leader>sh', ':split<CR>')
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")
map('v', '<', '<gv')
map('v', '>', '>gv')
map('n', '<leader>e', ':Explore<CR>')
map('n', '<leader>ff', ':find ')
map('n', 'J', 'mzJ`z')
map('n', '<leader>rc', ':e ' .. fn.stdpath('config') .. '/init.lua<CR>')
map('n', '<leader>pa', function()
  local path = fn.expand('%:p')
  fn.setreg('+', path)
  print('file: ' .. path)
end)

map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>tx', ':tabclose<CR>')
map('n', '<leader>tm', ':tabmove<CR>')
map('n', '<leader>t>', ':tabmove +1<CR>')
map('n', '<leader>t<', ':tabmove -1<CR>')
map('n', '<leader>tO', function()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      cmd('tabnew ' .. input)
    end
  end)
end)
map('n', '<leader>td', function()
  local current_file = fn.expand('%:p')
  cmd('tabnew ' .. (current_file ~= '' and current_file or ''))
end)
map('n', '<leader>tr', function()
  local current_tab = fn.tabpagenr()
  local last_tab = fn.tabpagenr('$')
  for i = last_tab, current_tab + 1, -1 do
    cmd(i .. 'tabclose')
  end
end)
map('n', '<leader>tL', function()
  local current_tab = fn.tabpagenr()
  for i = current_tab - 1, 1, -1 do
    cmd('1tabclose')
  end
end)
map('n', '<leader>bd', function()
  if #fn.tabpagebuflist() > 1 then
    cmd('bdelete')
  else
    cmd('tabclose')
  end
end)

-- Autocmds
local group = api.nvim_create_augroup('UserConfig', { clear = true })
local autocmd = api.nvim_create_autocmd

autocmd('TextYankPost', {
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd('BufReadPost', {
  group = group,
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
autocmd('FileType', {
  group = group,
  pattern = { 'lua', 'python' },
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
  end,
})
autocmd('FileType', {
  group = group,
  pattern = { 'javascript', 'typescript', 'json', 'html', 'css' },
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
  end,
})
autocmd('TermClose', {
  group = group,
  callback = function()
    if vim.v.event.status == 0 then
      api.nvim_buf_delete(0, {})
    end
  end,
})
autocmd('TermOpen', {
  group = group,
  callback = function()
    opt.number = false
    opt.relativenumber = false
    opt.signcolumn = 'no'
  end,
})
autocmd('VimResized', {
  group = group,
  callback = function()
    cmd('tabdo wincmd =')
  end,
})
autocmd('BufWritePre', {
  group = group,
  callback = function()
    local dir = fn.expand('<afile>:p:h')
    if not fn.isdirectory(dir) then
      fn.mkdir(dir, 'p')
    end
  end,
})
autocmd({ 'WinEnter', 'BufEnter' }, {
  group = group,
  callback = function()
    opt.statusline = '  %#StatusLineBold#%{v:lua.mode_icon()} %#StatusLine#| %f %h%m%r %{v:lua.git_branch()} | %{v:lua.file_type()} | %{v:lua.file_size()} | %l:%c  %P '
  end,
})
autocmd({ 'WinLeave', 'BufLeave' }, {
  group = group,
  callback = function()
    opt.statusline = '  %f %h%m%r | %{v:lua.file_type()} | %=  %l:%c   %P '
  end,
})

-- Functions
_G.mode_icon = function()
  local mode = fn.mode()
  local modes = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'V-LINE',
    ['\22'] = 'V-BLOCK',
    c = 'COMMAND',
    s = 'SELECT',
    S = 'S-LINE',
    ['\19'] = 'S-BLOCK',
    R = 'REPLACE',
    r = 'REPLACE',
    ['!'] = 'SHELL',
    t = 'TERMINAL',
  }
  return modes[mode] or mode:upper()
end
_G.git_branch = function()
  local branch = fn.system('git branch --show-current 2>/dev/null'):gsub('\n', '')
  return branch ~= '' and ' ' .. branch .. ' ' or ''
end
_G.file_type = function()
  local ft = vim.bo.filetype
  local icons = {
    lua = '[LUA]',
    python = '[PY]',
    javascript = '[JS]',
    html = '[HTML]',
    css = '[CSS]',
    json = '[JSON]',
    markdown = '[MD]',
    vim = '[VIM]',
    sh = '[SH]',
    cpp = '[C++]',
  }
  return (icons[ft] or ft)
end
_G.file_size = function()
  local size = fn.getfsize(fn.expand('%'))
  if size < 0 then
    return ''
  elseif size < 1024 then
    return size .. 'B '
  elseif size < 1024 * 1024 then
    return string.format('%.1fK', size / 1024)
  else
    return string.format('%.1fM', size / 1024 / 1024)
  end
end

-- Startup
local undodir = fn.expand('~/.vim/undodir')
if not fn.isdirectory(undodir) then
  fn.mkdir(undodir, 'p')
end
