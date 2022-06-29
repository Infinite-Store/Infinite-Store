local lplr = game:GetService("Players").LocalPlayer

normalSpeed = lplr.Character.Humanoid.WalkSpeed
speed = 30

local Plugin = {
	["PluginName"] = "Shift To Sprint",
	["PluginDescription"] = "A plugin to be able to shift to sprint at the speed you want",
	["Commands"] = {
		["shifttosprint"] = {
			["ListName"] = "shifttosprint / sts",
			["Description"] = "Toggle the shift to sprint",
			["Aliases"] = { "sts" },
			["Function"] = function(args, speaker)
				local UserInputService = game:GetService("UserInputService")

				event = UserInputService.InputBegan:connect(function(input, gameprocessed)
					if input.KeyCode == Enum.KeyCode.LeftShift then
						lplr.Character.Humanoid.WalkSpeed = speed
					end
				end)

				event2 = UserInputService.InputEnded:connect(function(input, gameprocessed)
					if input.KeyCode == Enum.KeyCode.LeftShift then
						lplr.Character.Humanoid.WalkSpeed = normalSpeed
					end
				end)
			end,
		},
		["sprintspeed"] = {
			["ListName"] = "sprintspeed [speed]",
			["Description"] = "Set the speed of the shit to sprint",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if args[1] ~= nil then
					speed = args[1]
				elseif args[1] == nil then
					speed = 30
				end
			end,
		},
		["noshifttosprint"] = {
			["ListName"] = "noshifttosprint / nsts",
			["Description"] = "Disconnect the shift to sprint event",
			["Aliases"] = { "nsts" },
			["Function"] = function(args, speaker)
				lplr.Character.Humanoid.WalkSpeed = normalSpeed
				event:Disconnect()
				event2:Disconnect()
			end,
		},
	},
}
return Plugin
