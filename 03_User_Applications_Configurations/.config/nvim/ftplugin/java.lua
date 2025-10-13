local jdtls_bin = vim.fn.stdpath 'data' .. '/mason/bin/jdtls'

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

local lsp_attach = function(client, bufnr)
  require('jdtls.dap').setup_dap_main_class_configs() -- Discover main classes for debugging

  opts.buffer = bufnr
end

local config = {
  cmd = { jdtls_bin },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', '.mvn' }, { upward = true })[1]),
  on_attach = lsp_attach,
  init_options = {
    bundles = {
      vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1),
    },
  },
}
require('jdtls').start_or_attach(config)
