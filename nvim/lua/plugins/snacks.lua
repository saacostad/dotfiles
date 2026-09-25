return {
    -- Session management
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },

    -- Snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,

        opts = {
            dashboard = {
                enabled = true,

                sections = {
                    {
                        section = "header",
                    },

                    {
                        section = "keys",
                        gap = 1,
                        padding = 1,
                    },

                    {
                        section = "startup",
                    },
                },
            },

            picker = {
                enabled = true,
            },

            notifier = {
                enabled = true,
            },

	    indent = {
		enabled = true,
		scope = {
			enabled = true, 
		},
	    },
        },
    },
}
