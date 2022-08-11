local hop_status_ok, hop = pcall(require, "hop")
if not hop_status_ok then
  return
end

hop.setup({
	keys = 'etovxqpdygfblzhckisuran',
	quit_key = '<ESC>',
	jump_on_sole_occurrence = true,
	case_insensitive = true,
	multi_windows = true,
})
