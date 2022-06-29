getgenv().shawnjbragdon = getgenv().shawnjbragdon or {}

for index, value in pairs(getgenv().shawnjbragdon) do
	if value and typeof(value) == "RBXScriptConnection" then
		pcall(value.Disconnect, value)
	end
end

local emoteIds = {
	["Agree"] = 4849487550,
	["Disagree"] = 4849495710,
	["Power Blast"] = 4849497510,
	["Happy"] = 4849499887,
	["Sad"] = 4849502101,
	["Bunny Hop"] = 4646296016,
	["Peanut Butter Jelly Dance"] = 4390121879,
	["Around Town"] = 3576747102,
	["Top Rock"] = 3570535774,
	["Jumping Wave"] = 4940602656,
	["Keeping Time"] = 4646306072,
	["Fashionable"] = 3576745472,
	["Robot"] = 3576721660,
	["Twirl"] = 3716633898,
	["Jacks"] = 3570649048,
	["TPose"] = 3576719440,
	["Shy"] = 3576717965,
	["Monkey"] = 3716636630,
	["Borock's Rage"] = 3236848555,
	["Ud'zal's Summoning"] = 3307604888,
	["Hype Dance"] = 3696757129,
	["Godlike"] = 3823158750,
	["Swish"] = 3821527813,
	["Sneaky"] = 3576754235,
	["Side to Side"] = 3762641826,
	["Greatest"] = 3762654854,
	["Louder"] = 3576751796,
	["Celebrate"] = 3994127840,
	["Haha"] = 4102315500,
	["Get Out"] = 3934984583,
	["Tree"] = 4049634387,
	["Fishing"] = 3994129128,
	["Fast Hands"] = 4272351660,
	["Y"] = 4391211308,
	["Zombie"] = 4212496830,
	["Baby Dance"] = 4272484885,
	["Line Dance"] = 4049646104,
	["Dizzy"] = 3934986896,
	["Shuffle"] = 4391208058,
	["Dorky Dance"] = 4212499637,
	["Bodybuilder"] = 3994130516,
	["Idol"] = 4102317848,
	["Fancy Feet"] = 3934988903,
	["Curtsy"] = 4646306583,
	["Air Dance"] = 4646302011,
	["Air Guitar"] = 3696761354,
	["Chicken Dance"] = 4849493309,
	["Sleep"] = 4689362868,
	["Hero Landing"] = 5104377791,
	["Confused"] = 4940592718,
	["Cower"] = 4940597758,
	["Tantrum"] = 5104374556,
	["Bored"] = 5230661597,
	["Beckon"] = 5230615437,
	["Hello"] = 3576686446,
	["Salute"] = 3360689775,
	["Stadium"] = 3360686498,
	["Tilt"] = 3360692915,
	["Point"] = 3576823880,
	["Shrug"] = 3576968026,
	["Heisman Pose"] = 3696763549,
	["Cha-Cha"] = 3696764866,
	["Country Line Dance - Lil Nas X (LNX)"] = 5915780563,
	["Panini Dance - Lil Nas X (LNX)"] = 5915781665,
	["HOLIDAY Dance - Lil Nas X (LNX)"] = 5938396308,
	["Rodeo Dance - Lil Nas X (LNX)"] = 5938397555,
	["Old Town Road Dance - Lil Nas X (LNX)"] = 5938394742,
	["High Wave"] = 5915776835,
	["Rock On"] = 5915782672,
}

