local Plugin = {
	["PluginName"] = "Random place generator",
	["PluginDescription"] = "join random place",
	["Commands"] = {
		["joinplace"] = {
			["ListName"] = "joinplace [min] [max]",
			["Description"] = "join random place ([min] [max] is placeid)",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local minimum = args[1]
				local maximum = args[2]
				notify("Joining random place...")
				wait(1.5)

				local ran = math.random(minimum, maximum)
				notify("Joining " .. ran)
				game:GetService("TeleportService"):Teleport(ran)
				wait(2)
				notify("Failed to join: " .. ran)
				wait(2)
			end,
		},
	},
}

return Plugin
