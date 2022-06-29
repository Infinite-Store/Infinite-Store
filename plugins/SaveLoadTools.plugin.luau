return {
	["PluginName"] = "Save/Load Tools",
	["PluginDescription"] = "Scripted by Empire#4946!",
	["Commands"] = {
		["savetools"] = {
			["ListName"] = "savetools / savet",
			["Description"] = "Saves Tools and puts them into your Player",
			["Aliases"] = { "savet" },
			["Function"] = function(args, speaker)
				for i, v in pairs(speaker:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = speaker
					end
				end
			end,
		},
		["loadtools"] = {
			["ListName"] = "loadtools / loadt",
			["Description"] = "Loads Saved Tools",
			["Aliases"] = { "loadt" },
			["Function"] = function(args, speaker)
				for i, v in pairs(speaker:GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = speaker:FindFirstChildOfClass("Backpack")
					end
				end
			end,
		},
	},
}
