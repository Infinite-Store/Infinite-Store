local Plugin = {
	["PluginName"] = "Unanchored Teleporter",
	["PluginDescription"] = "Unanchored parts teleporter gui.",
	["Commands"] = {
		["unanchored"] = {
			["ListName"] = "unanchored",
			["Description"] = "Launches Unanchored Teleporter.",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet(
						"https://raw.githubusercontent.com/TR011F4C3/PANDA/main/scripts/unanchored_teleporter.lua"
					)
				)()
			end,
		},
	},
}

return Plugin
-- gui made by TomQ#6764
