return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("harpoon").setup({})

		local function toggle_telescope_with_harpoon(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = require("telescope.config").values.file_previewer({}),
					sorter = require("telescope.config").values.generic_sorter({}),
				})
				:find()
		end
		vim.keymap.set("n", "<leader>hm", function()
			local harpoon = require("harpoon")
			toggle_telescope_with_harpoon(harpoon:list())
		end, { desc = "Open harpoon telescope window" })
	end,
	keys = {
		{
			"<leader>aa",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add harpoon file",
		},
		{
			"<leader>ac",
			function()
				require("harpoon"):list():clear()
			end,
			desc = "Clear harpoon file",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Open harpoon quick menu",
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "harpoon to file 1",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "harpoon to file 2",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "harpoon to file 3",
		},
		{
			"<C-s>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "harpoon to file 4",
		},
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Switch to prev harpoon",
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Switch to next harpoon",
		},
	},
}
