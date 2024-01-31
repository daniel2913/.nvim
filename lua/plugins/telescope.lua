return
{
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
		event="VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim',
	'rmagatti/session-lens',
	"debugloop/telescope-undo.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
				--[[ {
						'danielvolchek/tailiscope.nvim',
						
				}, ]]
				
    },
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                    },
                },
            },
						pickers={
							buffers = {
								mappings={
                  i={
										['<C-d>'] = require("telescope.actions").delete_buffer,
										},
									n={
										['<C-d>'] = require("telescope.actions").delete_buffer,
									}
									},
							},
						},
						extensions = {
							fzf = {
								fuzzy=true,
								override_generic_sorter = true,
								override_file_sorter = true,     -- override the file sorter
      					case_mode = "smart_case",
							},
							--tailiscope = {},
						}
        }
        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`

        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
        --pcall(require('telescope').load_extension, 'tailiscope')
        pcall(require('telescope').load_extension, 'session-lens')
        pcall(require('telescope').load_extension, 'undo')
        pcall(require('telescope').load_extension, 'yank_history')
				
        -- See `:help telescope.builtin`
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
            { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

      	vim.keymap.set('n', '<leader>ss', require('session-lens').search_session, { desc = "[S]earch [S]essions" })
      	vim.keymap.set('n', '<leader>su', require('telescope').extensions.undo.undo, { desc = "[S]earch [U]ndo's" })
        vim.keymap.set('n', '<leader>sp', require('telescope').extensions.yank_history.yank_history, { desc = '[S]earch Yanky [P]uts' })
        vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
        vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands,{desc = "[S]earch [C]ommands"})
        vim.keymap.set('v', '<leader>sc', require('telescope.builtin').commands,{desc = "[S]earch [C]ommands"})
    end
}
