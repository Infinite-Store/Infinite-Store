local Store = {}

local HttpService = game:GetService("HttpService")
local Trademark = "A place where you can get every Infinite Yield plugin"
local InviteCode = "mVzBU7GTMy"

local reqenv = function() return (getgenv() or _G) end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or reqenv().request or request

Store.PluginName = "Infinite Store"
Store.PluginDescription = Trademark
Store.Commands = {}

Store.Commands["infinitestore"] = {
	["ListName"] = ("infinitestore"),
	["Description"] = Trademark,
	["Aliases"] = {},
	["Function"] = function(args, speaker)
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/main.lua"), true))()
	end
}

Store.Commands["inviteme"] = {
	["ListName"] = ("inviteme / isInvite"),
	["Description"] = ("Join the Infinite Store Discord"),
	["Aliases"] = {"isInvite"},
	["Function"] = function(args, speaker)
		if not requestfunc then
			notify("Infinite Store", "https://discord.gg/" .. InviteCode)
			print("Infinite Store - " .. "https://discord.gg/" .. InviteCode)
			return
		end
		requestfunc({
			["Url"] = "http://127.0.0.1:6463/rpc?v=1",
			["Method"] = "POST",
			["Headers"] = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com",
			},
			["Body"] = HttpService:JSONEncode({
				["cmd"] = "INVITE_BROWSER",
				["args"] = { ["code"] = InviteCode },
				["nonce"] = HttpService:GenerateGUID(false)
			})
		})
	end
}

return Store
