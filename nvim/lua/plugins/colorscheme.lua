return {
	'ThorstenRhau/token', 
	version = '*',
	lazy = false,     -- load at startup, since it's your main colorscheme
	priority = 1000,  -- load before all other plugins
	config = function()
		local token = require('token')

		local config = {
			transparent = false,
			plugins = { gitsigns = true, snacks = true },
		}

		token.setup(config)

		vim.cmd.colorscheme('token-melange') -- or 'token-ultra', 'token-meridian', 'token-melange', 'token-flint', 'token-temper'	
	end,
}
