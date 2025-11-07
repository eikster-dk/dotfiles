return {
  -- Ensure LSP servers are installed
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "svelte",
        "vtsls",
        "marksman",
      },
    },
  },

  -- Ensure other tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "json-lsp",
        "prettier",
        "tailwindcss-language-server",
      },
    },
  },
}
