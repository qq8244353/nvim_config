require("luasnip.loaders.from_snipmate").lazy_load(
  {
    paths = { "./snippets" }
  }
)
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-F>", function() ls.expand_or_jump() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
