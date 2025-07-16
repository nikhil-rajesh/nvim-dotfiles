-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--
--  yamlls disabled since its not playing nice with helm charts
local servers = { 'clangd', 'angularls', 'ts_ls', 'dockerls', 'helm_ls', 'yamlls', 'golangci_lint_ls', 'gopls', 'tflint', 'bashls' }
for _, lsp in pairs(servers) do
  vim.lsp.enable(lsp)
end

vim.lsp.enable('pylsp')
vim.lsp.config('pylsp', {
  cmd_env = { VIRTUAL_ENV = "./venv" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
        black = {
          enabled = true
        },
        ruff = {
          enabled = false
        }
      }
    }
  }
})

-- Lua
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})


-- Java
vim.lsp.enable('jdtls')
vim.lsp.config('jdtls', {
  cmd = { 'jdtls' }
  init_options = {
    workspace = "/Users/nikhilr/.cache/jdtls/workspace"
  },
  root_markers = { ".git", "build.gradle", "build.gradle.kts", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" }
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/opt/homebrew/Cellar/openjdk@21/21.0.7/libexec/openjdk.jdk/Contents/Home"
          },
          {
            name = "JavaSE-24",
            path = "/opt/homebrew/Cellar/openjdk/24.0.1/libexec/openjdk.jdk/Contents/Home"
          },
        }
      }
    }
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- Groovy
vim.lsp.enable('groovyls')
vim.lsp.config('groovyls', {
  -- Unix
  cmd = { "java", "-jar", "/Users/nikhilr/.plugins/groovy-language-server/build/libs/groovy-language-server-all.jar" },
})

-- HTML, CSS, JSON
local webservers = { 'jsonls', 'cssls', 'html' }
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
for _, lsp in pairs(webservers) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {
    capabilities = capabilities,
  })
end

vim.lsp.enable('terraformls')
vim.lsp.config('terraformls', {
  filetypes = { "terraform", "hcl", "terraform-vars" }
})
