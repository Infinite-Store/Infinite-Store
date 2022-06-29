local Plugin = {
	["PluginName"] = "schat",
	["PluginDescription"] = "Scripted by NoobSploit#0001",
	["Commands"] = {
		["schat"] = {
			["ListName"] = "schat [text]",
			["Description"] = "Chats in game.Players:Chat and can only be seen though chat logs",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if not args[1] then
					return
				end
				game:GetService("Players"):Chat(tostring(getstring(1)))
			end,
		},
	},
}
return Plugin
