return
{
	"ThePrimeagen/harpoon",
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
		event="VeryLazy",
	config =
			function()
				vim.keymap.set("n", "<TAB>m", require("harpoon.mark").add_file)
				vim.keymap.set("n", "<TAB><TAB>", require("harpoon.ui").toggle_quick_menu)
				vim.keymap.set("n", "<TAB>1", function() require("harpoon.ui").nav_file(1) end)
				vim.keymap.set("n", "<TAB>2", function() require("harpoon.ui").nav_file(2) end)
				vim.keymap.set("n", "<TAB>4", function() require("harpoon.ui").nav_file(4) end)
				vim.keymap.set("n", "<TAB>3", function() require("harpoon.ui").nav_file(3) end)
				vim.keymap.set("n", "<TAB>]", require("harpoon.ui").nav_next)
				vim.keymap.set("n", "<TAB>[", require("harpoon.ui").nav_prev)
			end
}
