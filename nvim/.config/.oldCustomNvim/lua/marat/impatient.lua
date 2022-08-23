local ok, impatient = pcall(require, "impatient")
if not ok then
	vim.notify("impatient not installed")
	return
end

impatient.enable_profile()

