return {
	["PluginName"] = "rename",
	["PluginDescription"] = "Scripted by NoobSploit#0001",
	["Commands"] = {
		["rename"] = {
			["ListName"] = "rename [text]",
			["Description"] = "why",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				if args[1] ~= nil then
					Title.Text = getstring(1)
				end
			end,
		},
	},
}
