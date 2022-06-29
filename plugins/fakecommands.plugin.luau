local Plugin = {
	["PluginName"] = "Fake Commands",
	["PluginDescription"] = "Allows you to pretend you got kick/banned, for whatever reason you need it for.",
	["Commands"] = {
		["fakekick"] = {
			["ListName"] = "fakekick <reason>",
			["Description"] = "Kicks you for the desired reason.",
			["Aliases"] = { "fkick" },
			["Function"] = function(args, speaker)
				local reason = getstring(1)
				speaker:Kick("\n\nYou have been removed from this game!\n\nReason: " .. reason .. "\n")
			end,
		},
		["fakeban"] = {
			["ListName"] = "fakeban <reason>",
			["Description"] = "Bans you for the desired reason.",
			["Aliases"] = { "fban" },
			["Function"] = function(args, speaker)
				local reason = getstring(1)
				speaker:Kick("\n\nYou have been banned from this game!\n\nReason: " .. reason .. "\n")
			end,
		},
	},
}

return Plugin
