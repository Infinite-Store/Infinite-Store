local PlayAllSounds = function()
	for _, sound in next, workspace:GetDescendants() do
		if sound:IsA("Sound") then
			sound:Play()
		end
	end
end
local RunService = game:GetService("RunService")
local PlaySoundLoop = nil
local Plugin = {
	["PluginName"] = "earrape",
	["PluginDescription"] = "Scripted by NoobSploit#0001",
	["Commands"] = {
		["playsounds"] = {
			["ListName"] = "playsounds",
			["Description"] = "This is FE will so it will affect everyone",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAllSounds()
			end,
		},
		["unplaysounds"] = {
			["ListName"] = "unplaysounds",
			["Description"] = "stops all sounds",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for _, sound in next, workspace:GetDescendants() do
					if sound:IsA("Sound") then
						sound.Playing = false
					end
				end
			end,
		},
		["check"] = {
			["ListName"] = "check",
			["Description"] = "Check if the plugin works for the game you're on",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if game:GetService("SoundService").RespectFilteringEnabled == true then
					notify("Earrape", "Earrape CANT run on this game")
				else
					notify("Earrape", "Earrape CAN run on this game")
				end
			end,
		},
		["loopplaysounds"] = {
			["ListName"] = "loopplaysounds [delay]",
			["Description"] = "Loop Play Sounds",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local delay = getstring(1) or 0
				if PlaySoundLoop ~= nil then
					return
				end
				PlaySoundLoop = RunService.RenderStepped:Connect(function()
					PlayAllSounds()
					RunService.RenderStepped:Wait(delay)
				end)
			end,
		},
		["unloopplaysounds"] = {
			["ListName"] = "unloopplaysounds",
			["Description"] = "Stop looping play sounds",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if PlaySoundLoop == nil then
					return
				end
				PlaySoundLoop:Disconnect()
				PlaySoundLoop = nil
			end,
		},
		["restartmusic"] = {
			["ListName"] = "restartmusic",
			["Description"] = "Sets all playing sounds time position to 0",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for i, v in next, workspace:GetDescendants() do
					if v:IsA("Sound") and v.Playing == true then
						v.TimePosition = 0
					end
				end
			end,
		},
	},
}
return Plugin
