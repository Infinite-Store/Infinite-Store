local Players = game:GetService("Players")
return {
	["PluginName"] = "Free Fall",
	["PluginDescription"] = "Scripted by NoobSploit#0001",
	["Commands"] = {
		["freefall"] = {
			["ListName"] = "freefall [height]",
			["Description"] = "FreeFalled",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if not args[1] then
					return
				end
				local Height = getstring(1)
				Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
					Vector3.new(
						Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
						Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + Height,
						Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
					)
				)
			end,
		},
		["bounce"] = {
			["ListName"] = "bounce [height]",
			["Description"] = "bounced",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if not args[1] then
					return
				end
				local Height = getstring(1)
				Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart.Velocity =
					Vector3.new(0, Height, 0)
			end,
		},
	},
}
