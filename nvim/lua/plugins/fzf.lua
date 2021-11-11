local env = vim.env
local g = vim.g
local fn = vim.fn
local api = vim.api
local o = vim.o
local utils = require("utils")
local nmap = utils.nmap
local xmap = utils.xmap
local omap = utils.omap
local imap = utils.imap


-- search for a word
nmap("<space>a", ":Ag<cr>")
nmap("<space>A", ":Ag <C-r><C-w><cr>")

-- find lines in file
nmap("<space>b", ":BLines<cr>")
nmap("<space>l", ":Lines <C-r><C-w><cr>")

-- Find tags
nmap("<space>t", ":BTags<cr>")
nmap("<space>T", ":Tags <C-r><C-w><cr>")

-- Find files
nmap("<space>f", ":FZF<cr>")
nmap("<space>F", ":FZF <C-r><C-w><cr>")
nmap("<C-p>", ":<C-u>FZF<CR>")

-- History
nmap("<space>r", ":History<cr>")
-- get command history
nmap("<space>h", ":History:<cr>")

-- show current buffer commits
nmap("<space>c", ":BCommits<cr>")
-- Show git status
nmap("<space>s", ":GFiles?<cr>")
-- get all key mappings
nmap("<space>m", ":Maps<cr>")
-- get all key mappings
nmap("<space>M", ":Marks<cr>")
-- get all buffers
nmap("<space>b", ":Buffers<cr>")
-- get Windows
nmap("<space>w", ":Windows<cr>")

-- Insert mode completion
imap("<c-x><c-k>", "<plug>(fzf-complete-word)")
imap("<c-x><c-f>", "<plug>(fzf-complete-path)")
imap("<c-x><c-j>", "<plug>(fzf-complete-file-ag)")
imap("<c-x><c-l>", "<plug>(fzf-complete-line)")
