local Plugin = {
	["PluginName"] = "Spawn Location Team Changer GUI",
	["PluginDescription"] = "Made by Thomas_Cornez, misrepresenting",
	["Commands"] = {
		["TeamGUI"] = {
			["ListName"] = "TeamGUI / loadteamgui",
			["Description"] = "Toggle the team gui",
			["Aliases"] = { "loadteamgui" },
			["Function"] = function()
				if not getgenv().GUI then
					getgenv().GUI = loadstring(
						game:HttpGet("https://raw.githubusercontent.com/misrepresenting/Team-Changer/main/Main.lua")
					)()
				else
					getgenv().GUI.Enabled = not getgenv().GUI.Enabled
				end
			end,
		},
	},
}
return Plugin

-- Made by Thomas_Cornez#0272 and misrepresenting#4917
