require("globals")

vim.pack.add({ gh("saecki/crates.nvim"), gh("rust-lang/rust.vim") })

local crates = require("crates")
crates.setup()
crates.show()

vim.g.rustfmt_autosave = 1
