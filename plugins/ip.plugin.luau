local Plugin = {
	["PluginName"] = "G.I.P.",
	["PluginDescription"] = "Generates random IPv4 Address",
	["Commands"] = {
		["getip"] = {
			["ListName"] = "GetIP [plr] / GIP [plr]",
			["Description"] = "Generates IP",
			["Aliases"] = { "gip" },
			["Function"] = function(args, speaker)
				for i, plr in pairs(getPlayer(args[1], speaker)) do
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
						game:GetService("Players")[plr].Name
							.. "'s Ip is "
							.. math.random(1, 255)
							.. "#"
							.. math.random(1, 255)
							.. "#"
							.. math.random(1, 255)
							.. "#"
							.. math.random(1, 255),
						"All"
					)
				end
			end,
		},
	},
}

return Plugin
