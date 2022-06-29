print("created by BugNugg3t#9221 & aqua shits#4320")
local Plugin = {
	["PluginName"] = "MultiSkid",
	["PluginDescription"] = "A one-plugin skid-all solution for skids.",
	["Commands"] = {
		["sharkbite"] = {
			["ListName"] = "sharkbite",
			["Description"] = "Loads a SharkBite GUI.",
			["Aliases"] = { "sharkbitescript" },
			["Function"] = function(args, speaker)
				loadstring(game:GetObjects("rbxassetid://3623753581")[1].Source)()
			end,
		},

		["prisonlife"] = {
			["ListName"] = "prisonlife",
			["Description"] = "Loads Vynixu's Prison Life GUI.",
			["Aliases"] = { "prisonlife" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet(
						"https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Prison%20Life"
					)
				)()
			end,
		},
		["musclelegends"] = {
			["ListName"] = "musclelegends",
			["Description"] = "Loads Cypher's Muscle Legends GUI.",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/MuscleLegends.lua")
				)()
			end,
		},
		["beeswarmsim"] = {
			["ListName"] = "beeswarmsim",
			["Description"] = "Loads a Bee Swarm Simulator GUI.",
			["Aliases"] = { "beeswarm" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/Lua/main/kocmoc.lua"))()
			end,
		},
		["petsimx"] = {
			["ListName"] = "petsimx",
			["Description"] = "Loads the DHX Pet Simulator X GUI.",
			["Aliases"] = { "psx" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/si1nnx/psxx/main/g"))()
			end,
		},
		["mm2"] = {
			["ListName"] = "mm2",
			["Description"] = "Loads Vynixu's MM2 GUI.",
			["Aliases"] = { "murdermystery2" },
			["Function"] = function(args, speaker)
				loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
			end,
		},
		["phantomforces"] = {
			["ListName"] = "phantomforces",
			["Description"] = "Loads a Phantom Forces auto farm GUI.",
			["Aliases"] = { "pf" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet(
						"https://raw.githubusercontent.com/artemking4/PhantomForcesAutoFarm/main/pf_autofarm.lua"
					)
				)()
			end,
		},
		["arsenal"] = {
			["ListName"] = "arsenal",
			["Description"] = "Loads the VGHub Arsenal GUI.",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
			end,
		},
		["piggy"] = {
			["ListName"] = "piggy",
			["Description"] = "Loads Vynixu's Piggy GUI.",
			["Aliases"] = { "pig" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Piggy/Piggy"))()
			end,
		},
		["BABFT"] = {
			["ListName"] = "babft",
			["Description"] = "Loads Vynixu's Build A Boat for Treasure GUI.",
			["Aliases"] = { "buildaboat" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet(
						"https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Build%20A%20Boat%20For%20Treasure/BABFT"
					)
				)()
			end,
		},
		["AnimeFightingSimulator"] = {
			["ListName"] = "AnimeFightingSimulator",
			["Description"] = "Loads an Anime Fighting Simulator GUI.",
			["Aliases"] = { "AFS" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet("https://raw.githubusercontent.com/Jaaaaay2/MahScriptHub/master/AFS%20Remastered")
				)()
			end,
		},
		["cattoware"] = {
			["ListName"] = "cattoware",
			["Description"] = "Loads Cattoware, a generic cheat hub.",
			["Aliases"] = { "cat" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://cattoware.xyz/script.lua"))()
			end,
		},
		["LumberTycoon2"] = {
			["ListName"] = "LumberTycoon2",
			["Description"] = "Loads Ancestor, a Lumber Tycoon 2 script.",
			["Aliases"] = { "LT2", "Ancestor" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkXRBLX/LT2/main/Ancestor"))(
					"We Return ;)"
				)
			end,
		},
		["Jailbreak"] = {
			["ListName"] = "Jailbreak",
			["Description"] = "Loads a Jailbreak cheat GUI.",
			["Aliases"] = { "JB" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet(
						"https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1"
					)
				)()
			end,
		},
		["BrokenBonesIV"] = {
			["ListName"] = "brokenbonesiv",
			["Description"] = "Loads a Broken Bones IV autofarm.",
			["Aliases"] = { "BBIV" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://pastebin.com/raw/88dtVkyR"))()
			end,
		},
		["ShindoLife"] = {
			["ListName"] = "ShindoLife",
			["Description"] = "Loads a Shindo Life GUI.",
			["Aliases"] = { "SL" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub"))()
			end,
		},
		["CarCrushers"] = {
			["ListName"] = "CarCrushers",
			["Description"] = "Loads a Car Crusher autofarm.",
			["Aliases"] = { "CC" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/CarCrushers.lua"))()
			end,
		},
		["KnifeAbilityTest"] = {
			["ListName"] = "KnifeAbilityTest",
			["Description"] = "Loads a KAT GUI.",
			["Aliases"] = { "KAT" },
			["Function"] = function(args, speaker)
				loadstring(game:HttpGet("https://pastebin.com/raw/78kG7trR", true))()
			end,
		},
		["FleeTheFacility"] = {
			["ListName"] = "FleeTheFacility",
			["Description"] = "Loads a Flee The Facility GUI.",
			["Aliases"] = { "FTF" },
			["Function"] = function(args, speaker)
				loadstring(
					game:HttpGet("https://raw.githubusercontent.com/khoaScript/scripts/master/flee-the-facility.lua")
				)()
			end,
		},
	},
}
return Plugin
