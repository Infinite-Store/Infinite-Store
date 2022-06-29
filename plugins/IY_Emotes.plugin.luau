local animations = {
	["Around Town"] = 3303391864,
	["Top Rock"] = 3361276673,
	["Fashionable"] = 3333331310,
	["Robot"] = 3338025566,
	["Twirl"] = 3334968680,
	["Jacks"] = 3338066331,
	["T"] = 3338010159,
	["Shy"] = 3337978742,
	["Monkey"] = 3333499508,
	["Borock's Rage"] = 3236842542,
	["Ud'zal's Summoning"] = 3303161675,
	["Hype Dance"] = 3695333486,
	["Godlike"] = 3337994105,
	["Swoosh"] = 3361481910,
	["Sneaky"] = 3334424322,
	["Side to Side"] = 3333136415,
	["Greatest"] = 3338042785,
	["Louder"] = 3338083565,
	["Beckon"] = 5230598276,
	["Bored"] = 5230599789,
	["Cower"] = 4940563117,
	["Tantrum"] = 5104341999,
	["Hero Landing"] = 5104344710,
	["Confused"] = 4940561610,
	["Jumping Wave"] = 4940564896,
	["Keeping Time"] = 4555808220,
	["Agree"] = 4841397952,
	["Power Blast"] = 4841403964,
	["Disagree"] = 4841401869,
	["Sleep"] = 4686925579,
	["Sad"] = 4841407203,
	["Happy"] = 4841405708,
	["Chicken Dance"] = 4841399916,
	["Bunny Hop"] = 4641985101,
	["Air Dance"] = 4555782893,
	["Curtsy"] = 4555816777,
	["Zombie"] = 4210116953,
	["Fast Hands"] = 4265701731,
	["Baby Dance"] = 4265725525,
	["Celebrate"] = 3338097973,
	["Fancy Feet"] = 3333432454,
	["Y"] = 4349285876,
	["Shuffle"] = 4349242221,
	["Bodybuilder"] = 3333387824,
	["Sandwich Dance"] = 4406555273,
	["Dorky Dance"] = 4212455378,
	["Heisman Pose"] = 3695263073,
	["Superhero Reveal"] = 3695373233,
	["Dizzy"] = 3361426436,
	["Get Out"] = 3333272779,
	["Fishing"] = 3334832150,
	["Tree"] = 4049551434,
	["Line Dance"] = 4049037604,
	["Idol"] = 4101966434,
	["Haha"] = 3337966527,
	["Salute"] = 3333474484,
	["Hello"] = 3344650532,
	["Air Guitar"] = 3695300085,
	["Cha Cha"] = 3695322025,
	["Shrug"] = 3334392772,
	["Point2"] = 3344585679,
	["Tilt"] = 3334538554,
	["Stadium"] = 3338055167,
	-- updated emotes
	["Dolphin"] = 5918726674,
	["Applaud"] = 5915693819,
	["Break Dance"] = 5915648917,
	["Jumping Cheer"] = 5895324424,
	["Floss Dance"] = 5917459365,
	["Rock On"] = 5915714366,
	["High Wave"] = 5915690960,
	["Old Town Road Dance"] = 5937560570,
	["Rodeo Dance"] = 5918728267,
	["HOLIDAY Dance"] = 5937558680,
	["Panini Dance"] = 5915713518,
	["Country Line Dance "] = 5915712534,
	--my update
	["hips poppin"] = 6797888062,
	["take me under"] = 6797890377,
	["it ain't my fault"] = 6797891807,
	["rock guitar"] = 6532134724,
	["rock star"] = 6533093212,
	["drum master"] = 6531483720,
	["drum solo"] = 6532839007,
	["samba"] = 6869766175,
	["block partier"] = 6862022283,
	["boxing punch"] = 7202863182,
	["show dem wrists"] = 7198989668,
	["wake up call"] = 7199000883,
	["drummer moves"] = 7422527690,
	["on the outside"] = 7422779536,
	["dancin shoes"] = 7404878500,
	["saturday dance"] = 7422807549,
	["up and down"] = 7422797678,
	["swan dance"] = 7465997989,
	["flowing breeze"] = 7465946930,
	["quiet waves"] = 7465981288,
	["aok"] = 7942885103,
	["cobra arms"] = 7942890105,
	["lasso turn"] = 7942896991,
	--  [""] = 0,
}

