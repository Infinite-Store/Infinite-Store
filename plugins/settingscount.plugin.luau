task.defer(function()
	local hf = hookfunction or function() end
	Plugins.ButtonLabel.Text = "Manage Plugins" .. " (x" .. #PluginsTable .. ")"
	Aliases.ButtonLabel.Text = "Edit Aliases" .. " (x" .. #aliases .. ")"
	Positions.ButtonLabel.Text = "Edit/Goto Waypoints" .. " (x" .. #WayPoints .. ")"
	Keybinds.ButtonLabel.Text = "Edit Keybinds" .. " (x" .. #binds .. ")"
	local old
	old = hf(table.remove, function(...)
		old(...)
		local t = ({ ... })[1]
		if t == binds then
			Keybinds.ButtonLabel.Text = "Edit Keybinds" .. " (x" .. #binds .. ")"
		elseif t == WayPoints then
			Positions.ButtonLabel.Text = "Edit/Goto Waypoints" .. " (x" .. #WayPoints .. ")"
		elseif t == aliases then
			Aliases.ButtonLabel.Text = "Edit Aliases" .. " (x" .. #aliases .. ")"
		elseif t == PluginsTable then
			Plugins.ButtonLabel.Text = "Manage Plugins" .. " (x" .. #PluginsTable .. ")"
		end
	end)
	setmetatable(binds, {
		__newindex = function(_, index, value)
			rawset(_, index, value)
			Keybinds.ButtonLabel.Text = "Edit Keybinds" .. " (x" .. #binds .. ")"
		end,
	})
	setmetatable(WayPoints, {
		__newindex = function(_, index, value)
			rawset(_, index, value)
			Positions.ButtonLabel.Text = "Edit/Goto Waypoints" .. " (x" .. #WayPoints .. ")"
		end,
	})
	setmetatable(aliases, {
		__newindex = function(_, index, value)
			rawset(_, index, value)
			Aliases.ButtonLabel.Text = "Edit Aliases" .. " (x" .. #aliases .. ")"
		end,
	})
	setmetatable(PluginsTable, {
		__newindex = function(_, index, value)
			rawset(_, index, value)
			Plugins.ButtonLabel.Text = "Manage Plugins" .. " (x" .. #PluginsTable .. ")"
		end,
	})

	function getCount()
		repeat
			wait()
		until eventEditor.SaveData() ~= "[]"
		local sd = eventEditor.SaveData()
		local data = game:GetService("HttpService"):JSONDecode(sd)
		local count = 0
		for i, v in pairs(data) do
			for i, v in pairs(v) do
				count += 1
			end
		end
		return count
	end

	EventBind.ButtonLabel.Text = "Edit Event Binds" .. " (x" .. getCount() .. ")"

	eventEditor.SetOnEdited(function()
		updatesaves()
		EventBind.ButtonLabel.Text = "Edit Event Binds" .. " (x" .. getCount() .. ")"
	end)
end)

return {
	["PluginName"] = "SettingsCount",
	["PluginDescription"] = "made by prisj",
	["Commands"] = {},
}
