local Plugin = {
	["PluginName"] = "No Sound",
	["PluginDescription"] = "Scripted by NoobSploit#0001 Sarge#0196 doesnt have a dick",
	["Commands"] = {
		["nosound"] = {
			["ListName"] = "nosound",
			["Description"] = "Deletes sounds",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for _, sound in next, workspace:GetDescendants() do
					if sound:IsA("Sound") then
						sound:Destroy()
					end
				end
			end,
		},
	},
}
return Plugin
