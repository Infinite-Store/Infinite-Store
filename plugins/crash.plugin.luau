local Plugin = {
	["PluginName"] = "Crasher",
	["PluginDescription"] = "does something",
	["Commands"] = {
		["crash"] = {
			["ListName"] = "crash",
			["Description"] = "fucks up ur roblox game",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				function build()
					local part = Instance.new("Part")
					part.Parent = workspace.blocks
				end

				script.Parent.MouseButton1Click:connect(function()
					while true do
						build()
					end
				end)
			end,
		},
	},
}
return Plugin
