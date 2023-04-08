require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "json", "yaml", "dockerfile", "lua", "vim", "rust", "javascript", "typescript", "terraform" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = false,
	},
}
