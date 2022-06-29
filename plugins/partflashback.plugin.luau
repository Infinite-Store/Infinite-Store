local Plugin = {
	["PluginName"] = "Part Flashback",
	["PluginDescription"] = "Creates a part that you can teleport to",
	["Commands"] = {
		["partflashback"] = {
			["ListName"] = "partflashback / pflash",
			["Description"] = "Allows you to teleport to a part",
			["Aliases"] = { "pflash" },
			["Function"] = function(args, speaker)
				mouse = game.Players.LocalPlayer:GetMouse()

				sound = Instance.new("Sound")
				sound.SoundId = "rbxassetid://690607937"
				sound.Volume = 1

				player = game.Players.LocalPlayer
				character = player.Character

				local tppart = Instance.new("Part")
				sound.Parent = tppart
				tppart.Parent = workspace
				tppart.Anchored = true

				tppart.Material = "ForceField"

				active = false

				mouse.KeyDown:Connect(function(key)
					tppart.Size = Vector3.new(1, 1, 1)
					tppart.CanCollide = false
					if key == "h" then
						tppart.CFrame = character.HumanoidRootPart.CFrame
					end

					if key == "g" then
						character:MoveTo(tppart.Position)
						sound:Play()
						active = false
					end
				end)

				character.Humanoid.Died:Connect(function()
					tppart:Destroy()
					script:Destroy()
				end)
			end,
		},
	},
}

return Plugin
