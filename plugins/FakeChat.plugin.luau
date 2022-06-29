local Plugin = {
	["PluginName"] = "Fake Chat",
	["PluginDescription"] = "Be able to chat as anyone.",
	["Commands"] = {
		["fakechat"] = {
			["ListName"] = "fakechat / fchat [plr] [msg]",
			["Description"] = "Chat an string as the specified player.",
			["Aliases"] = { "fchat" },
			["Function"] = function(args, speaker)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
					utf8.char(11774):rep(27 + #game.Players.LocalPlayer.Name)
						.. "["
						.. args[1]
						.. "]"
						.. ": "
						.. args[2],
					"All"
				)
			end,
		},
	},
}

return Plugin
