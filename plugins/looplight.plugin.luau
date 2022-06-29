local Plugin = {
	["PluginName"] = "Loop Lighting",
	["PluginDescription"] = "Adds loops for lighting commands.",
	["Commands"] = {
		["loopday"] = {
			["ListName"] = "loopday / lday / ld",
			["Description"] = "Sunshiiiine!",
			["Aliases"] = { "lday", "ld" },
			["Function"] = function(args, speaker)
				if dayLoop then
					dayLoop:Disconnect()
				end
				local function dayFunc()
					game:GetService("Lighting").ClockTime = 14
				end

				dayLoop = game:GetService("RunService").RenderStepped:Connect(dayFunc)
			end,
		},
		["unloopday"] = {
			["ListName"] = "unloopday / unlday / unld",
			["Description"] = "No more sunshine",
			["Aliases"] = { "unlday", "unld" },
			["Function"] = function(args, speaker)
				if dayLoop then
					dayLoop:Disconnect()
				end
			end,
		},
		["loopnight"] = {
			["ListName"] = "loopnight / lnight / ln",
			["Description"] = "Moonlight.",
			["Aliases"] = { "lnight", "ln" },
			["Function"] = function(args, speaker)
				if nightLoop then
					nightLoop:Disconnect()
				end
				local function nightFunc()
					game:GetService("Lighting").ClockTime = 0
				end

				nightLoop = game:GetService("RunService").RenderStepped:Connect(nightFunc)
			end,
		},
		["unloopnight"] = {
			["ListName"] = "unloopnight / unlnight/ unln",
			["Description"] = "No more moonlight.",
			["Aliases"] = { "unlnight", "unln" },
			["Function"] = function(args, speaker)
				if nightLoop then
					nightLoop:Disconnect()
				end
			end,
		},
		["loopnofog"] = {
			["ListName"] = "loopnofog / lnofog / lnf / loopnf",
			["Description"] = "See clearly forever!.",
			["Aliases"] = { "lnofog", "lnf", "loopnf" },
			["Function"] = function(args, speaker)
				if fogLoop then
					fogLoop:Disconnect()
				end
				local function fogFunc()
					game:GetService("Lighting").FogEnd = math.huge
				end

				fogLoop = game:GetService("RunService").RenderStepped:Connect(fogFunc)
			end,
		},
		["unloopnofog"] = {
			["ListName"] = "unloopnofog / unlnofog / unlnf / unloopnf",
			["Description"] = "No more sight.",
			["Aliases"] = { "unlnofog", "unlnf", "unloopnf" },
			["Function"] = function(args, speaker)
				if fogLoop then
					fogLoop:Disconnect()
				end
			end,
		},
	},
}

return Plugin
