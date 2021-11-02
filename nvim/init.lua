-- init.lua
-- Neovim-specific configuration

require("globals")
require('lualine').setup{
	options = { theme = 'onedark' }
}
require("plugins.init")
require("plugins.fzf")

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local env = vim.env

local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap

-- General settings
cmd [[syntax on]]
cmd [[filetype plugin indent on]]
cmd [[let g:onedark_style = 'darker']]
cmd [[colorscheme gruvbox]]

-- UltiSnips Trigger configuration.
g["ycm_key_list_select_completion"] = {'<C-n>', '<Down>'}
g["ycm_key_list_previous_completion"] = {'<C-p>', '<Up>'}
g["UltiSnipsExpandTrigger"] = "<Tab>"
g["UltiSnipsJumpForwardTrigger"] = "<Tab>"
g["UltiSnipsJumpBackwardTrigger"] = "<S-Tab>"
g["UltiSnipsEditSplit"] = "vertical"
g["UltiSnipsSnippetDirectories"] = {'~/.config/nvim/UltiSnips', 'UltiSnips'}


opt.backup = false -- don't use backup files
opt.writebackup = false -- don't backup the file while editing
opt.swapfile = false -- don't create swap files for new buffers
opt.updatecount = 0 -- don't write swap files after some number of updates

opt.history = 1000 -- store the last 1000 commands entered
opt.textwidth = 120 -- after configured number of characters, wrap line

opt.backspace = {"indent", "eol,start"} -- make backspace behave in a sane manner
opt.clipboard = {"unnamed", "unnamedplus"} -- use the system clipboard
opt.mouse = "a" -- set mouse mode to all modes

-- searching
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case-sensitive if expresson contains a capital letter
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- set incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- set magic on, for regular expressions

-- error bells
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

-- Appearance
---------------------------------------------------------
o.termguicolors = true
opt.number = true -- show line numbers
opt.wrap = false -- turn on line wrapping
opt.wrapmargin = 8 -- wrap lines when coming within n characters from side
opt.linebreak = true -- set soft wrapping
opt.showbreak = "↪"
opt.autoindent = true -- automatically set indent of new line
opt.ttyfast = true -- faster redrawing

opt.laststatus = 2 -- show the status line all the time
opt.scrolloff = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
opt.hidden = true -- current buffer can be put into background
opt.showcmd = true -- show incomplete commands
opt.showmode = true -- don't show which mode disabled for PowerLine
opt.wildmode = {"list", "longest"} -- complete files like a shell
opt.shell = env.SHELL
opt.cmdheight = 1 -- command bar height
opt.title = true -- set terminal title
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.updatetime = 300
opt.signcolumn = "yes"
opt.shortmess = "atToOFc" -- prompt message options

-- Tab control
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 4 -- the visible width of tabs
opt.softtabstop = 4 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 4 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

-- code folding settings
cmd [[set foldmethod=expr]] -- use treesitter folding support
cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
opt.foldlevelstart = 99
opt.foldnestmax = 10 -- deepest fold is 10 levels
opt.foldenable = false -- don't fold by default
opt.foldlevel = 1

-- toggle invisible characters
opt.list = false
opt.listchars = {
  tab = "→ ",
  eol = "↲",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}

opt.autoread = true
opt.cursorline = true
opt.autowrite = true

-- Mappings
g.mapleader = ","
opt.pastetoggle = "<leader>v"

-- CUSTOM key bindings
nmap("<leader>c", ":windo diffthis<cr>")
nmap("<leader>C", ":windo diffoff<cr>")
nmap("<leader>d", ":bd!<cr>")
nmap("<leader>e", ":enew<cr>")
nmap("<leader>h", ":nohl<cr>")
nmap("<leader>l", ":set list!<cr>")

nmap("cr",":let @*=expand('%')<cr>")
nmap("-", ":new<cr>")
nmap("|", ":vnew<cr>")

-- Navigation in insert mode (emacs bindings)
local opt_j = "∆"
local opt_k = "˚"
local opt_f = "ƒ"
local opt_b = "∫"
local opt_d = "∂"
inoremap(opt_j, "<Down>")
inoremap(opt_k, "<Up>")
inoremap(opt_f, "<C-Right>")
inoremap(opt_b, "<C-Left>")
inoremap(opt_d, "<Esc>dwi")
inoremap("<c-a>", "<Home>")
inoremap("<c-e>", "<End>")
inoremap("<c-b>", "<Left>")
inoremap("<c-f>", "<Right>")
inoremap("<c-w>", "<Esc>dbi")

-- Zoom into pane
nmap("<leader>z", "<Plug>Zoom")

-- Souround settings
-- ,# Surround a word with #{ruby interpolation}
nmap("<leader>#", "ysiw#")
vmap("<leader>#", 'c#{<C-R>"}<ESC>')

-- ," Double quotes
nmap('<leader>"', 'ysiw"')
vmap('<leader>"', 'c"<C-R>""<ESC>')

-- ,' Single quotes
nmap("<leader>'", "ysiw'")
vmap("<leader>'", "c'<C-R>\"'<ESC>")

-- ,` Back ticks
nmap('<leader>`', 'ysiw`')
vmap('<leader>`', 'c`<C-R>"`<ESC>')

-- ,) or ,( Surround a word with (parens)
-- The difference is in whether a space is put in
nmap('<leader>(','ysiw(')
nmap('<leader>)','ysiw)')
vmap('<leader>(','c( <C-R>" )<ESC>')
vmap('<leader>)','c(<C-R>")<ESC>')

-- ,] or ,[ Surround a word with [brackets]
-- The difference is in whether a space is put in
nmap('<leader>[','ysiw[')
nmap('<leader>]','ysiw]')
vmap('<leader>[','c[ <C-R>" ]<ESC>')
vmap('<leader>]','c[<C-R>"]<ESC>')

-- ,} or ,{ Surround a word with {brackets}
-- The difference is in whether a space is put in
nmap('<leader>{','ysiw{')
nmap('<leader>}','ysiw}')
vmap('<leader>{','c{ <C-R>" }<ESC>')
vmap('<leader>}','c{<C-R>"}<ESC>')


-- Nerd Tree
nmap('<leader>t', ": NvimTreeToggle<cr>")
nmap('<leader>T', ": NvimTreeFindFile<cr>")

-- Telescope
-- Using Lua functions
nnoremap("<leader>ff","<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fl","<cmd>lua require('telescope.builtin').file_browser()<cr>")
nnoremap("<leader>fr","<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nnoremap("<leader>fk","<cmd>lua require('telescope.builtin').keymaps()<cr>")
nnoremap("<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>fg","<cmd>lua require('telescope.builtin').git_files()<cr>")
nnoremap("<leader>fgb","<cmd>lua require('telescope.builtin').git_bcommits()<cr>")
nnoremap("<leader>fgc","<cmd>lua require('telescope.builtin').git_commits()<cr>")
nnoremap("<leader>fgs","<cmd>lua require('telescope.builtin').git_status()<cr>")
nnoremap("<leader>fa","<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- Git 
g["fugitive_github_domains"] = {"https://gecgithub01.walmart.com"}
g["github_enterprise_urls"] = {"https://gecgithub01.walmart.com"}
nnoremap("<leader>gl", ":Git log -10 -- %<cr>")
nnoremap("<leader>gs", ":Git<cr>")
nnoremap("<leader>gb", ":Git blame<cr>")
nnoremap("<leader>gB", ":GV<cr>")
nnoremap("<leader>gd", ":Gvdiffsplit<cr>")

-- Trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

-- Toggle Term
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
