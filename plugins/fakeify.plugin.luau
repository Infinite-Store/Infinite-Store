local Plugin = {
	["PluginName"] = "Fakeify",
	["PluginDescription"] = "Scripted by NoobSploit#0001",
	["Commands"] = {
		["fakeuser"] = {
			["ListName"] = "fakeuser [user]",
			["Description"] = "This is client sided nobody else can see this",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				user = getstring(1)
				game:GetService("Players").LocalPlayer.Name = user
			end,
		},
		["fakeid"] = {
			["ListName"] = "fakeid [ID]",
			["Description"] = "This is client sided nobody else can see this",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				ID = getstring(1)
				game.Players.LocalPlayer.UserId = ID
			end,
		},
		["fakedisplay"] = {
			["ListName"] = "fakedisplay [displayname]",
			["Description"] = "This is client sided nobody else can see this",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				displayname = getstring(1)
				game:GetService("Players").LocalPlayer.DisplayName = displayname
			end,
		},
	},
}
return Plugin
