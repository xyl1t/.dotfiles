local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	vim.notify("neorg not installed")
	return
end

neorg.setup {
	load = {
		["core.defaults"] = {}
	}
}
