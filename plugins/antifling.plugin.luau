local Plugin = {
	["PluginName"] = "Antifling",
	["PluginDescription"] = "Prevents you from being flung.",
	["Commands"] = {
		["antifling"] = {
			["ListName"] = "antifling",
			["Description"] = "Prevents you from being flung.",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				execCmd("noclip")
				while wait(0.1) do
					pcall(function()
						if
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y > 20
							or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y < 9
						then
							game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
							wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
							wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
								12.6,
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
							)
						end
					end)
				end
			end,
		},
	},
}

return Plugin
