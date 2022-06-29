local Plugin = {
	["PluginName"] = "Big Head",
	["PluginDescription"] = "May you do a ton of trolling",
	["Commands"] = {
		["bighead"] = {
			["ListName"] = "bighead / biggest / bigger / big",
			["Description"] = "Makes you head big",
			["Aliases"] = { "biggest", "bigger", "big" },
			["Function"] = function(args, speaker)
				for i, v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
					if string.find(v.Name, "Scale") and v.Name ~= "HeadScale" then
						repeat
							wait()
						until game.Players.LocalPlayer.Character.Head:FindFirstChild("OriginalSize")
						game.Players.LocalPlayer.Character.Head.OriginalSize:Destroy()
						v:Destroy()
						game.Players.LocalPlayer.Character.Head:WaitForChild("OriginalSize")
						game.Players.LocalPlayer.Character.Head.OriginalSize:Destroy()
					end
				end
				wait()
				game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
			end,
		},
	},
}

return Plugin
