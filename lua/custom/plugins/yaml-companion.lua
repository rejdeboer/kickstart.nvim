return {
  'someone-stole-my-name/yaml-companion.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('telescope').load_extension 'yaml_schema'

    vim.lsp.config('yamlls', (require('yaml-companion').setup {
      builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = true },
      },

      schemas = {
        {
          name = 'Azure Pipeline',
          uri = 'https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json',
        },
        {
          name = 'GitHub Workflow',
          uri = 'https://json.schemastore.org/github-workflow.json',
        },
        {
          name = 'Kubernetes 1.29.0',
          uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/all.json',
        },
        {
          name = 'Kustomize',
          uri = 'http://json.schemastore.org/kustomization',
        },
      },
      schemaDownload = { enable = true },

      lspconfig = {
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            validate = true,
            format = { enable = false },
            schemaStore = {
              enable = false,
              url = '',
            },
            schemaDownload = { enable = true },
            schemas = {
              kubernetes = 'kubernetes/*.{yml,yaml}',
              ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
              ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
              ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
              ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
              ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
              ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*oas*.{yml,yaml}',
              ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
              ['https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json'] = 'git/*.{yml,yaml}',
            },
          },
        },
      },
    }))
  end,
}
