return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup {
			flavour = "macchiato",
			integrations = {
				telescope = true,
				indent_blankline = true,
				harpoon = true,
				cmp = true,
			}
		}
	end,
}
