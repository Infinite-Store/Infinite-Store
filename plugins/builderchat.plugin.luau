local Plugin = {
	["PluginName"] = "Builderman Chat",
	["PluginDescription"] = "Pretend to be Builderman (Modded by LuaLighter)",
	["Commands"] = {
		["buildchat"] = {
			["ListName"] = "buildchat / bchat [your msg] [builderman msg]",
			["Description"] = "Chat as Builerman",
			["Aliases"] = { "bchat" },
			["Function"] = function(args, speaker)
				local msg = getstring(1)
					.. "                                                                                                                   [Builderman]: "
					.. getstring(2)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
					:FireServer(msg, "All")
			end,
		},
	},
}

return Plugin
