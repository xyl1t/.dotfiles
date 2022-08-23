local ok, hop = pcall(require, "hop")
if not ok then
	vim.notify("hop not installed")
	return
end

hop.setup {
	keys = "etovxqpdygfblzhckisuran"
}
