ME = game.Players.LocalPlayer
local Plugin = {
	["PluginName"] = "Give Tools",
	["PluginDescription"] = "Not needed",
	["Commands"] = {
		["givetools"] = {
			["ListName"] = "givetools [plr]",
			["Description"] = "Why",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				execCmd("Noclip")
				oldpos = ME.Character.HumanoidRootPart.CFrame

				ME.Character.Humanoid:UnequipTools()
				ME.Character.Humanoid:Destroy()
				local hum = Instance.new("Humanoid", ME.Character)

				for i, tools in pairs(ME.Backpack:GetChildren()) do
					if tools:IsA("Tool") then
						tools.Parent = ME.Character
						tools.Handle.Massless = true
						tools.Handle.Size = tools.Handle.Size + Vector3.new(1.5, 1.5, 1.5)
					end
				end

				for i, plr in pairs(getPlayer(args[1], speaker)) do
					local n = 0
					repeat
						wait(0.2)
						n = n + 1
						ME.Character.HumanoidRootPart.CFrame = game.Players[plr].Character.HumanoidRootPart.CFrame
					until n == 4
				end
				wait(5.1)
				ME.Character.HumanoidRootPart.CFrame = oldpos
			end,
		},
	},
}

return Plugin
