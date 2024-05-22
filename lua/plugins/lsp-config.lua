return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "cssls", "html", "htmx", "jsonls", "tsserver", "yamlls", "dockerls", "eslint",
        "elixirls", "gopls", "graphql", "pylsp", "rust_analyzer"}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.cssls.setup({
        capabilities = capabilities
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities
      })

      lspconfig.eslint.setup({
        capabilities = capabilities
      })

      lspconfig.elixirls.setup({
        capabilities = capabilities
      })

      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      lspconfig.graphql.setup({
        capabilities = capabilities
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      lspconfig.htmx.setup({
        capabilities = capabilities
      })

    end,
  },
}
