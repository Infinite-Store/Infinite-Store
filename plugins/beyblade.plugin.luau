local Plugin = {
	["PluginName"] = "Beyblade",
	["PluginDescription"] = "Turns you into a beyblade.",
	["Commands"] = {
		["beyblade"] = {
			["ListName"] = "beyblade",
			["Description"] = "Makes you a beyblade!",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				execCmd("walkspeed 100", speaker)
				execCmd("fling", speaker)
			end,
		},
	},
}
return Plugin
