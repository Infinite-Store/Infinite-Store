return {
	["PluginName"] = "antiflingunfling",
	["PluginDescription"] = "Stops you from getting flinged from the unfling cmd",
	["Commands"] = {
		["antiflingunfling"] = {
			["ListName"] = "antiflingunfling / afu",
			["Description"] = "Stops you from getting flinged from the unfling cmd",
			["Aliases"] = { "afu" },
			["Function"] = function(args, speaker)
				execCmd("unfling")
				execCmd("freeze")
				execCmd("breakvelocity")
				execCmd("unfreeze")
			end,
		},
	},
}
