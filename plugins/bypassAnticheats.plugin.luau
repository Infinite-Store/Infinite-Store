local OriginalSettings = {
	Player = {
		Ws = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed,
		Jp = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower,
	},
}

local Plugin = {
	["PluginName"] = "Bypass Anticheats",
	["PluginDescription"] = "",
	["Commands"] = {
		["bypasswalkspeed"] = {
			["ListName"] = "bypasswalkspeed / bws",
			["Description"] = "Bypass WalkSpeed on Most Games",
			["Aliases"] = { "bws" },
			["Function"] = function(args, speaker)
				local oldspeed = OriginalSettings.Player.Ws or 16
				local getrawmt = (debug and debug.getmetatable) or getrawmetatable
				local setReadOnly = setreadonly
					or (
						make_writeable
						and function(table, readonly)
							if readonly then
								make_readonly(table)
							else
								make_writeable(table)
							end
						end
					)
				local lp = game:GetService("Players").LocalPlayer
				local meta = getrawmt(game)
				local caller = checkcaller or is_protosmasher_caller
				local index = meta.__index
				local newindex = meta.__newindex
				local namecall = meta.__namecall
				setReadOnly(meta, false)
				meta.__namecall = newcclosure(function(self, ...)
					local method = getnamecallmethod()
					local args = { ... }
					if method == string.lower("fireserver") and args[1] == "WalkSpeed" then
						return oldspeed
					end
					return namecall(self, ...)
				end)
				setReadOnly(meta, true)
			end,
		},
		["bypassjumppower"] = {
			["ListName"] = "bypassjumppower / bjp",
			["Description"] = "Bypass JumpPower on Most Games",
			["Aliases"] = { "bjp" },
			["Function"] = function(args, speaker)
				local oldpower = OriginalSettings.Player.Js or 50
				local getrawmt = (debug and debug.getmetatable) or getrawmetatable
				local setReadOnly = setreadonly
					or (
						make_writeable
						and function(table, readonly)
							if readonly then
								make_readonly(table)
							else
								make_writeable(table)
							end
						end
					)
				local lp = game:GetService("Players").LocalPlayer
				local meta = getrawmt(game)
				local caller = checkcaller or is_protosmasher_caller
				local index = meta.__index
				local newindex = meta.__newindex
				local namecall = meta.__namecall
				setReadOnly(meta, false)
				meta.__namecall = newcclosure(function(self, ...)
					local method = getnamecallmethod()
					local args = { ... }
					if method == string.lower("fireserver") and args[1] == "JumpPower" then
						return oldpower
					end
					return namecall(self, ...)
				end)
				setReadOnly(meta, true)
			end,
		},
		["bypassteleport"] = {
			["ListName"] = "bypassteleport / btp",
			["Description"] = "Bypass Teleportation on Most Games",
			["Aliases"] = { "btp" },
			["Function"] = function(args, speaker)
				local getrawmt = (debug and debug.getmetatable) or getrawmetatable
				local setReadOnly = setreadonly
					or (
						make_writeable
						and function(table, readonly)
							if readonly then
								make_readonly(table)
							else
								make_writeable(table)
							end
						end
					)
				local lp = game:GetService("Players").LocalPlayer
				local meta = getrawmt(game)
				local caller = checkcaller or is_protosmasher_caller
				local index = meta.__index
				local newindex = meta.__newindex
				local namecall = meta.__namecall
				setReadOnly(meta, false)
				meta.__newindex = newcclosure(function(self, meme, value)
					if caller() then
						return newindex(self, meme, value)
					end
					if
						tostring(self) == "HumanoidRootPart"
						or tostring(self) == "Torso"
						or tostring(self) == "UpperTorso"
					then
						if meme == "CFrame" or meme == "Position" then
							return true
						end
					end
					return newindex(self, meme, value)
				end)
				setReadOnly(meta, true)
			end,
		},
		["bypasskick"] = {
			["ListName"] = "bypasskick / bk",
			["Description"] = "Bypass Kick on Most Games",
			["Aliases"] = { "bk" },
			["Function"] = function(args, speaker)
				local getrawmt = (debug and debug.getmetatable) or getrawmetatable
				local setReadOnly = setreadonly
					or (
						make_writeable
						and function(table, readonly)
							if readonly then
								make_readonly(table)
							else
								make_writeable(table)
							end
						end
					)
				local meta = getrawmt(game)
				local namecall = meta.__namecall
				setReadOnly(meta, false)
				meta.__namecall = newcclosure(function(self, ...)
					local method = getnamecallmethod()
					if method == "Kick" then
						return wait(9e9)
					end
					return namecall(self, ...)
				end)
				setReadOnly(meta, true)
			end,
		},
	},
}
return Plugin
