local Plugin = {
	["PluginName"] = "Plugin Info",
	["PluginDescription"] = "Displays information about your plugin usage.",
	["Commands"] = {
		["plugininfo"] = {
			["ListName"] = "plugininfo / plugins",
			["Description"] = "Displays information about your plugin usage.",
			["Aliases"] = { "plugins" },
			["Function"] = function(args, speaker)
				local pluginInfo = "Loaded plugins: "
				for i, pluginName in pairs(PluginsTable) do
					if i ~= 1 then
						pluginInfo = pluginInfo .. ", "
					end
					pluginInfo = pluginInfo .. pluginName:sub(1, -4)
				end

				if listfiles == nil then
					return notify(pluginInfo)
				end

				local pluginInfo = pluginInfo .. "\nUnloaded plugins: "
				local unloaded = {} -- for formatting with commas properly
				for i, fileName in pairs(listfiles("")) do
					if
						fileName:sub(-3) == ".iy"
						and (
							fileName:lower() ~= "plugin file name"
							and fileName:lower() ~= "iy_fe.iy"
							and fileName ~= "iy_fe"
						)
					then
						if not FindInTable(PluginsTable, fileName) then
							table.insert(unloaded, fileName:sub(1, -4))
						end
					end
				end
				for i, pluginName in pairs(unloaded) do
					if i ~= 1 then
						pluginInfo = pluginInfo .. ", "
					end
					pluginInfo = pluginInfo .. pluginName
				end

				notify(pluginInfo)
			end,
		},
	},
}

return Plugin
