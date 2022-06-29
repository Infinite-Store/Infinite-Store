local Plugin = {
	["PluginName"] = "Showhealth",
	["PluginDescription"] = "Made by YuKii#4662",
	["Commands"] = {
		["health"] = {
			["ListName"] = "health / hp [plr]",
			["Description"] = "Show Player Health",
			["Aliases"] = { "hp" },
			["Function"] = function(args, speaker)
				local players = getPlayer(args[1], speaker)
				for k, v in pairs(players) do
					if Players[v].Character:FindFirstChildWhichIsA("Humanoid") then
						local HP = Players[v].Character:FindFirstChildWhichIsA("Humanoid").Health
						notify(Players[v].name .. "'s Health", tostring(HP))
					end
				end
			end,
		},
	},
}
return Plugin
