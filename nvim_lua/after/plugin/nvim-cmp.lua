local cmp_status, cmp = pcall(require, "cmp")
  if not cmp_status then
    return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    { name = "path" },
    { name = "nvim_lsp" },
  })
})
