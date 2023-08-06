local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
	"rust_analyzer",
	"gopls"
})

lsp.on_attach(function(client, bufnr)
	local buf_map = vim.api.nvim_buf_set_keymap
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspOrganize lua lsp_organize_imports()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagShow lua vim.diagnostic.show()")
	vim.cmd(
	"command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
	buf_map(bufnr, "n", "gr", ":LspRefs<CR>", {silent = true})
	buf_map(bufnr, "n", "gR", ":LspRename<CR>", {silent = true})
	buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
	buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
	buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
	buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
	buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
	buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
	buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
	buf_map(bufnr, "n", "<Leader>aa", ":LspDiagShow<CR>", {silent = true})
	buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})
	if client.server_capabilities.document_formatting then
		buf_map(bufnr, "n", "<Leader>fd", ":LspFormatting<CR>", {silent = true})
	end

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		['<C-j>'] = cmp.mapping.scroll_docs(-4),
		['<C-k>'] = cmp.mapping.scroll_docs(4),
	}
})
