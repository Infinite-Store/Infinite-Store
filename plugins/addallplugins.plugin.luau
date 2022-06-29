local PluginAPI = loadstring(game:HttpGet("https://pastebin.com/raw/u7HEbm8q"))()
local Plugin = PluginAPI:CreatePlugin("Add all plugins", "made by prisj")

Plugin.Functions:AddCommand(
	"addallplugins",
	"addallplugins",
	"Adds all avaliable plugins",
	{ "aap" },
	function(args, speaker)
		if not listfiles then
			notify("Incompatible Exploit", "Your exploit does not support this command (missing listfiles)")
			return
		end
		function getPlugins()
			local pluginlist = {}
			for i, v in pairs(listfiles("")) do
				h = v:split(".")
				if h[#h] == "iy" and v:lower() ~= "iy_fe.iy" and v:lower() ~= "iy_fe" and not isfolder(v) then
					pluginlist[#pluginlist + 1] = v
				end
			end
			return pluginlist
		end
		local files = getPlugins()
		for i, file in pairs(files) do
			if not FindInTable(PluginsTable, file) then
				addPlugin(file)
			end
		end
	end
)

return Plugin.PluginTable
