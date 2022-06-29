-- stylua: ignore
local PluginAPI = loadstring(game:HttpGet("https://pastebin.com/raw/u7HEbm8q"))()
local Plugin = PluginAPI:CreatePlugin("PsyHub", "made by thetoast + Psykek#3180")
Plugin.Functions:AddCommand("psyhub", "psyhub made by Psykek#3180",  "psyhub", {"psyhub"}, function(args,speaker) 
    psyhub(table.concat(args, "loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()"))
end)
return Plugin.PluginTable
