local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local r = ls.restore_node
local f = ls.f
local c = ls.c
local d = ls.d
local types = require("luasnip.util.types")

vim.cmd [[imap <silent><expr> <C-f> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-f>']]
local function copy(args) return args[1] end

ls.add_snippets("all", {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    s("fn", {
        -- Simple static text.
        t("//Parameters: "),
        -- function, first parameter is the function, second the Placeholders
        -- whose text it gets as input.
        f(copy, 2), t({"", "function "}), -- Placeholder/Insert.
        i(1), t("("), -- Placeholder with initial text.
        i(2, "int foo"), -- Linebreak
        t({") {", "\t"}), -- Last Placeholder, exit Point of the snippet.
        i(0), t({"", "}"})
    }), s("verr2", {
        t("rep(mi, "), i(1, "ans"), t(".size()) rep(mj, "),
        d(2, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi].size()) cerr << "),
        d(3, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi][mj] << (mi + 1 == "),
        d(4, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi].size() ? \"\\n\" : \" \");")
    }), s("invi2", {
        t("vector "), i(1), t("("), i(2), t(", vector<int>("), i(3),
        t(")); rep(mi, "), d(4, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(") rep(mj, "), d(5, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t(") cin >> "), d(6, function(args) return sn(nil, {i(1, args[1])}) end, {1}), t("[mi][mj];")
    })
})

require("luasnip.loaders.from_snipmate").load({
    path = {" ~/.config/nvim/snippets "}
})
