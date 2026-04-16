return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local function apply_theme()
      if vim.o.background == 'light' then
        vim.cmd.colorscheme 'github_light_default'
      else
        vim.cmd.colorscheme 'github_dark_default'
      end
    end

    vim.api.nvim_create_autocmd('OptionSet', {
      pattern = 'background',
      callback = apply_theme,
    })

    apply_theme()
  end,
}

-- return {
--     'ellisonleao/gruvbox.nvim',
--     priority = 1000,
--     config = function()
--         require('gruvbox').setup {
--             transparent_mode = true,
--         }
--
--         vim.cmd.colorscheme 'gruvbox'
--     end,
-- }
