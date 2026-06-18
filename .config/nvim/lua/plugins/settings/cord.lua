local present, cord = pcall(require, "cord")

if not present then
	return
end

cord.setup {
	buttons = {
		{
			label = 'View Repository',
			url = function(opts)
				return opts.repo_url -- only show the button if a repo URL is found
			end,
		},
	},
	display = {
		theme = 'default',
		flavor = 'accent',
		view = 'asset',
	}
}
