local plugin = {}
plugin.PluginName = "inviteme"
plugin.PluginDescription = "invites you to infinite store"
plugin.Commands = {}
plugin.Commands["inviteme"] = {
	ListName = "inviteme",
	Description = "invites you to infinite store",
	Aliases = {},
	Function = function(args, speaker)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KaizerFox/inviteme/main/invite.lua"))()
	end,
}
return plugin