local emoteSourceIds = {
	["Agree"] = 4841397952,
	["Disagree"] = 4841401869,
	["Power Blast"] = 4841403964,
	["Happy"] = 4841405708,
	["Sad"] = 4841407203,
	["Bunny Hop"] = 4641985101,
	["Peanut Butter Jelly Dance"] = 4406555273,
	["Around Town"] = 3303391864,
	["Top Rock"] = 3361276673,
	["Jumping Wave"] = 4940564896,
	["Keeping Time"] = 4555808220,
	["Fashionable"] = 3333331310,
	["Robot"] = 3338025566,
	["Twirl"] = 3334968680,
	["Jacks"] = 3338066331,
	["TPose"] = 3338010159,
	["Shy"] = 3337978742,
	["Monkey"] = 3333499508,
	["Borock's Rage"] = 3236842542,
	["Ud'zal's Summoning"] = 3303161675,
	["Hype Dance"] = 3695333486,
	["Godlike"] = 3337994105,
	["Swish"] = 3361481910,
	["Sneaky"] = 3334424322,
	["Side to Side"] = 3333136415,
	["Greatest"] = 3338042785,
	["Louder"] = 3338083565,
	["Celebrate"] = 3338097973,
	["Haha"] = 3337966527,
	["Get Out"] = 3333272779,
	["Tree"] = 4049551434,
	["Fishing"] = 3334832150,
	["Fast Hands"] = 4265701731,
	["Y"] = 4349285876,
	["Zombie"] = 4210116953,
	["Baby Dance"] = 4265725525,
	["Line Dance"] = 4049037604,
	["Dizzy"] = 3361426436,
	["Shuffle"] = 4349242221,
	["Dorky Dance"] = 4212455378,
	["BodyBuilder"] = 3333387824,
	["Idol"] = 4101966434,
	["Fancy Feet"] = 3333432454,
	["Curtsy"] = 4555816777,
	["Air Dance"] = 4555782893,
	["Air Guitar"] = 3695300085,
	["Chicken Dance"] = 4841399916,
	["Sleep"] = 4686925579,
	["Hero Landing"] = 5104344710,
	["Confused"] = 4940561610,
	["Cower"] = 4940563117,
	["Tantrum"] = 5104341999,
	["Bored"] = 5230599789,
	["Beckon"] = 5230598276,
	["Hello"] = 3344650532,
	["Salute"] = 3333474484,
	["Stadium"] = 3338055167,
	["Tilt"] = 3334538554,
	["Point"] = 3344585679,
	["Shrug"] = 3334392772,
	["Heisman Pose"] = 3695263073,
	["Cha-Cha"] = 3695322025,
	["Country Line Dance - Lil Nas X (LNX)"] = 5915712534,
	["Panini Dance - Lil Nas X (LNX)"] = 5915713518,
	["HOLIDAY Dance - Lil Nas X (LNX)"] = 5937558680,
	["Rodeo Dance - Lil Nas X (LNX)"] = 5918728267,
	["Old Town Road Dance - Lil Nas X (LNX)"] = 5937560570,
	["High Wave"] = 5915690960,
	["Rock On"] = 5915714366,
}

local version = "1.0"
local plugin = {}

plugin.PluginName = string.format("MoreCmds %s", version)
plugin.PluginDescription = ""
plugin.Commands = {}

plugin.Commands["emote"] = {
	ListName = "emote [name]",
	Description = "Use an emote from the Roblox catalog.",
	Aliases = {},
	Function = function(arguments, speaker)
		local Character = speaker.Character
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		local Animator = Humanoid:FindFirstChildWhichIsA("Animator")
		local Name = #arguments > 1 and table.concat(arguments, " ") or arguments[1]
		for index, value in pairs(emoteSourceIds) do
			local i = tostring(index)
			if string.lower(arguments[1]) == string.lower(string.sub(i, 1, string.len(arguments[1]))) then
				local Animation = Instance.new("Animation")
				Animation.Name = ""
				Animation.AnimationId = string.format("rbxassetid://%s", string.match())
				local AnimationTrack = Animator:LoadAnimation(Animation)
				AnimationTrack.Name = ""
				AnimationTrack.Priority = Enum.AnimationPriority.Idle
				if string.lower(arguments[2]) == string.lower(string.sub("false", 1, string.len(arguments[2]))) then
					AnimationTrack.Looped = false
				elseif string.lower(arguments[2]) == string.lower(string.sub("true", 1, string.len(arguments[2]))) then
					AnimationTrack.Looped = true
				end
				AnimationTrack:Play()
				local onAnimationStopped = function()
					pcall(Animation.Destroy, Animation)
					pcall(AnimationTrack.Destroy, AnimationTrack)
				end
				Humanoid.Running:Connect(function(Torvel)
					if math.abs(Torvel) > 2 then
						coroutine.wrap(onAnimationStopped)()
					end
				end)
				AnimationTrack.Stopped:Connect(onAnimationStopped)
			end
		end
	end,
}

