local TohruIsGayForDoomy = false
local faces = { "(・`ω´・)", ";;w;;", "UwU", ">w<", "^w^" }
local Plugin = {
	["PluginName"] = "cutestring()",
	["PluginDescription"] = "Chat's an inputted string, but cutified.",
	["Commands"] = {
		["cutestring"] = {
			["ListName"] = "cutestring [string] / cuteify [string]",
			["Description"] = "makes a string cute",
			["Aliases"] = { "cuteify" },
			["Function"] = function(args, speaker)
				local cutestring = string.gsub(
					string.gsub(
						string.gsub(
							string.gsub(string.gsub(string.gsub(getstring(1), "r", "w"), "R", "W"), "l", "w"),
							"L",
							"W"
						),
						"ove",
						"uv"
					),
					"!",
					" " .. faces[math.random(1, 5)]
				)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
					:FireServer(cutestring, "All")
			end,
		},
		["cutestringtoggle"] = {
			["ListName"] = "cutestringtoggle / cstoggle ",
			["Description"] = "toggles ;cutestring",
			["Aliases"] = { "cstoggle" },
			["Function"] = function(args, speaker)
				TohruIsGayForDoomy = not TohruIsGayForDoomy
				local mt, old = getrawmetatable(game), {}
				local old = {}
				for i, v in next, mt do
					old[i] = v
				end
				setreadonly(mt, false)
				mt.__namecall = newcclosure(function(...)
					local method = getnamecallmethod()
					local args = { ... }
					if method == "FireServer" and args[1].Name == "SayMessageRequest" then
						args[2] = string.gsub(args[2], ".", function(nya)
							if TohruIsGayForDoomy == true then
								return string.gsub(
									string.gsub(
										string.gsub(
											string.gsub(string.gsub(string.gsub(nya, "r", "w"), "R", "W"), "l", "w"),
											"L",
											"W"
										),
										"ove",
										"uv"
									),
									"!",
									" " .. faces[math.random(1, 5)]
								)
							else
								return c
							end
						end)
						return old.__namecall(unpack(args))
					end
					return old.__namecall(...)
				end)
				setreadonly(mt, true)
			end,
		},
	},
}
return Plugin
