local Plugin = {
	["PluginName"] = "displayNameRemover",
	["PluginDescription"] = "removes those pesky display names",
	["Commands"] = {
		["removedisplay"] = {
			["ListName"] = "removedisplay / removedisplaynames / nodisplayname / ndn",
			["Description"] = "this removes display names",
			["Aliases"] = { "removedisplaynames", "nodisplayname", "ndn" },
			["Function"] = function(args, speaker)
				local j = require(game.Chat:WaitForChild("ClientChatModules").ChatSettings)
				j.PlayerDisplayNamesEnabled = false
				for i, v in pairs(game:GetService("Players"):GetPlayers()) do
					if v:IsA("Player") then
						local username = v.Name
						v.DisplayName = username
						v.Character:FindFirstChildWhichIsA("Humanoid").DisplayName = username
						v.CharacterAdded:Connect(function(character)
							while wait(1) do
								if character == false then
									break
								end
								character:FindFirstChildWhichIsA("Humanoid").DisplayName = v.Name
							end
						end)
					end
				end
				game:GetService("Players").PlayerAdded:Connect(function(player)
					player.DisplayName = player.Name

					player.CharacterAdded:Connect(function(character)
						while wait(1) do
							if character == false then
								break
							end
							character:FindFirstChildWhichIsA("Humanoid").DisplayName = player.Name
						end
					end)
				end)
			end,
		},
	},
}

return Plugin
