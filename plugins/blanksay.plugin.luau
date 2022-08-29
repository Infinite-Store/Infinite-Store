local Plugin = {
	["PluginName"] = "Blank Say",
	["PluginDescription"] = "Send blank messages.",
	["Commands"] = {
		["blanksay"] = {
			["ListName"] = "blanksay / blankchat",
			["Description"] = "Send a blank message in chat",
			["Aliases"] = { "blankchat" },
			["Function"] = function(args, speaker)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
					:FireServer(" ", "All")
			end,
		},
	},
}

return Plugin
