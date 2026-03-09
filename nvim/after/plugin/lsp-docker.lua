local lsp = vim.lsp

lsp.config('dockerls', {
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
})

lsp.config('docker_language_server', {
	initializationOptions = {
		dockerfileExperimental = {
			removeOverlappingIssues = true, -- Intended to integrate with dockerls
		},
		telemetry = "off",
	},
})

lsp.enable('docker_language_server')
lsp.enable('dockerls')
