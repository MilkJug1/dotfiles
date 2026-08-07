
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "cpp",
    "c",
    "python",
    "zig",
    "rust",
    "markdown",
    "hyprlang",
}

local treesitter = require("nvim-treesitter")
treesitter.setup({})


-- require("nvim-treesitter.configs").setup {
-- 	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'python', 'rust', 'markdown', 'hyprlang' },
-- 	auto_install = true,
--
-- 	highlight = { enable = true },
--
-- 	indent = { enable = true },
-- }

local config = require("nvim-treesitter.config")

local already_installed = config.get_installed()
local parsers_to_install = {}

for _, parser in ipairs(ensure_installed) do 
    if not vim.tbl_contains(already_installed, parser) then 
        table.insert(parsers_to_install, parser)
    end
end

if #parsers_to_install > 0 then 
    treesitter.install(parsers_to_install)
end

local group = vim.api.nvim_create_augroup("TreeSitterConfig", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    group=group,
    callback = function (args)
        if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
            vim.treesitter.start(args.buf)
        end
    end,
})



-- BUG: MAKE SURE TO FIND TIME TO CHANGE TREESITER, REPO HAS BEEN ARCHIVED BECAUSE OF AN UNGRATEFUL PERSON TO A VERY GOOD MAINTAINER
--

