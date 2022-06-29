local Plugin = {
	["PluginName"] = "Draggable Chat",
	["PluginDescription"] = "Credit for script Poptart#4811, Credit for plugin and idea Orion#4085",
	["Commands"] = {
		["dragchat"] = {
			["ListName"] = "dragchat / dragc",
			["Description"] = "Drag roblox chat anywhere hold left click",
			["Aliases"] = { "dragc" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://pastebin.com/raw/svqRbx2n", true))()
			end,
		},
	},
}

return Plugin
