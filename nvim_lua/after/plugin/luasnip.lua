local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

vim.opt.completeopt = "menu,menuone,noselect"
