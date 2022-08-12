local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
	return
end

sniprun.setup({
	-- selected_interpreters = { "Python3_jupyter" },
    repl_enable = {'Python3_original'},
	display = {
		"VirtualTextOk",
		"VirtualTextErr",
		-- "LongTempFloatingWindow",
		"TerminalWithCode"
	},
})
