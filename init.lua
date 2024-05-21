vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Loads Neotree by default:
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree")
    end
  end,
})

require("options")
require("keymaps")
require("lazy").setup("plugins")
