return {

    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.files").setup()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.move").setup()
            require("mini.pairs").setup()
            -- require("mini.tabline").setup()
            require("mini.bracketed").setup()
            require"mini.surround".setup()
            require("mini.map").setup()
            -- require("mini.jump2d").setup()
        end
    },
}
