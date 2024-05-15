return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-highlight-colors").setup({
			---Highlight tailwind colors, e.g. 'bg-blue-500'
			enable_tailwind = true,
		})
	end,
}
