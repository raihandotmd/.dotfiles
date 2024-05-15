return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
-- Color table for highlights
-- stylua: ignore
local colors = {
  bg_       = '#202328',
  fg       = '#828790',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  bg    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}
		local evil = {
			visual = {
				a = { fg = colors.cyan, bg = colors.accent, gui = "bold" },
				b = { fg = colors.accent, bg = colors.panel_border },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.markup, gui = "bold" },
				b = { fg = colors.markup, bg = colors.panel_border },
			},
			normal = {
				a = { fg = colors.bg, bg = colors.entity, gui = "bold" },
				b = { fg = colors.entity, bg = colors.panel_border },
				c = { fg = colors.fg, bg = colors.panel_border },
			},
			insert = {
				a = { fg = colors.orange, bg = colors.string, gui = "bold" },
				b = { fg = colors.string, bg = colors.panel_border },
			},
		}
		--
		-- configure lualine with modified theme
		lualine.setup({
			options = {
				component_separators = "|",
				section_separators = "|",
				theme = evil,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
			},
		})
	end,
}
