local Plugin = {
	["PluginName"] = "Unload IY",
	["PluginDescription"] = "Removes IY from your game",
	["Commands"] = {
		["unload"] = {
			["ListName"] = "unload",
			["Description"] = "Unload Infinite Yield",
			["Aliases"] = {},
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
			end,
		},
	},
}

return Plugin
