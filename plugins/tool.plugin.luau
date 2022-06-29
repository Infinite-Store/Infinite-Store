local Wishes = {
	["PluginName"] = "Activate Tool",
	["PluginDescription"] = "Activates tool thats in players hand (loops) ",
	["Commands"] = {
		["activate"] = {
			["ListName"] = "activate / acti",
			["Description"] = "Begins to loop activate tool",
			["Aliases"] = { "acti" },
			["Function"] = function(args, speaker)
				_G.Stop = false

				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Stop == true then
						return
					end
					for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							v:Activate()
						end
					end
				end)
			end,
		},
		["unactivate"] = {
			["ListName"] = "unactivate / unacti",
			["Description"] = "Stops activating tools",
			["Aliases"] = { "unacti" },
			["Function"] = function(args, speaker)
				_G.Stop = true
			end,
		},
	},
}
return Wishes
