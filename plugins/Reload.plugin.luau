local Plugin = {
	["PluginName"] = "Reload IY",
	["PluginDescription"] = "Reloads Infinite Yield",
	["Commands"] = {
		["reload"] = {
			["ListName"] = "reload / unload",
			["Description"] = "Self Explanitory",
			["Aliases"] = { "unload" },
			["Function"] = function(args, speaker)
				game:GetService("StarterGui")
					:SetCore("SendNotification", { Title = "Deleting IY", Text = "", Duration = 5 })
				wait(1)
				Holder:Destroy()
				Title_2:Destroy()
				Tooltip:Destroy()
				Notification:Destroy()
				KeybindEditor:Destroy()
				PluginEditor:Destroy()
				ToPartFrame:Destroy()
				logs:Destroy()
				infoFrame:Destroy()(getgenv() or _G)["IY_LOADED"] = false
				game:GetService("StarterGui")
					:SetCore("SendNotification", { Title = "Deleted IY", Text = "", Duration = 5 })
				loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
			end,
		},
	},
}

return Plugin
