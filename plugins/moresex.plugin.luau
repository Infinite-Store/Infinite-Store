local Plugin = {}

Plugin.PluginName = "More Sex"
Plugin.PluginDescription = "made by prisj"
Plugin.Commands = {}

local Players = game:GetService("Players")
local gbangLoop = nil
local GBANGANIM = nil
local GBANGtrack = nil
local gbangDied = nil
local SuckLoop = nil
local SuckAnim = nil
local Sucktrack = nil
local SuckDied = nil

Plugin.Commands["getbang"] = {
	["ListName"] = "getbang / gbang [plr]",
	["Description"] = "Get banged by a player.",
	["Aliases"] = { "gbang" },
	["Function"] = function(args, speaker)
		if r15(speaker) then
			execCmd("ungetbang")
			local players = getPlayer(args[1], speaker)
			for i, plr in pairs(players) do
				Players.LocalPlayer.Character.Animate.Disabled = true
				GBANGAnim = Instance.new("Animation")
				GBANGAnim.AnimationId = "rbxassetid://4686925579"
				GBANGtrack = Players.LocalPlayer.Character.Humanoid:LoadAnimation(GBANGAnim)
				GBANGtrack:Play()
				if args[2] then
					GBANGtrack:AdjustSpeed(args[2])
				else
					GBANGtrack:AdjustSpeed(8)
				end
				gbangDied = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
					GBANGAnim:Destroy()
					GBANGtrack:Stop()
					gbangLoop:Disconnect()
					gbangDied:Disconnect()
				end)
				gbangLoop = game:GetService("RunService").Stepped:Connect(function()
					pcall(function()
						getRoot(Players.LocalPlayer.Character).CFrame = Players[plr].Character.HumanoidRootPart.CFrame
							* CFrame.new(0, 0, -1)
					end)
				end)
			end
		else
			notify("R15 Required", "This command requires the r15 rig type")
		end
	end,
}

Plugin.Commands["ungetbang"] = {
	["ListName"] = "ungetbang / ungbang",
	["Description"] = "Get unbanged by a player.",
	["Aliases"] = { "ungbang" },
	["Function"] = function(args, speaker)
		if gbangLoop ~= nil then
			gbangLoop:Disconnect()
			GBANGAnim:Destroy()
			GBANGtrack:Stop()
			Players.LocalPlayer.Character.Animate.Disabled = false
			gbangDied:Disconnect()
		end
	end,
}

Plugin.Commands["suck"] = {
	["ListName"] = "suck [plr]",
	["Description"] = "suck a player.",
	["Aliases"] = {},
	["Function"] = function(args, speaker)
		if r15(speaker) then
			execCmd("unsuck")
			local players = getPlayer(args[1], speaker)
			for i, plr in pairs(players) do
				Players.LocalPlayer.Character.Animate.Disabled = true
				SuckAnim = Instance.new("Animation")
				SuckAnim.AnimationId = "rbxassetid://4686925579"
				Sucktrack = Players.LocalPlayer.Character.Humanoid:LoadAnimation(GBANGAnim)
				Sucktrack:Play()
				if args[2] then
					GBANGtrack:AdjustSpeed(args[2])
				else
					GBANGtrack:AdjustSpeed(8)
				end
				SuckDied = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
					SuckAnim:Destroy()
					Sucktrack:Stop()
					SuckLoop:Disconnect()
					SuckDied:Disconnect()
				end)
				SuckLoop = game:GetService("RunService").Stepped:Connect(function()
					pcall(function()
						getRoot(Players.LocalPlayer.Character).CFrame = Players[plr].Character.HumanoidRootPart.CFrame
							* CFrame.new(0, 0, -3.5)
							* CFrame.Angles(0, math.rad(180), 0)
					end)
				end)
			end
		else
			notify("R15 Required", "This command requires the r15 rig type")
		end
	end,
}

Plugin.Commands["unsuck"] = {
	["ListName"] = "unsuck [plr]",
	["Description"] = "unsuck a player.",
	["Aliases"] = {},
	["Function"] = function(args, speaker)
		if SuckLoop ~= nil then
			SuckLoop:Disconnect()
			SuckAnim:Destroy()
			Sucktrack:Stop()
			Players.LocalPlayer.Character.Animate.Disabled = false
			SuckDied:Disconnect()
		end
	end,
}

return Plugin
