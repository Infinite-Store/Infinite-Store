local Plugin = {
	["PluginName"] = "Dark Dex",
	["PluginDescription"] = "Dark Dex but in Infinite Yield",
	["Commands"] = {
		["darkdex"] = {
			["ListName"] = "darkdex",
			["Description"] = "Executes Dark Dex",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z"))()
			end,
		},
	},
}

return Plugin
