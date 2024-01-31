local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', 
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'BurntSushi/ripgrep',
	require('plugins.treesitter'),
	require('plugins.telescope'),
  "nvimtools/none-ls.nvim",
	require('plugins.lspconfig'),
	{ 'folke/which-key.nvim',  opts = {} },

	{
		'folke/tokyonight.nvim',
		priority = 1000,
		opts={},
		config = function()
			vim.cmd.colorscheme 'tokyonight-storm'
		end,
	},
	'tpope/vim-dadbod',
	require("plugins.dap-ui"),
	require("plugins.dap-js"),
	require('plugins.dap'),
	{ 'numToStr/Comment.nvim', opts = {} },
	require("plugins.rest"),
	require('plugins.cmp'),
	require('plugins.gitsigns'),
	require('plugins.lualine'),
	require('plugins.indentblank'),
	require('plugins.harpoon'),
--[[ 	require('plugins.ufo'), ]]
	require("plugins.db-ui"),
  require("plugins.yanky"),
	require("plugins.autopairs"),
	'ryanoasis/vim-devicons',
	{
	'rmagatti/auto-session',
		config = function() require("auto-session").setup({}) end
	},
	"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	"monaqa/dial.nvim"
})
