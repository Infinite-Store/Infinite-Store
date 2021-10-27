local url = {
	["domain"] = "https://raw.githubusercontent.com",
	["repo"] = "/Infinite-Store/Infinite-Store",
	["dir"] = "/main/plugins/",
}

return {
	--[[
	["example"] = {
		["Name"] = "example", ["Creator"] = "InfiniteStore", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."example.iy", ["Commands"] = {"command1"},
	};
	]]--
	
	["FakeChat"] = {
		["Name"] = "FakeChat", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."FakeChat.iy", ["Commands"] = {"fakechat / fchat [plr] [msg]"},
	};
	
	["Climb"] = {
		["Name"] = "Climb", ["Creator"] = "bowla", ["CreationDate"] = "06/09/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."climb.iy", ["Commands"] = {"climb", "unclimb"},
	};
	
	["DarkDex"] = {
		["Name"] = "DarkDex", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."DarkDex.iy", ["Commands"] = {"darkdex"},
	};
	
	["CamMaker"] = {
		["Name"] = "CamMaker", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."CamMaker.iy", ["Commands"] = {"viewcam / vc [name]", "makecam / mc [name]", "delcam / dc [name]", "listcams / lc", "unviewcam / unvc"},
	};
	
	["Freecam2"] = {
		["Name"] = "Freecam2", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."Freecam2.iy", ["Commands"] = {"freecam2 / fc2", "resetcam2 / rc2"},
	};
	
	["FunGrav"] = {
		["Name"] = "FunGrav", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."FunGrav.iy", ["Commands"] = {"nogravparts", "gravparts", "supergravparts", "invertgravparts", "pushparts", "bombparts", "deleteunanchored / deleteua / cleanua", "moveparts [plr]", "movepartsmouse", "unmoveparts", "setblackhole", "blackhole", "removeblackhole", "stopblackhole", "controlblackhole", "uncontrolblackhole", "bringblackhole", "blackholeplayer [plr]", "unblackholeplayer", "loopsim", "flingparts [plr]", "flinghats [plr]", "unflingparts / unspinparts", "spinparts [plr]", "selectparts", "resetselectedpartslist / rspl", "uselist (TOGGLE)", "spinpartsmouse", "flingpartsmouse", "partscollide (TOGGLE)", "blackholedestroyparts / bhdp (TOGGLE)", "earthquake", "unearthquake", "autoupdate"},
	};
	
	["ReloadIY"] = {
		["Name"] = "ReloadIY", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."Reload.iy", ["Commands"] = {"reload / unload"},
	};
	
	["SLTC"] = {
		["Name"] = "SLTC", ["Creator"] = "Thomas_Cornez", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."SLTC.iy", ["Commands"] = {"TeamGUI / loadteamgui"},
	};
	
	["ShaderMod"] = {
		["Name"] = "ShaderMod", ["Creator"] = "WeAreRump", ["CreationDate"] = "01/29/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."ShaderMod.iy", ["Commands"] = {"toggleshader / ts"},
	};
	
	["ShiftToSprint"] = {
		["Name"] = "ShiftToSprint", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."ShiftToSprint.iy", ["Commands"] = {"sprintspeed [speed]", "noshifttosprint / nsts", "shifttosprint / sts"},
	};
	
	["UnloadIY"] = {
		["Name"] = "UnloadIY", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."Unload.iy", ["Commands"] = {"unload"},
	};
	
	["AddAllPlugins"] = {
		["Name"] = "AddAllPlugins", ["Creator"] = "prisj", ["CreationDate"] = "04/09/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."addallplugins.iy", ["Commands"] = {"addallplugins / aap"},
	};
	
	["AntiFling"] = {
		["Name"] = "AntiFling", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."antifling.iy", ["Commands"] = {"antifling"},
	};
	
	["AntiKill"] = {
		["Name"] = "AntiKill", ["Creator"] = "enville", ["CreationDate"] = " 09/11/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."antikill.iy", ["Commands"] = {"antikill", "unantikill", "tantikill"},
	};
	
	["Beyblade"] = {
		["Name"] = "Beyblade", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."beyblade.iy", ["Commands"] = {"beyblade"},
	};
	
	["BigHead"] = {
		["Name"] = "BigHead", ["Creator"] = "NoobSploit", ["CreationDate"] = "08/10/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."bighead.iy", ["Commands"] = {"bighead/biggest / bigger / big"},
	};
	
	["BigSize"] = {
		["Name"] = "BigSize", ["Creator"] = "Toon", ["CreationDate"] = " 08/16/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."bigsize.iy", ["Commands"] = {"bigsize"},
	};
	
	["BlankSay"] = {
		["Name"] = "BlankSay", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."blanksay.iy", ["Commands"] = {"blanksay / blankchat"},
	};
	
	["BTools2"] = {
		["Name"] = "BTools2", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."btools2.IY", ["Commands"] = {"cycbtools / btools2"},
	};
	
	["BuilderChat"] = {
		["Name"] = "BuilderChat", ["Creator"] = "LuaLighter", ["CreationDate"] = "08/08/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."builderchat.iy", ["Commands"] = {"buildchat / bchat [UrMSG] [BmMSG]"},
	};
	
	["BypassAntiCheat"] = {
		["Name"] = "BypassAntiCheat", ["Creator"] = "Toon", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."bypassAnticheats.iy", ["Commands"] = {"bypasswalkspeed / bws", "bypassjumppower / bjp", "bypassteleport / btp", "bypasskick / bk"},
	};
	
	["Celestial"] = {
		["Name"] = "Celestial", ["Creator"] = "epik", ["CreationDate"] = "09/04/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."celestial.iy", ["Commands"] = {"celestial"},
	};
	
	["ChatSpy"] = {
		["Name"] = "ChatSpy", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."chatspy.iy", ["Commands"] = {"chatspy"},
	};
	
	["ChatTranslate"] = {
		["Name"] = "ChatTranslate", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."chattranslator.iy", ["Commands"] = {"translate [translate chat]"},
	};
	
	["Crash"] = {
		["Name"] = "Crash", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."crash.iy", ["Commands"] = {"crash"},
	};
	
	["CuteString"] = {
		["Name"] = "CuteString", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."cutestring.iy", ["Commands"] = {"cutestring / cuteify [string]"},
	};
	
	["DisplayNameRemover"] = {
		["Name"] = "DisplayNameRemover", ["Creator"] = "ratticus", ["CreationDate"] = "07/22/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."displayNameRemover.iy", ["Commands"] = {"removedisplay / removedisplaynames / nodisplayname / ndn"},
	};
	
	["DragChat"] = {
		["Name"] = "DragChat", ["Creator"] = "Orion", ["CreationDate"] = "04/03/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."draggablechat.iy", ["Commands"] = {"dragchat / dragc"},
	};
	
	["EnableBackPack"] = {
		["Name"] = "EnableBackPack", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."enablebackpack.iy", ["Commands"] = {"enablebackpack"},
	};
	
	["GiveTools"] = {
		["Name"] = "GiveTools", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."givetools.iy", ["Commands"] = {"givetools [plr]"},
	};
	
	["HidePlayers"] = {
		["Name"] = "HidePlayers", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."hidePlayers.iy", ["Commands"] = {"showplrs [name]", "hideplrs [name]"},
	};
	
	["HubLoader"] = {
		["Name"] = "HubLoader", ["Creator"] = "Toon", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."hubloader.iy", ["Commands"] = {"owlhub", "darkhub", "psyhub"},
	};
	
	["InteractESP"] = {
		["Name"] = "InteractESP", ["Creator"] = "ap", ["CreationDate"] = "04/23/2021", ["URL"] = "https://raw.githubusercontent.com/protogens/things-i-ll-probably-use/main/interactable%20objects%20esp%20plugin", ["Commands"] = {"clickdetectoresp / clickesp / cdesp", "proximityesp / promptesp / ppesp", "touchinterestesp / touchesp / tesp", "seatesp / sesp", "unclickdetectoresp / uncdesp", "unproximityesp / unppesp", "untouchinterestesp / untouchesp / untesp", "unseatesp / unsesp"},
	};
	
	["JoinRandomPlace"] = {
		["Name"] = "JoinRandomPlace", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."joinrandomplace.iy", ["Commands"] = {"joinplace [min] [max]"},
	};
	
	["KillSounds"] = {
		["Name"] = "KillSounds", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."killsounds.iy", ["Commands"] = {"killsounds / ks"},
	};
	
	["LagServer"] = {
		["Name"] = "LagServer", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."lag.iy", ["Commands"] = {"lagserver"},
	};
	
	["LofiMusic"] = {
		["Name"] = "LofiMusic", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."lofimusic.iy", ["Commands"] = {"lofimusi / lofigui"},
	};
	
	["Marble"] = {
		["Name"] = "Marble", ["Creator"] = "Unknown", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."marble.iy", ["Commands"] = {"marble [size]"},
	};
	
	["Telekinesis"] = {
		["Name"] = "Telekinesis", ["Creator"] = "Toon", ["CreationDate"] = "05/01/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."tel.iy", ["Commands"] = {"telekinesis / tel"},
	};
	
	["Panda"] = {
		["Name"] = "Panda", ["Creator"] = "epik", ["CreationDate"] = "08/25/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."panda.iy", ["Commands"] = {"panda", "pnda"},
	};

	["TextToEmojis"] = {
		["Name"] = "TextToEmojis", ["Creator"] = "NoobSploit", ["CreationDate"] = "08/31/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."texttoemojis.iy", ["Commands"] = {"texttoemojis"},
	};

	["UnanchoredTeleporter"] = {
		["Name"] = "UnanchoredTeleporter", ["Creator"] = "epik", ["CreationDate"] = "08/25/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."unanchored.iy", ["Commands"] = {"unanchored"},
	};

	["Metahook"] = {
		["Name"] = "Metahook", ["Creator"] = "Toon", ["CreationDate"] = "08/27/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."metahook.iy", ["Commands"] = {"metahook [name] [value]"},
	};

	["ToonESP"] = {
		["Name"] = "ToonESP", ["Creator"] = "Toon", ["CreationDate"] = "Unknown", ["URL"] = url["domain"]..url["repo"]..url["dir"].."toonesp.iy", ["Commands"] = {"toonesp"},
	};

	["Flashlight"] = {
		["Name"] = "Flashlight", ["Creator"] = "Toon", ["CreationDate"] = "07/21/2020", ["URL"] = url["domain"]..url["repo"]..url["dir"].."flashlight.iy", ["Commands"] = {"flashlight"},
	};

	["VR"] = {
		["Name"] = "VR", ["Creator"] = "NoobSploit", ["CreationDate"] = "10/16/2020", ["URL"] = url["domain"]..url["repo"]..url["dir"].."virtualreality.iy", ["Commands"] = {"vr"},
	};

	["LoopLight"] = {
		["Name"] = "LoopLight", ["Creator"] = "FatalSe7en", ["CreationDate"] = "10/20/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."looplight.iy", ["Commands"] = {"loopday / lday / ld", "unloopday / unlday / unld", "loopnight / lnight / ln", "unloopnight / unlnight/ unln", "loopnofog / lnofog / lnf / loopnf", "unloopnofog / unlnofog / unlnf / unloopnf"},
	};
	
	["ClearChat"] = {
		["Name"] = "ClearChat", ["Creator"] = "NoobSploit", ["CreationDate"] = "10/20/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."clearchat.iy", ["Commands"] = {"clearchat / clchat"},
	};
	
	["EarRape"] = {
		["Name"] = "EarRape", ["Creator"] = "NoobSploit", ["CreationDate"] = "10/26/2021", ["URL"] = url["domain"]..url["repo"]..url["dir"].."earrape.iy", ["Commands"] = {"playsounds", "loopplaysounds", "unloopplaysounds", "check"},
	};
}
