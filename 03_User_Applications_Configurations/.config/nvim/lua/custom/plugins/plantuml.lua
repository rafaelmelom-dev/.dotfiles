return {
    'javiorfo/nvim-soil',
    lazy = true,
    ft = 'plantuml',
    opts = {
        image = {
            execute_to_open = function(img)
                return 'loupe ' .. img
            end,
        },
    },
    dependencies = { 'javiorfo/nvim-nyctophilia' },
}
