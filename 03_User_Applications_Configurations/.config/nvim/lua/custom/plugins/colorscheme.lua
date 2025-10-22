return {
    -- 'folke/tokyonight.nvim',
    -- priority = 1000,
    -- config = function()
    --     ---@diagnostic disable-next-line: missing-fields
    --     require('tokyonight').setup {
    --         styles = {
    --             comments = { italic = false },
    --             sidebars = 'transparent',
    --             floats = 'transparent',
    --         },
    --         transparent = true,
    --     }
    --
    --     vim.cmd.colorscheme 'tokyonight-night'
    -- end,

    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        require('gruvbox').setup {
            transparent_mode = true,
        }

        vim.cmd.colorscheme 'gruvbox'
    end,
}
