return {
	{
		"saghen/blink.cmp",
		opts = function(_, opts)
			opts.keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Cr>"] = { "accept", "fallback" },
			}
		end,
	},
}
