return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
        history = true,
        delete_check_events = "TextChanged",
        region_check_events = "CursorMoved",
    },
    config = {
        require("luasnip").config.setup({
            history = true,
            delete_check_events = "TextChanged",
            region_check_events = "CursorMoved",
        }),
        require("luasnip.loaders.from_snipmate").load({paths = "~/common/scripts/vim"})
    },
}

