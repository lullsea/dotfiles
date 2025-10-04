return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function latest_file_commit()
			local file = vim.api.nvim_buf_get_name(0)
			if file == "" then
				return ""
			end
			local commit = ""
			local cmd = string.format("git log -1 --pretty=%%s -- %q 2>/dev/null", file)
			local handle = io.popen(cmd)
			if handle then
				commit = handle:read("*a") or ""
				handle:close()
				commit = commit:gsub("\n", "")
			end
			return file .. (commit ~= "" and (" - " .. commit) or "")
		end

		require("lualine").setup({
			sections = {
				lualine_c = { latest_file_commit },
			},
		})
	end,
}
