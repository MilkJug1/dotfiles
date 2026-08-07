
vim.pack.add({"https://github.com/saecki/crates.nvim", "https://github.com/rust-lang/rust.vim" })

local crates = require("crates")
crates.setup()
crates.show()

vim.g.rustfmt_autosave = 1
