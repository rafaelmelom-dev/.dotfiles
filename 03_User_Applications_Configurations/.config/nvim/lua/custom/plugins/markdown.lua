return {
    {

        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            latex = {
                enabled = true,
                converter = 'utftex',
                render_modes = { 'n', 'c' },
                position = 'below',
                top_pad = 1,
                bottom_pad = 1,
            },
        },
    },
}
