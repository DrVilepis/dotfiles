vim.loader.enable()

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

-- pick your plugin manager
local pack = "lazy"

local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    path = vim.fn.stdpath("data") .. "/lazy/" .. name
    vim.opt.rtp:prepend(path)

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}
        if ref then
            vim.fn.system {"git", "-C", path, "checkout", ref}
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

-- for git head
bootstrap("https://github.com/udayvir-singh/tangerine.nvim")
bootstrap("https://github.com/lewis6991/impatient.nvim")

local nvim_dir = vim.fn.stdpath [[config]]

require("impatient")

require("tangerine").setup({
    vimrc = nvim_dir .. "/fnl/init.fnl",
    source = nvim_dir .. "/fnl",
    compiler = {
        verbose = false,
        hooks = {"onsave"}
    },
})
