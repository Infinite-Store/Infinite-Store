local Plugin = {
	["PluginName"] = "Telekinesis",
	["PluginDescription"] = "Control Unanchored Parts",
	["Commands"] = {
		["telekinesis"] = {
			["ListName"] = "telekinesis / tel",
			["Description"] = "Jedi with Unanchored Parts",
			["Aliases"] = { "tel" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGetAsync("https://pastebin.com/raw/KbEZjNXm"))()
			end,
		},
	},
}
return Plugin