plugin.Commands["technology"] = {
	ListName = "technology [name]",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		local Lighting = game:GetService("Lighting")
		if sethiddenproperty and typeof(sethiddenproperty) == "function" then
			if string.lower(arguments[1]) == string.sub("future", 1, string.len(arguments[1])) then
				return sethiddenproperty(Lighting, "Technology", Enum.Technology.Future)
			elseif string.lower(arguments[1]) == string.sub("shadowmap", 1, string.len(arguments[1])) then
				return sethiddenproperty(Lighting, "Technology", Enum.Technology.ShadowMap)
			elseif string.lower(arguments[1]) == string.sub("voxel", 1, string.len(arguments[1])) then
				return sethiddenproperty(Lighting, "Technology", Enum.Technology.Voxel)
			elseif string.lower(arguments[1]) == string.sub("compatibility", 1, string.len(arguments[1])) then
				return sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
			end
		else
			return coroutine.wrap(notify)("Your exploit does not support 'sethiddenproperty'.")
		end
		return coroutine.wrap(notify)(string.format("Unknown Technology: %s", arguments[1]))
	end,
}

plugin.Commands["blockreach"] = {
	ListName = "blockreach [distance]",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		local RunService = game:GetService("RunService")
		local Character = speaker.Character
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		local BackpackItem = Character:FindFirstChildWhichIsA("Tool")
		local Handle = BackpackItem:FindFirstChild("Handle")

		if arguments[1] and typeof(arguments[1]) == "string" and tonumber(arguments[1]) then
			arguments[1] = tonumber(arguments[1])

			Humanoid:UnequipTools()
			RunService.Stepped:Wait()
			local SelectionBox = Instance.new("SelectionBox")
			SelectionBox.Name = "SelectionBox"
			SelectionBox.Color3 = Color3.fromRGB(255, 255, 255)
			SelectionBox.LineThickness = 0.05
			SelectionBox.Adornee = Handle

			BackpackItem.Equipped:Connect(function()
				SelectionBox.Adornee = Handle
			end)

			BackpackItem.Unequipped:Connect(function()
				SelectionBox.Adornee = nil
			end)

			Handle.Anchored = false
			Handle.CanCollide = false
			Handle.Massless = true
			Handle.Size = Vector3.new(arguments[1], arguments[1], arguments[1])
			RunService.Stepped:Wait()
			Humanoid:EquipTool(BackpackItem)
			Humanoid.PlatformStand = false
		end
	end,
}

plugin.Commands["lockvelocity"] = {
	ListName = "lockvelocity",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		getgenv().shawnjbragdon["velocitylock"] = game:GetService("RunService").Stepped:Connect(function()
			if speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid") then
				local Character = speaker.Character
				local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
				Humanoid.AutoRotate = false
				if Humanoid.RootPart then
					Humanoid.RootPart.Velocity = Vector3.new(0, 0, 0)
					Humanoid.RootPart.RotVelocity = Vector3.new(0, 0, 0)
				end
			end
		end)
	end,
}

plugin.Commands["unlockvelocity"] = {
	ListName = "unlockvelocity / releasevelocity",
	Description = "",
	Aliases = { "releasevelocity" },
	Function = function(arguments, speaker)
		for index, value in pairs(getgenv().shawnjbragdon) do
			if value and typeof(value) == "RBXScriptConnection" and tostring(index) == "velocitylock" then
				value:Disconnect()
			end
		end
		if speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid") then
			speaker.Character:FindFirstChildWhichIsA("Humanoid").AutoRotate = true
		end
	end,
}

