local Plugin = {
	["PluginName"] = "Toon ESP",
	["PluginDescription"] = "Universal ESP by Toon ezezez",
	["Commands"] = {
		["toonesp"] = {
			["ListName"] = "toonesp",
			["Description"] = "Load Toon's Togglable ESP Script",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Patch-Shack/ToonESP/main/main.lua"))()
			end,
		},
	},
}
return Plugin
