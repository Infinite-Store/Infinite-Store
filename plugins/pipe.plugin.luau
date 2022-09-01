local Plugin = {
	["PluginName"] = "pipe sfx",
	["PluginDescription"] = "play a sound of a metal pipe falling",
	["Commands"] = {
		["pipe"] = {
			["ListName"] = "pipe / pf [pitch] [volume]",
			["Description"] = "play a sound of a metal pipe falling",
			["Aliases"] = { "pf" },
			["Function"] = function(args, speaker)
				local g = Instance.new("Sound")
				local Content = game:GetService("ContentProvider")
				g.Parent = workspace
				g.SoundId = "http://www.roblox.com/asset/?id=6011094380"
				g.Volume = args[2]
				if args[2] == nil then
					g.Volume = 1
				end
				g.Pitch = args[1]
				if args[1] == nil then
					g.Pitch = 1
				end
				Content:PreloadAsync({ g })
				g:Play()
			end,
		},
	},
}
return Plugin
