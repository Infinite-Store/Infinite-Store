local Plugin = {
	["PluginName"] = "Lofi Music GUI",
	["PluginDescription"] = "load gui to play epic music",
	["Commands"] = {
		["lofimusic"] = {
			["ListName"] = "lofimusic / lofigui",
			["Description"] = "🎵😔",
			["Aliases"] = { "lofigui" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://pastebin.com/raw/6sAWRWc8"))()
			end,
		},
	},
}

return Plugin
