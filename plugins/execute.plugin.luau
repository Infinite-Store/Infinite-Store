local exec = {
	["PluginName"] = "Executor",
	["PluginDescription"] = "Basic script executor",
	["Commands"] = {
		["execute"] = {
			["ListName"] = "execute / exec / script / s",
			["Description"] = "Execute a string",
			["Aliases"] = { "exec", "script", "s" },
			["Function"] = function(args, speaker)
				-- ;execute print("hi mom")
				loadstring(getstring(1))()
			end,
		},
	},
}
return exec
