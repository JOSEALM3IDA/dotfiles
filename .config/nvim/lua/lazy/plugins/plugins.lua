return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Automatically install or update parsers
    event = { "BufReadPost", "BufNewFile" } -- Lazy-load Tree-sitter
  },
  {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
	    "nvim-telescope/telescope-file-browser.nvim",
	    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
 	  }
  },
  "theprimeagen/harpoon",
  "mbbill/undotree",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mfussenegger/nvim-jdtls",
  "jiangmiao/auto-pairs",
  "sheerun/vim-polyglot",
  "chriskempson/vim-tomorrow-theme"
}
