local Plugin = {
	["PluginName"] = "FE Skateboard",
	["PluginDescription"] = "Use the cold stare skateboard to use a skateboard in most games.",
	["Commands"] = {
		["skateboard"] = {
			["ListName"] = "skateboard",
			["Description"] = "Gives you a skateboard based of mainly the cold stare skateboard",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				--[[
________  ________  ___  ___  ________  _______   ________  ___  __    ________  _________  _______      
|\   ____\|\   __  \|\  \|\  \|\   ____\|\  ___ \ |\   ____\|\  \|\  \ |\   __  \|\___   ___\\  ___ \    
\ \  \___|\ \  \|\  \ \  \\\  \ \  \___|\ \   __/|\ \  \___|\ \  \/  /|\ \  \|\  \|___ \  \_\ \   __/|    
\ \_____  \ \   __  \ \  \\\  \ \  \    \ \  \_|/_\ \_____  \ \   ___  \ \   __  \   \ \  \ \ \  \_|/__  
 \|____|\  \ \  \ \  \ \  \\\  \ \  \____\ \  \_|\ \|____|\  \ \  \\ \  \ \  \ \  \   \ \  \ \ \  \_|\ \
   ____\_\  \ \__\ \__\ \_______\ \_______\ \_______\____\_\  \ \__\\ \__\ \__\ \__\   \ \__\ \ \_______\
  |\_________\|__|\|__|\|_______|\|_______|\|_______|\_________\|__| \|__|\|__|\|__|    \|__|  \|_______|
  \|_________|                                      \|_________|                                                                            
]]
				--

				SKATEBOARD_HAT = "COLDSTARESKATEBOARD"
				AUTOCHOOSE = false

				SPEED = 32
				JUMP = 41
				ACCELERATION = 0.4
				STEERABILITY = 0.7
				GRIP = 0

				OFFSET = CFrame.Angles(math.rad(-90), math.rad(0), math.rad(45))
				HOLD_OFFSET = CFrame.Angles(math.rad(0), math.rad(80), math.rad(45))

				loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/sauceskate.lua"))()
			end,
		},
	},
}
return Plugin
