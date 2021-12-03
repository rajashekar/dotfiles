-- init.lua
-- Neovim-specific configuration

require("globals")
require("plugins.init")
require('lualine').setup{
	options = { theme = 'onedark' }
}
require("plugins.fzf")
require("plugins.gitsigns")
require("plugins.treesitter")

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
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
cmd [[com! FormatJSON %!python -m json.tool]]
cmd [[com! IndentJSON %!jq -r .]]

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

if fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  opt.grepprg = "rg --vimgrep --no-heading"
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

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
nmap("<leader>q", ":q<cr>")
-- spell check correction
nmap("<leader>s", "1z=")
nmap("cr",":let @*=expand('%')<cr>")
-- Split settings
nmap("-", ":new<cr>")
nmap("|", ":vnew<cr>")
-- quick fix
nmap("<space>q", ":copen<cr>")
nmap("<space>Q", ":cclose<cr>")
-- Search selected text in visual mode
vnoremap("//", 'y/<C-R>"<cr>')


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


-- UltiSnips Trigger configuration.
g["ycm_key_list_select_completion"] = {'<C-n>', '<Down>'}
g["ycm_key_list_previous_completion"] = {'<C-p>', '<Up>'}
g["UltiSnipsExpandTrigger"] = "<Tab>"
g["UltiSnipsJumpForwardTrigger"] = "<Tab>"
g["UltiSnipsJumpBackwardTrigger"] = "<S-Tab>"
g["UltiSnipsEditSplit"] = "vertical"
g["UltiSnipsSnippetDirectories"] = {'~/.config/nvim/UltiSnips', 'UltiSnips'}


-- Nvim Tree
nmap('<leader>t', ":NvimTreeToggle<cr>")
nmap('<leader>T', ":NvimTreeFindFile<cr>")
nmap('<leader>r', ":NvimTreeRefresh<cr>")


-- Telescope
-- Using Lua functions
nnoremap("fa","<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("fb","<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("fc","<cmd>lua require('telescope.builtin').git_commits()<cr>")
nnoremap("fd","<cmd>lua require('telescope.builtin').git_bcommits()<cr>")
nnoremap("fe","<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("ff","<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("fh","<cmd>lua require('telescope.builtin').help_tags()<cr>")
nnoremap("fg","<cmd>lua require('telescope.builtin').git_files()<cr>")
nnoremap("fj","<cmd>lua require('telescope.builtin').jumplist()<cr>")
nnoremap("fk","<cmd>lua require('telescope.builtin').keymaps()<cr>")
nnoremap("fl","<cmd>lua require('telescope.builtin').file_browser()<cr>")
nnoremap("fq","<cmd>lua require('telescope.builtin').quickfix()<cr>")
nnoremap("fm","<cmd>lua require('telescope.builtin').marks()<cr>")
nnoremap("fr","<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nnoremap("fs","<cmd>lua require('telescope.builtin').git_status()<cr>")
nnoremap("f/","<cmd>lua require('telescope.builtin').search_history()<cr>")
nnoremap("f:","<cmd>lua require('telescope.builtin').commands()<cr>")


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

-- GPG
g["GPGPreferArmor"] = 1
g["GPGDefaultRecipients"] = {"rajshekar.ch@gmail.com"}


-- Firenvim (browser integration)
vim.cmd 'let g:firenvim_config = { "globalSettings": { "alt": "all", }, "localSettings": { ".*": { "cmdline": "neovim", "content": "text", "priority": 0, "selector": "textarea", "takeover": "always", }, } }'
-- Disable `firenvim` for the particular webiste
vim.cmd 'let fc = g:firenvim_config["localSettings"]'
vim.cmd 'let fc["https?://twitter.com/"] = { "takeover": "never", "priority": 1 }'
-- Change `firenvim` file type to enable syntax highlight, `coc` works perfectly
-- " after this settings!!!
vim.cmd 'autocmd BufEnter github.com_*.txt set filetype=markdown'
vim.cmd 'autocmd BufEnter txti.es_*.txt set filetype=typescript'
-- Increase the font size to solve the `text too small` issue
function IsFirenvimActive(event)
    if vim.g.enable_vim_debug then print("IsFirenvimActive, event: ", vim.inspect(event)) end

    if vim.fn.exists('*nvim_get_chan_info') == 0 then return 0 end

    local ui = vim.api.nvim_get_chan_info(event.chan)
    if vim.g.enable_vim_debug then print("IsFirenvimActive, ui: ", vim.inspect(ui)) end
    local is_firenvim_active_in_browser = (ui['client'] ~= nil and ui['client']['name'] ~= nil)
    if vim.g.enable_vim_debug then print("is_firenvim_active_in_browser: ", is_firenvim_active_in_browser) end
    return is_firenvim_active_in_browser
end
function OnUIEnter(event)
    if IsFirenvimActive(event) then
        -- Disable the status bar
        vim.cmd 'set laststatus=0'

        -- Increase the font size
        vim.cmd 'set guifont=MesloLGSDZ\\ Nerd\\ Font:h20'
    end
end
vim.cmd([[autocmd UIEnter * :call luaeval('OnUIEnter(vim.fn.deepcopy(vim.v.event))')]])


-- lsp config
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- nvim cmp - code completion
local cmp = require('cmp')
local lspkind = require('lspkind')
  cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
	formatting = {
		format = lspkind.cmp_format({with_text = false, maxwidth = 50})
	}
  })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Which key
nnoremap("<leader>",":WhichKey ','<cr>")
nnoremap("<space>",":WhichKey '<Space>'<cr>")
-- nnoremap("]",":WhichKey ']'<cr>")
-- nnoremap("[",":WhichKey '['<cr>")
nnoremap("f",":WhichKey 'f'<cr>")

-- sneak
g["sneak#label"] = 1

-- luatab
vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'

-- packer
nnoremap("<leader>ps",":PackerSync <cr>")
nnoremap("<leader>pi",":PackerInstall <cr>")
nnoremap("<leader>pc",":PackerClean <cr>")

-- vimux
-- Prompt for a command to run
nnoremap("<leader>vp", ":VimuxPromptCommand<cr>")
-- Run last command executed by VimuxRunCommand
nnoremap("<leader>vl", ":VimuxRunLastCommand<cr>")


-- lspsaga
-- lsp provider to find the cursor word definition and reference
nnoremap("gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
-- code action
nnoremap("gca","<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
vnoremap("gca","<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
-- show hover doc
nnoremap("K","<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
-- show signature help
nnoremap("gs","<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
-- rename
nnoremap("gr","<cmd>lua require('lspsaga.rename').rename()<CR>")
-- preview definition
nnoremap("gD","<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")


-- lspkind

