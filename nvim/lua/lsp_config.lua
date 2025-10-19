-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "rust", "java", "toml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  -- ignore_install = { "html", "xml"},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  ident = {
    enable = true,
  },

  -- autotag = {
  --   enable = true,
  --   -- enable_rename = true,
  --   -- enable_close = true,
  --   -- enable_close_on_slash = true,
  --   -- filetypes = { "xml", "html" },
  -- }
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "cvt", ":GoCoverage<CR>", { buffer = true })
  end,
})

require('mason').setup()
require('mason-lspconfig').setup {
  automatic_enable = false,
  ensure_installed = { "lua_ls", "omnisharp", "taplo", "vhdl_ls", "yamlls", "gopls", "html", "cssls", "golangci_lint_ls", "pyright" }
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'ts_ls', 'jdtls', 'lua_ls', 'docker_compose_language_service',
  'omnisharp', 'vhdl_ls', 'angularls', 'yamlls', 'taplo', 'buf_ls', 'digestif', 'gopls', 'intelephense', 'sqlls',
  'html', 'cssls', 'golangci_lint_ls'
}

local is_first_delete = true

local function on_attach(client, buffer)
  -- Example usage
  if is_first_delete then
    vim.keymap.del('n', '.', { buffer = nil })
    is_first_delete = false
  end

  if client.name == "rust-analyzer" then
    -- override lsp semantic tokens by treesitter
    client.server_capabilities.semanticTokensProvider = nil
  end
  -- client.server_capabilities.semanticTokensProvider = nil
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
end

for _, lsp in ipairs(servers) do
  if lsp == 'omnisharp' then
    local config = {
      handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
      },
    }
    vim.lsp.config(lsp, config)
    vim.lsp.enable({lsp})
  elseif lsp == 'yamlls' then
    vim.lsp.config(lsp, {
      filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'json' },
      settings = {
        yaml = {
          validate = true,
          schemas = {
            kubernetes = "*.yaml",
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
            ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
            ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
            ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
            ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
            ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
            ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            ["https://golangci-lint.run/jsonschema/golangci.jsonschema.json"] = "*.golangci.{yml,yaml}",
          }
        }
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable({lsp})
  elseif lsp == 'clangd' then
    vim.lsp.config(lsp, {
      cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable({lsp})
  else
    vim.lsp.config(lsp, {
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable({lsp})
  end
end

local opts         = {
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = true,
        cargo = {
          buildScripts = {
            enable = true,
          },
          unsetTest = true,
        },
        workspace = {
          symbol = {
            search = {
              limit = 512
            }
          }
        },
        lru = {
          capacity = 512
        },

        procMacro = {
          enable = true,
          ignored = {
            tokio = { "select" },
            o2o   = { "o2o" }
          }
        },

        diagnostics = {
          experimental = {
            enable = true
          },

          disabled = { "unresolved-proc-macro" },
        },
      },
    },
  },
}

vim.g.rustaceanvim = opts;

-- luasnip setup
local luasnip      = require 'luasnip'
-- nvim-cmp setup
local cmp          = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
    --[[
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    { 'i', 's' }),
    --]]
    --[[
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    --]]
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'crates' },
  },
}

-- local null_ls = require("null-ls")
-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"
-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.keymap.set("n", "<Leader>f", function()
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       end, { buffer = bufnr, desc = "[lsp] format" })
--
--       -- format on save
--       vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
--       vim.api.nvim_create_autocmd(event, {
--         buffer = bufnr,
--         group = group,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr, async = async })
--         end,
--         desc = "[lsp] format on save",
--       })
--     end
--
--     if client.supports_method("textDocument/rangeFormatting") then
--       vim.keymap.set("x", "<Leader>f", function()
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--       end, { buffer = bufnr, desc = "[lsp] format" })
--     end
--   end,
-- })