plugin.Commands["forcemouseiconbehavior"] = {
	ListName = "forcemouseiconbehavior",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		local UserInputService = game:GetService("UserInputService")
		if string.lower(arguments[1]) == string.lower("hide", 1, string.len(arguments[1])) then
			UserInputService.ForceMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
			return
		elseif string.lower(arguments[1]) == string.lower("show", 1, string.len(arguments[1])) then
			UserInputService.ForceMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
			return
		end
		return notify("Invalid mouse icon behavior.")
	end,
}

plugin.Commands["proximityprompts"] = {
	ListName = "proximityprompts",
	Description = "Fire all ProximityPrompt Instances in the Workspace.",
	Aliases = {},
	Function = function(arguments, speaker)
		if fireproximityprompt and typeof(fireproximityprompt) == "function" then
			for index, value in pairs(workspace:GetDescendants()) do
				if value:IsA("ProximityPrompt") then
					fireproximityprompt(value)
				end
			end
			return true
		end
		return coroutine.wrap(notify)("Your exploit does not support 'fireproximityprompt'.")
	end,
}

plugin.Commands["cameraoffset"] = {
	ListName = "cameraoffset / camoffset [x y z]",
	Description = "",
	Aliases = { "camoffset" },
	Function = function(arguments, speaker)
		local Character = speaker.Character
		local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
		for index, value in pairs(arguments) do
			_, arguments[index] = pcall(tonumber, value)
		end
		if #arguments > 3 then
			return coroutine.wrap(notify)("Too many arguments.")
		end
		Humanoid.CameraOffset = Vector3.new(unpack(arguments))
	end,
}

plugin.Commands["qualitylevel"] = {
	ListName = "qualitylevel",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		local RenderSettings = game:GetService("RenderSettings")
		if arguments[1] and typeof(arguments[1]) == "number" then
			RenderSettings.QualityLevel = Enum.QualityLevel[string.format("Level%s", tostring(arguments[1]))]
		elseif arguments[1] and typeof(arguments[1]) == "string" then
			if string.lower(arguments[1]) == string.lower(string.sub("automatic", 1, string.len(arguments[1]))) then
				RenderSettings.QualityLevel = Enum.QualityLevel.Automatic
			elseif string.lower(arguments[1]) == string.lower(string.sub("maximum", 1, string.len(arguments[1]))) then
				RenderSettings.QualityLevel = Enum.QualityLevel.Level21
			elseif string.lower(arguments[1]) == string.lower(string.sub("minimum", 1, string.len(arguments[1]))) then
				RenderSettings.QualityLevel = Enum.QualityLevel.Level01
			end
		end
	end,
}

plugin.Commands["antifling"] = {
	ListName = "antifling",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		local StarterPlayer = game:GetService("StarterPlayer")
		local RunService = game:GetService("RunService")
		for index, value in pairs(getgenv().shawnjbragdon) do
			if value and typeof(value) == "RBXScriptConnection" and tostring(index) == "antifling" then
				value:Disconnect()
			end
		end
		getgenv().shawnjbragdon["antifling"] = RunService.Stepped:Connect(function()
			for _, Player in pairs(Players:GetPlayers()) do
				if Player.Character and Player.Character:IsDescendantOf(workspace) then
					for _, BasePart in pairs(Player.Character:GetDescendants()) do
						if BasePart:IsA("BasePart") then
							BasePart.CanCollide = false
						end
					end
				end
			end
		end)
		coroutine.wrap(notify)("Anti-fling Enabled.")
	end,
}

plugin.Commands["noantifling"] = {
	ListName = "noantifling / unantifling",
	Description = "",
	Aliases = {},
	Function = function(arguments, speaker)
		for index, value in pairs(getgenv().shawnjbragdon) do
			if value and typeof(value) == "RBXScriptConnection" and tostring(index) == "antifling" then
				value:Disconnect()
			end
		end
		coroutine.wrap(notify)("Anti-fling Disabled.")
	end,
}

return plugin
