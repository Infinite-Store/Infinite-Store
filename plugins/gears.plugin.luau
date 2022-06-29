return {
	["PluginName"] = "Client sided gear",
	["PluginDescription"] = "Made by NoobSploit#0001",
	["Commands"] = {
		["gear"] = {
			["ListName"] = "gear [id]",
			["Description"] = "This is client sided and will probably not work",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local id = getstring(1)
				local a = game:GetObjects("rbxassetid://" .. id)[1]
				a.Parent = speaker.Backpack
			end,
		},
	},
}
