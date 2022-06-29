local Plugin = {
	["PluginName"] = "Wall Run",
	["PluginDescription"] = "Gain the ability to walk on walls",
	["Commands"] = {
		["wallrun"] = {
			["ListName"] = "wallrun / walkonwalls",
			["Description"] = "Allows you to run on walls! Press N to Toggle",
			["Aliases"] = { "walkonwalls" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://pastebin.com/raw/pC7rFinA"))()
			end,
		},
	},
}
return Plugin