--[[
        ["e_"] = {
            ["ListName"] = "e_",
            ["Description"] = "",
            ["Aliases"] = {},
            ["Function"] = function(args, speaker)
                PlayAnim(animations[""])              
            end
        },
]]
function PlayAnim(id)
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	local animtrack = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
	for i, track in pairs(animtrack) do
		track:Stop()
	end
	local plr = game.Players.LocalPlayer
	local hum = plr.Character.Humanoid
	plr.Character.Animate.Disabled = true
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://" .. id
	local loadanim = hum:LoadAnimation(Anim)
	loadanim:Play()
	loadanim:AdjustSpeed(1)
	loadanim.Stopped:Connect(function()
		plr.Character.Animate.Disabled = false
		for i, track in pairs(animtrack) do
			track:Stop()
		end
	end)
end
function StopAnims()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	local animtrack = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
	for i, track in pairs(animtrack) do
		track:Stop()
	end
end

local Plugin = {
	["PluginName"] = "R15 EMOTES",
	["PluginDescription"] = "BOTTOM TEXT",
	["Commands"] = {
		["e_countrylinedance"] = {
			["ListName"] = "e_countryline",
			["Description"] = "Country Line Dance",
			["Aliases"] = { "e_countryline" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Country Line Dance"])
			end,
		},
		["e_paninidance"] = {
			["ListName"] = "e_panini",
			["Description"] = "Panini Dance",
			["Aliases"] = { "e_panini" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Panini Dance"])
			end,
		},
		["e_holidaydance"] = {
			["ListName"] = "e_holiday",
			["Description"] = "Holiday Dance",
			["Aliases"] = { "e_holiday" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["HOLIDAY Dance"])
			end,
		},
		["e_rodeodance"] = {
			["ListName"] = "e_rodeo",
			["Description"] = "Rodeo Dance",
			["Aliases"] = { "e_rodeo" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Rodeo Dance"])
			end,
		},
		["e_oldtownroad"] = {
			["ListName"] = "e_oldtownroad / e_otr",
			["Description"] = "Old Town Road Dance",
			["Aliases"] = { "e_otr" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Old Town Road Dance"])
			end,
		},
		["e_highwave"] = {
			["ListName"] = "e_highwave",
			["Description"] = "High Wave",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["High Wave"])
			end,
		},
		["e_rockon"] = {
			["ListName"] = "e_rockon",
			["Description"] = "Rock On",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Rock On"])
			end,
		},
		["e_flossdance"] = {
			["ListName"] = "e_flossdance / e_floss",
			["Description"] = "Floss Dance",
			["Aliases"] = { "e_floss", "e_flossing" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Floss Dance"])
			end,
		},
		["e_jumpingcheer"] = {
			["ListName"] = "e_jumpingcheer",
			["Description"] = "Jumping Cheer",
			["Aliases"] = { "e_cheer" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Jumping Cheer"])
			end,
		},
		["e_breakdance"] = {
			["ListName"] = "e_breakdance",
			["Description"] = "Break Dance",
			["Aliases"] = { "e_break" },
			["Function"] = function(args, speaker)
				PlayAnim(animations["Break Dance"])
			end,
		},
		["e_applaud"] = {
			["ListName"] = "e_applaud",
			["Description"] = "Applaud",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Applaud"])
			end,
		},
		["e_dolphin"] = {
			["ListName"] = "e_dolphin",
			["Description"] = "Dolphin",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Dolphin"])
			end,
		},
		["e_aroundtown"] = {
			["ListName"] = "e_aroundtown",
			["Description"] = "Around Town",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Around Town"])
			end,
		},
		["e_toprock"] = {
			["ListName"] = "e_toprock",
			["Description"] = "Top Rock",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Top Rock"])
			end,
		},
		["e_fashionable"] = {
			["ListName"] = "e_fashionable",
			["Description"] = "Fashionable",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Fashionable"])
			end,
		},
		["e_robot"] = {
			["ListName"] = "e_robot",
			["Description"] = "Robot",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Robot"])
			end,
		},
		["e_twirl"] = {
			["ListName"] = "e_twirl",
			["Description"] = "Twirl",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Twirl"])
			end,
		},
		["e_jacks"] = {
			["ListName"] = "e_jacks",
			["Description"] = "Jacks",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Jacks"])
			end,
		},
		["e_t"] = {
			["ListName"] = "e_t",
			["Description"] = "T",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["T"])
			end,
		},
		["e_shy"] = {
			["ListName"] = "e_shy",
			["Description"] = "Shy",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Shy"])
			end,
		},
		["e_monkey"] = {
			["ListName"] = "e_monkey",
			["Description"] = "Monkey",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Monkey"])
			end,
		},
		["e_borocksrage"] = {
			["ListName"] = "e_borocksrage",
			["Description"] = "Borock's Rage",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Borock's Rage"])
			end,
		},
		["e_udzalsummoning"] = {
			["ListName"] = "e_udzalsummoning",
			["Description"] = "Ud'zal's Summoning",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Ud'zal's Summoning"])
			end,
		},
		["e_hype"] = {
			["ListName"] = "e_hype",
			["Description"] = "Hype Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Hype Dance"])
			end,
		},
		["e_godlike"] = {
			["ListName"] = "e_godlike",
			["Description"] = "GodLike",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Godlike"])
			end,
		},
		["e_swoosh"] = {
			["ListName"] = "e_swoosh",
			["Description"] = "Swoosh",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Swoosh"])
			end,
		},
		["e_sneaky"] = {
			["ListName"] = "e_sneaky",
			["Description"] = "Sneaky",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Sneaky"])
			end,
		},
		["e_sidetoside"] = {
			["ListName"] = "e_sidetoside",
			["Description"] = "Side to side",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Side to Side"])
			end,
		},
		["e_greatest"] = {
			["ListName"] = "e_greatest",
			["Description"] = "Greatest",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Greatest"])
			end,
		},
		["e_louder"] = {
			["ListName"] = "e_louder",
			["Description"] = "Louder",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Louder"])
			end,
		},
		["e_beckon"] = {
			["ListName"] = "e_beckon",
			["Description"] = "Beckon",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Beckon"])
			end,
		},
		["e_bored"] = {
			["ListName"] = "e_bored",
			["Description"] = "Bored",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Bored"])
			end,
		},
		["e_cower"] = {
			["ListName"] = "e_cower",
			["Description"] = "Cower",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Cower"])
			end,
		},
		["e_tantrum"] = {
			["ListName"] = "e_tantrum",
			["Description"] = "Tantrum",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Tantrum"])
			end,
		},
		["e_herolanding"] = {
			["ListName"] = "e_herolanding",
			["Description"] = "Hero Landing",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Hero Landing"])
			end,
		},
		["e_confused"] = {
			["ListName"] = "e_confused",
			["Description"] = "Confused",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Confused"])
			end,
		},
		["e_jumpingwave"] = {
			["ListName"] = "e_jumpingwave",
			["Description"] = "Jumping Wave",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Jumping Wave"])
			end,
		},
		["e_keepingtime"] = {
			["ListName"] = "e_keepingtime",
			["Description"] = "Keeping Time",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Keeping Time"])
			end,
		},
		["e_agree"] = {
			["ListName"] = "e_agree",
			["Description"] = "Agree",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Agree"])
			end,
		},
		["e_powerblast"] = {
			["ListName"] = "e_powerblast",
			["Description"] = "Power Blast",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Power Blast"])
			end,
		},
		["e_disagree"] = {
			["ListName"] = "e_disagree",
			["Description"] = "Disagree",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Disagree"])
			end,
		},
		["e_sleep"] = {
			["ListName"] = "e_sleep",
			["Description"] = "Sleep",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Sleep"])
			end,
		},
		["e_sad"] = {
			["ListName"] = "e_sad",
			["Description"] = "Sad",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Sad"])
			end,
		},
		["e_happy"] = {
			["ListName"] = "e_happy",
			["Description"] = "Happy",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Happy"])
			end,
		},
		["e_chicken"] = {
			["ListName"] = "e_chicken",
			["Description"] = "Chicken Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Chicken Dance"])
			end,
		},
		["e_bunnyhop"] = {
			["ListName"] = "e_bunnyhop",
			["Description"] = "Bunny Hop",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Bunny Hop"])
			end,
		},
		["e_air"] = {
			["ListName"] = "e_air",
			["Description"] = "Air Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Air Dance"])
			end,
		},
		["e_curtsy"] = {
			["ListName"] = "e_curtsy",
			["Description"] = "Curtsy",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Curtsy"])
			end,
		},
		["e_zombie"] = {
			["ListName"] = "e_zombie",
			["Description"] = "Zombie",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Zombie"])
			end,
		},
		["e_fasthands"] = {
			["ListName"] = "e_fasthands",
			["Description"] = "Fast Hands",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Fast Hands"])
			end,
		},
		["e_baby"] = {
			["ListName"] = "e_baby",
			["Description"] = "Baby Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Baby Dance"])
			end,
		},
		["e_celebrate"] = {
			["ListName"] = "e_celebrate",
			["Description"] = "Celebrate",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Celebrate"])
			end,
		},
		["e_fancyfeet"] = {
			["ListName"] = "e_fancyfeet",
			["Description"] = "Fancy Feet",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Fancy Feet"])
			end,
		},
		["e_y"] = {
			["ListName"] = "e_y",
			["Description"] = "Y",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Y"])
			end,
		},
		["e_shuffle"] = {
			["ListName"] = "e_shuffle",
			["Description"] = "Shuffle",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Shuffle"])
			end,
		},
		["e_bodybuilder"] = {
			["ListName"] = "e_bodybuilder",
			["Description"] = "Bodybuilder",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Bodybuilder"])
			end,
		},
		["e_sandwich"] = {
			["ListName"] = "e_sandwich",
			["Description"] = "Sandwich Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Sandwich Dance"])
			end,
		},
		["e_dorky"] = {
			["ListName"] = "e_dorky",
			["Description"] = "Dorky Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Dorky Dance"])
			end,
		},
		["e_heisman"] = {
			["ListName"] = "e_heisman",
			["Description"] = "Heisman Pose",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Heisman Pose"])
			end,
		},
		["e_superhero"] = {
			["ListName"] = "e_superhero",
			["Description"] = "Superhero Reveal",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Superhero Reveal"])
			end,
		},
		["e_dizzy"] = {
			["ListName"] = "e_dizzy",
			["Description"] = "Dizzy",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Dizzy"])
			end,
		},
		["e_getout"] = {
			["ListName"] = "e_getout",
			["Description"] = "Get Out",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Get Out"])
			end,
		},
		["e_fishing"] = {
			["ListName"] = "e_fishing",
			["Description"] = "Fishing",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Fishing"])
			end,
		},
		["e_tree"] = {
			["ListName"] = "e_tree",
			["Description"] = "Tree",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Tree"])
			end,
		},
		["e_line"] = {
			["ListName"] = "e_line",
			["Description"] = "Line Dance",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Line Dance"])
			end,
		},
		["e_idol"] = {
			["ListName"] = "e_idol",
			["Description"] = "Idol",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Idol"])
			end,
		},
		["e_haha"] = {
			["ListName"] = "e_haha",
			["Description"] = "Haha",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Haha"])
			end,
		},
		["e_salute"] = {
			["ListName"] = "e_salute",
			["Description"] = "Salute",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Salute"])
			end,
		},
		["e_hello"] = {
			["ListName"] = "e_hello",
			["Description"] = "Hello",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Hello"])
			end,
		},
		["e_airguitar"] = {
			["ListName"] = "e_airguitar",
			["Description"] = "Air Guitar",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Air Guitar"])
			end,
		},
		["e_chacha"] = {
			["ListName"] = "e_chacha",
			["Description"] = "Cha Cha",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Cha Cha"])
			end,
		},
		["e_shrug"] = {
			["ListName"] = "e_shrug",
			["Description"] = "Shrug",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Shrug"])
			end,
		},
		["e_point2"] = {
			["ListName"] = "e_point2",
			["Description"] = "Point2",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Point2"])
			end,
		},
		["e_tilt"] = {
			["ListName"] = "e_tilt",
			["Description"] = "Tilt",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Tilt"])
			end,
		},
		["e_stadium"] = {
			["ListName"] = "e_stadium",
			["Description"] = "Stadium",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["Stadium"])
			end,
		},
		["e_hipspoppin"] = {
			["ListName"] = "e_hipspoppin",
			["Description"] = "hips poppin",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["hips poppin"])
			end,
		},
		["e_takemeunder"] = {
			["ListName"] = "e_takemeunder",
			["Description"] = "take me under",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["take me under"])
			end,
		},
		["e_itaintmyfault"] = {
			["ListName"] = "e_itaintmyfault",
			["Description"] = "it ain't my fault",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["it ain't my fault"])
			end,
		},
		["e_rockguitar"] = {
			["ListName"] = "e_rockguitar",
			["Description"] = "rock guitar",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["rock guitar"])
			end,
		},
		["e_rockstar"] = {
			["ListName"] = "e_rockstar",
			["Description"] = "rock star",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["rock star"])
			end,
		},
		["e_drummaster"] = {
			["ListName"] = "e_drummaster",
			["Description"] = "drum master",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["drum master"])
			end,
		},
		["e_drumsolo"] = {
			["ListName"] = "e_drumsolo",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["drum solo"])
			end,
		},
		["e_samba"] = {
			["ListName"] = "e_samba",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["samba"])
			end,
		},
		["e_blockpartier"] = {
			["ListName"] = "e_blockpartier",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["block partier"])
			end,
		},
		["e_boxingpunch"] = {
			["ListName"] = "e_boxingpunch",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["boxing punch"])
			end,
		},
		["e_showdemwrists"] = {
			["ListName"] = "e_showdemwrists",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["show dem wrists"])
			end,
		},
		["e_wakeupcall"] = {
			["ListName"] = "e_wakeupcall",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["wake up call"])
			end,
		},
		["e_drummermoves"] = {
			["ListName"] = "e_drummermoves",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["drummer moves"])
			end,
		},
		["e_ontheoutside"] = {
			["ListName"] = "e_ontheoutside",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["on the outside"])
			end,
		},
		["e_dancinshoes"] = {
			["ListName"] = "e_dancinshoes",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["dancin shoes"])
			end,
		},
		["e_saturdaydance"] = {
			["ListName"] = "e_saturdaydance",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["saturday dance"])
			end,
		},
		["e_upanddown"] = {
			["ListName"] = "e_upanddown",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["up and down"])
			end,
		},
		["e_swandance"] = {
			["ListName"] = "e_swandance",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["swan dance"])
			end,
		},
		["e_flowingbreeze"] = {
			["ListName"] = "e_flowingbreeze",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["flowing breeze"])
			end,
		},
		["e_quietwaves"] = {
			["ListName"] = "e_quietwaves",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["quiet waves"])
			end,
		},
		["e_aok"] = {
			["ListName"] = "e_aok",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["aok"])
			end,
		},
		["e_cobraarms"] = {
			["ListName"] = "e_cobraarms",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["cobra arms"])
			end,
		},
		["e_lassoturn"] = {
			["ListName"] = "e_lassoturn",
			["Description"] = "",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				PlayAnim(animations["lasso turn"])
			end,
		},
		["e_stopanim"] = {
			["ListName"] = "e_stopanim / noemotes / stopemotes",
			["Description"] = "stop all animation",
			["Aliases"] = { "noemotes", "stopemotes" },
			["Function"] = function(args, speaker)
				StopAnims()
			end,
		},
	},
}
return Plugin
