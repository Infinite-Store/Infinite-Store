return {
	["PluginName"] = "Aimbot",
	["PluginDescription"] = "gives you an aimlock gui",
	["Commands"] = {
		["aimbot"] = {
			["ListName"] = "aimbot / aim",
			["Description"] = "aimbot, an aimbot",
			["Aliases"] = { "aim" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://pastebin.com/raw/5JmMeENX"))()
			end,
		},
	},
}
