local Plugin = {
	["PluginName"] = "System chat",
	["PluginDescription"] = "Fake chat as a system",
	["Commands"] = {
		["systemchat"] = {
			["ListName"] = "systemchat / schat [msg]",
			["Description"] = "chat as a system",
			["Aliases"] = { "schat" },
			["Function"] = function(args, speaker)
				local msg = "                                                                                                                   {System} "
					.. getstring(1)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
					:FireServer(msg, "All")
			end,
		},
	},
}

return Plugin
