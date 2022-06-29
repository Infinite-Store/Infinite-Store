local Plugin = {
	["PluginName"] = "No Cooldown",
	["PluginDescription"] = "Removes Cooldown (Universal)",
	["Commands"] = {
		["nocooldown"] = {
			["ListName"] = "nocooldown / noc",
			["Description"] = "Removes cooldown, is universal. Might cause some lag.",
			["Aliases"] = { "noc" },
			["Function"] = function()
				local a
				a = hookfunc(wait, function(b)
					b = nil
					return a(b)
				end)
			end,
		},
	},
}
return Plugin
