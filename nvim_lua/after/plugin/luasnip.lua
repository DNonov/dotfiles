local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- require("luasnip/loader/from_vscode").lazy_load()
vim.opt.completeopt = "menu,menuone,noselect"
