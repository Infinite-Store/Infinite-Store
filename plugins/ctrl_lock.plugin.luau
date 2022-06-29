local Plugin = {
	["PluginName"] = "Ctrl Lock",
	["PluginDescription"] = "Bind Shift Lock to Left Control",
	["Commands"] = {
		["controllock"] = {
			["ListName"] = "controllock / ctrllock",
			["Description"] = "Bind Shift Lock to Left Control",
			["Aliases"] = { "ctrllock" },
			["Function"] = function(args, speaker)
				local Players = game:GetService("Players")
				local NewLockKey = "LeftControl"
				local MouseLockController = Players.LocalPlayer.PlayerScripts
					:WaitForChild("PlayerModule")
					:WaitForChild("CameraModule")
					:WaitForChild("MouseLockController")
				local Object = MouseLockController:FindFirstChild("BoundKeys")
				if Object then
					Object.Value = NewLockKey
				else
					Object = Instance.new("StringValue")
					Object.Name = "BoundKeys"
					Object.Value = NewLockKey
					Object.Parent = MouseLockController
				end
			end,
		},
	},
}
return Plugin
