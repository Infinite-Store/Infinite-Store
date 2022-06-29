local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop

if sethidden then
	local Plugin = {
		["PluginName"] = "Better Textures",
		["PluginDescription"] = "WheresSilly#7227",
		["Commands"] = {
			["improvetextures"] = {
				["ListName"] = "improvetextures",
				["Description"] = "Switches Textures",
				["Aliases"] = {},
				["Function"] = function(args, speaker)
					sethidden(game:GetService("MaterialService"), "Use2022Materials", true)
				end,
			},
			["undotextures"] = {
				["ListName"] = "undotextures",
				["Description"] = "Switches Textures",
				["Aliases"] = {},
				["Function"] = function(args, speaker)
					sethidden(game:GetService("MaterialService"), "Use2022Materials", false)
				end,
			},
		},
	}

	return Plugin
else
	notify("Incompatible Exploit", "Your exploit does not support this command (missing sethiddenproperty)")
end
