local opts = {
	log_level = 'info',
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = nil,
	auto_restore_enabled = false,
}

require('auto-session').setup(opts)

