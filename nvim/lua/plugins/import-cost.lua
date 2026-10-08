return {
	{
		"import-cost.nvim",
		url = "https://git.barrettruth.com/barrettruth/import-cost.nvim",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
		init = function()
			vim.g.import_cost = {
				package_manager = "npm", -- npm, yarn, or bun (pnpm unsupported)
				highlight = "Comment",
			}
		end,
	},
}
