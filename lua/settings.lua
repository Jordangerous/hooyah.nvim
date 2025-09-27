-- lua/overrides.lua
local opt = vim.opt

-- Only put values that differ from config/options.lua
opt.colorcolumn = '100'
opt.scrolloff = 8

-- Per-host tweaks
if vim.loop.os_uname().sysname == 'Darwin' then
  opt.guifont = 'JetBrainsMono Nerd Font:h14'
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
