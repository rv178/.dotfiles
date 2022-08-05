local function map(mode, combo, mapping, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- leader

vim.g.mapleader = " "

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap=true})

map('n', "<leader>1", "1gt", {noremap=true})
map('n', "<leader>2", "2gt", {noremap=true})
map('n', "<leader>3", "3gt", {noremap=true})
map('n', "<leader>4", "4gt", {noremap=true})
map('n', "<leader>5", "5gt", {noremap=true})
map('n', "<leader>6", "6gt", {noremap=true})
map('n', "<leader>7", "7gt", {noremap=true})
map('n', "<leader>8", "8gt", {noremap=true})
map('n', "<leader>9", "9gt", {noremap=true})
map('n', '<leader>0', ':tablast<cr>', {noremap=true})

map('n', '<leader>p', '*yy', {noremap=true})
map('n', '<leader>p', '*y', {noremap=true})

map('n', '<leader>+', ':vertical resize +5<CR>', {noremap=true})
map('n', '<leader>-', ':vertical resize -5<CR>', {noremap=true})

map('n', '<leader>rn', '<Plug>(coc-rename)')
map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gu', ':diffget //2<CR>')
map('n', '<leader>gs', ':G<CR>')
map('n', '<leader>gc', ':G commit<CR>')
map('n', '<leader>gp', ':G push<CR>')

map('n', '<leader>a', '<Plug>(coc-codeaction-selected)')
map('n', '<leader>ac', '<Plug>(coc-codeaction)')
map('n', '<leader>qf', '<Plug>(coc-fix-current)')
map('n', '<leader>f', '<Plug>(coc-format-selected)')
map('x', '<leader>f', '<Plug>(coc-format-selected)')


-- control

map('n', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap=true})
map('n', '<C-s>', ':w', {noremap=true})
map('n', '<C-G>', '<cmd>Telescope live_grep<cr>', {noremap=true})
map('n', '<C-s>', ':w', {noremap=true})

map('n', '<C-n>', ':NERDTreeToggle<CR>')
--map('n', '<S-Down>', '<C-d>')
--map('n', '<S-Up>', '<C-u>')

--map('v', '<S-Down>', '<C-d>')
--map('v', '<S-Up>', '<C-u>')

map('n', '<silent> <space>a', ':<C-u>CocList diagnostics<cr>', {noremap=true})
map('n', '<silent> <space>e', ':<C-u>CocList extensions<cr>', {noremap=true})
map('n', '<silent> <space>c', ':<C-u>CocList commands<cr>', {noremap=true})
map('n', '<silent> <space>o', ':<C-u>CocList outline<cr>', {noremap=true})
map('n', '<silent> <space>s', ':<C-u>CocList -I symbols<cr>', {noremap=true})
map('n', '<silent> <space>j', ':<C-u>CocNext<cr>', {noremap=true})
map('n', '<silent> <space>k', ':<C-u>CocPrev<cr>', {noremap=true})

-- others

map('n', 'Y', 'y$', {noremap=true})
map('n', 'Q', '<Nop>', {noremap=true})
map('n', '<esc>', ':noh<cr>', {noremap=true})

map('n', 'cc', '<Plug>NERDCommenterToggle')
map('v', 'cc', '<Plug>NERDCommenterToggle')
map('n', '<silent> gr', '<Plug>(coc-references)')
map('n', '<silent> gd', '<Plug>(coc-definition)')
map('n', '<silent> gy', '<Plug>(coc-type-definition)')
map('n', '<silent> gi', '<Plug>(coc-implementation)')
map('n', '<silent> gr', '<Plug>(coc-references)')
