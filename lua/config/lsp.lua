-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--
--  yamlls disabled since its not playing nice with helm charts
local servers = { 'clangd', 'angularls', 'tsserver', 'dockerls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require 'lspconfig'.pylsp.setup {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}

-- Helm Yaml
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { 'helm' },
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

require('lspconfig').helm_ls.setup {
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
}

require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      format = {
        enable = true
      }
    }
  }
}

-- golang
require('lspconfig').gopls.setup {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    -- https://go.googlesource.com/vscode-go/+/HEAD/docs/settings.md#settings-for
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true
      },
      experimentalPostfixCompletions = true,
      gofumpt = true,
      -- staticcheck = true,
      --
      -- DISABLED because gopls doesn't invoke the staticcheck binary.
      -- Instead it imports the analyzers directly and this means it can report on issues the binary doesn't.
      -- But rather than that being a good thing, it can be annoying because you can't then use line directives to ignore the issue if it's not important.
      -- So instead I use null-ls to invoke the staticcheck binary.
      -- https://github.com/golang/go/issues/36373#issuecomment-570643870
      --
      -- See also my longer explanation of issues here:
      -- https://github.com/golangci/golangci-lint/issues/741#issuecomment-1488116634
      usePlaceholders = true,
      -- hints = {
      --   assignVariableTypes = true,
      --   compositeLiteralFields = true,
      --   compositeLiteralTypes = true,
      --   constantValues = true,
      --   functionTypeParameters = true,
      --   parameterNames = true,
      --   rangeVariableTypes = true
      -- }
    }
  }
}

-- Install Jedi for pylsp
require 'lspconfig'.pylsp.setup {
  cmd_env = { VIRTUAL_ENV = "./venv" },
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        },
        black = {
          enabled = true
        },
        ruff = {
          enabled = false
        }
      }
    }
  }
}

-- Lua
require 'lspconfig'.lua_ls.setup {
  on_attach = function()
    on_attach()
    vim.cmd [[autocmd BufWritePre <buffer> lua require'stylua-nvim'.format_file()]]
  end,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
}


-- Java
require 'lspconfig'.jdtls.setup {
  cmd = { "jdtls" },
  init_options = {
    workspace = "/Users/nikhilr/.cache/jdtls/workspace"
  },
  root_dir = function(fname)
    return require 'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
  end,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/"
          },
          {
            name = "JavaSE-19",
            path = "/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/"
          },
        }
      }
    }
  },
  flags = {
    debounce_text_changes = 150,
  },
}

-- Groovy
require 'lspconfig'.groovyls.setup {
  -- Unix
  cmd = { "java", "-jar", "/Users/nikhilr/.plugins/groovy-language-server/build/libs/groovy-language-server-all.jar" },
}

-- HTML, CSS, JSON
local webservers = { 'jsonls', 'cssls', 'html' }
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
for _, lsp in pairs(webservers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require 'lspconfig'.terraformls.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { "terraform" }
}

require 'lspconfig'.tflint.setup {}

require'lspconfig'.bashls.setup{}
