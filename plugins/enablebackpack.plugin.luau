local Plugin = {
	["PluginName"] = "Enable Backpack",
	["PluginDescription"] = "Enables backpack",
	["Commands"] = {
		["enablebackpack"] = {
			["ListName"] = "enablebackpack",
			["Description"] = "Enables backpack",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				mouse = game.Players.LocalPlayer:GetMouse()
				GUI = game.CoreGui
				Back = GUI.RobloxGui.Backpack
				Back.Visible = true

				mouse.KeyDown:Connect(function(key)
					if key == "`" then
						if Back.Inventory.Visible ~= true then
							Back.Inventory.Visible = true
						else
							Back.Inventory.Visible = false
						end
					end
				end)
			end,
		},
	},
}

return Plugin
