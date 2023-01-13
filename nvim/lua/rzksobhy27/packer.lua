local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("mbbill/undotree")
    use("numToStr/Comment.nvim")
    use("mg979/vim-visual-multi")
    use("tpope/vim-fugitive")
    use("b0o/SchemaStore.nvim")
    use("gruvbox-community/gruvbox")
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("j-hui/fidget.nvim")
    use("lvimuser/lsp-inlayhints.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use({
        { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
        "nvim-treesitter/nvim-treesitter-textobjects",
    })
    use({
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        "nvim-telescope/telescope-live-grep-args.nvim",
    })
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    })
    use({
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    })
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    use({
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
    })
end)
