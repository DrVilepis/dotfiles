local function bootstrap(url)
    local name = url:gsub(".*/", "")
    local path = vim.fn.stdpath("data") .. "/lazy/" .. name
    if vim.fn.isdirectory(path) == 0 and not vim.loop.fs_stat(path) then
        vim.fn.system({"git", "clone", url, path})
    end
    vim.opt.rtp:prepend(path)
end

bootstrap("https://github.com/folke/lazy.nvim.git")
bootstrap("https://git.sr.ht/~technomancy/fennel")
bootstrap("https://github.com/aileot/nvim-thyme")

table.insert(package.loaders, function(...)
    return require("thyme").loader(...)
end)

local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
vim.opt.rtp:prepend(thyme_cache_prefix)
vim.loader.enable()

require("thyme").setup()
require("config")
