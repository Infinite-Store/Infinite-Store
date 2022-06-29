local Plugin = {
	["PluginName"] = "plugin name",
	["PluginDescription"] = "description",
	["Commands"] = {
		["command1"] = {
			["ListName"] = "command1 / alias1 / alias2",
			["Description"] = "description",
			["Aliases"] = { "alias1", "alias2" },
			["Function"] = function(args, speaker)
				print("placeholder")
			end,
		},
	},
}

return Plugin
