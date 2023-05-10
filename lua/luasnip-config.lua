local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

vim.keymap.set({"i", "s"}, "<C-n>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)
vim.keymap.set({"i", "s"}, "<C-p>", function()
    if ls.choice_active() then ls.change_choice(-1) end
end)
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
    }), s("cyes", {t('cout << (yes ? "Yes" : "No") << endl;')}),
    s("m9982", {t('using mint = modint998244353;')}),
    s("m1007", {t('using mint = modint1000000007;')}), s("verr2", {
        t("rep(mi, "), i(1, "ans"), t(".size()) rep(mj, "),
        d(2, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi].size()) cerr << "),
        d(3, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi][mj] << (mi + 1 == "),
        d(4, function(args) return sn(nil, {i(1, args[1])}) end, {1}),
        t("[mi].size() ? \"\\n\" : \" \");")
    }), s("in", {
        c(1, {t("int "), t("i64 "), t("char "), t("string ")}), i(2, "s"),
        t("; cin >> "),
        d(3, function(args) return sn(nil, {i(1, args[1])}) end, {2}), t(";")
    }), s("in2", {
        c(1, {t("int "), t("i64 "), t("char "), t("string ")}), i(2, "n"),
        t(", "), i(3, "m"), t("; cin >> "),
        d(4, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(" >> "),
        d(5, function(args) return sn(nil, {i(1, args[1])}) end, {3}), t(";")
    }), s("in3", {
        c(1, {t("int "), t("i64 "), t("char "), t("string ")}), i(2, "h"),
        t(", "), i(3, "w"), t(", "), i(4, "k"), t("; cin >> "),
        d(5, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(" >> "),
        d(6, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t(" >> "),
        d(7, function(args) return sn(nil, {i(1, args[1])}) end, {4}), t(";")
    }), s("in4", {
        c(1, {t("int "), t("i64 "), t("char "), t("string ")}), i(2, "a"),
        t(", "), i(3, "b"), t(", "), i(4, "c"), t(", "), i(5, "d"),
        t("; cin >> "),
        d(6, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(" >> "),
        d(7, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t(" >> "),
        d(8, function(args) return sn(nil, {i(1, args[1])}) end, {4}),
        t(" >> "),
        d(9, function(args) return sn(nil, {i(1, args[1])}) end, {5}), t(";")
    }), s("in5", {
        c(1, {t("int "), t("i64 "), t("char "), t("string ")}), i(2, "a"),
        t(", "), i(3, "b"), t(", "), i(4, "c"), t(", "), i(5, "d"), t(", "),
        i(6, "e"), t("; cin >> "),
        d(7, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(" >> "),
        d(8, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t(" >> "),
        d(9, function(args) return sn(nil, {i(1, args[1])}) end, {4}),
        t(" >> "),
        d(10, function(args) return sn(nil, {i(1, args[1])}) end, {5}),
        t(" >> "),
        d(11, function(args) return sn(nil, {i(1, args[1])}) end, {6}), t(";")
    }), s("inv", {
        t("vector<"), c(1, {t("int"), t("i64"), t("char"), t("string")}),
        t("> "), i(2, "a"), t("("), i(3, "n"), t("); rep(i, "),
        d(4, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t(") cin >> "),
        d(5, function(args) return sn(nil, {i(1, args[1])}) end, {2}), t("[i];")
    }), s("inv2,", {
        t("vector<"), c(1, {t("int"), t("i64"), t("char"), t("string")}),
        t("> "), i(2, "x"), t("("),
        d(5, function(args) return sn(nil, {i(1, args[1])}) end, {4}), t("), "),
        i(3, "y"), t("("), i(4, "m"), t("); rep(i, "),
        d(6, function(args) return sn(nil, {i(1, args[1])}) end, {4}),
        t(") { cin >> "),
        d(7, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t("[i] >> "),
        d(8, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t("[i]; }")
    }), s("inv3,", {
        t("vector<"), c(1, {t("int"), t("i64"), t("char"), t("string")}),
        t("> "), i(2, "u"), t("("),
        d(6, function(args) return sn(nil, {i(1, args[1])}) end, {5}), t("), "),
        i(3, "v"), t("("),
        d(7, function(args) return sn(nil, {i(1, args[1])}) end, {5}), t("), "),
        i(4, "w"), t("("), i(5, "m"), t("); rep(i, "),
        d(8, function(args) return sn(nil, {i(1, args[1])}) end, {5}),
        t(") { cin >> "),
        d(9, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t("[i] >> "),
        d(10, function(args) return sn(nil, {i(1, args[1])}) end, {3}),
        t("[i] >> "),
        d(11, function(args) return sn(nil, {i(1, args[1])}) end, {4}),
        t("[i]; }")
    }), s("indd", {
        t("vector<int> ind("), i(1, "n"),
        t("); iota(ind.begin(), ind.end(), 0);")
    }), s("nextp", {
        isn(1, t({"do {", "} while (next_permutation("}), "$PARENT_INDENT"),
        i(2, "a"), t(".begin(), "),
        d(3, function(args) return sn(nil, {i(1, args[1])}) end, {2}),
        t(".end());")
    })
})

require("luasnip.loaders.from_snipmate").load({
    path = {" ~/.config/nvim/snippets "}
})
