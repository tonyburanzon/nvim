return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Auto-install missing parsers, enable highlighting and indentation
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if not lang then return end

                local installed = require("nvim-treesitter").get_installed()
                if not vim.list_contains(installed, lang) then
                    require("nvim-treesitter").install({ lang })
                end

                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.foldexpr()"
            end,
        })

        vim.treesitter.language.register("templ", "templ")
    end
}
