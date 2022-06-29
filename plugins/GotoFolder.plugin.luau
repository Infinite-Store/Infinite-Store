return {
	["PluginName"] = "goto folder",
	["PluginDescription"] = "Go to a folder",
	["Commands"] = {
		["gotofolder"] = {
			["ListName"] = "gotofolder",
			["Description"] = "Made By D7M",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for i, v in pairs(workspace:GetDescendants()) do
					if v.Name:lower() == getstring(1):lower() then
						local Children = v:GetChildren()
						for i = 1, math.random(1, #Children) do
							getRoot(speaker.Character).CFrame = Children[i].CFrame
						end
					end
				end
			end,
		},
	},
}
