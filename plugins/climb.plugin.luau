climbing = false
local Plugin = {
	["PluginName"] = "Climb",
	["PluginDescription"] = "Make you climb",
	["Commands"] = {
		["climb"] = {
			["ListName"] = "climb",
			["Description"] = "monke",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if climbing == false then
					climbing = true
					local plr = game.Players.LocalPlayer
					truss = Instance.new("TrussPart", workspace)
					truss.Transparency = 0.8
					truss.Name = "truss"
					truss.CanCollide = true
					truss.Anchored = true
					truss.Size = Vector3.new(0, 10, 0)
					climbstep = game:GetService("RunService").RenderStepped:Connect(function()
						truss.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1.5)
					end)
				else
					notify("Climbing still active")
				end
			end,
		},
		["unclimb"] = {
			["ListName"] = "unclimb",
			["Description"] = "stop climb",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				climbing = false
				climbstep:Disconnect()
				truss:Destroy()
			end,
		},
	},
}

return Plugin
