return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "raihanmd",
				path = "/Users/raihanprod/Public/second-brain/raihanmd",
			},
		},

		-- see below for full list of options 👇
		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			local now = os.date("%Y-%m-%d") -- Get current date in YYYY-MM-DD format
			local suffix = ""
			if title ~= nil then
				-- Transform title to a valid filename
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- Add 4 random uppercase letters if no title
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return now .. "-" .. suffix
		end,
	},
}
