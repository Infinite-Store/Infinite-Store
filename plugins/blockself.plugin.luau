return {
	["PluginName"] = "BlockSelf",
	["PluginDescription"] = "Makes you blocky and fat.",
	["Commands"] = {
		["blockself"] = {
			["ListName"] = "blockself [delay]",
			["Description"] = "Makes you blocky and fat.",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				speaker.Character.CharacterMesh:Destroy()
				wait(args[1])
				speaker.Character.CharacterMesh:Destroy()
				wait(args[1])
				speaker.Character.CharacterMesh:Destroy()
				wait(args[1])
				speaker.Character.CharacterMesh:Destroy()
				wait(args[1])
				speaker.Character.CharacterMesh:Destroy()
				wait(0.01)
				notify("Yum!", "You just ate " .. math.random(500, 900) .. " hamburgers.")
			end,
		},
	},
}
