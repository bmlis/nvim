local builtin = require('telescope.builtin')
local project = require('telescope').load_extension('project')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pp', project.project, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<C-s>', builtin.current_buffer_fuzzy_find, {})

require('telescope').setup {
	pickers = {
		find_files = {
			hidden = true
		},
		live_grep = {
			additional_args = function (opts)
				return {'--hidden', '-g', '!node_modules/**', '-g', '!vendor/**', '-g', '!.git/**'}
			end
		}
	},
	extensions = {
		project = {
			base_dirs = {
				'~/Workspace/',
			},
			hidden_files = true,
			sync_with_nvim_tree = true
		}
	}
}
