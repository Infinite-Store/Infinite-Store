local plugin = {}
plugin.PluginName = "Metahook"
plugin.PluginDescription = "Hook values idk"
plugin.Commands = {}
plugin.Commands["metahook"] = {
	ListName = "metahook [name] [value]",
	Description = "a simple hook idk like ;metahook walkspeed 50",
	Aliases = {},
	Function = function(args, speaker)
		if args[1] and args[2] then
			local getrawmt = (debug and debug.getmetatable) or getrawmetatable
			local setReadOnly = setreadonly
				or (
					make_writeable
					and function(table, readonly)
						if readonly then
							make_readonly(table)
						else
							make_writeable(table)
						end
					end
				)
			local GameMt = getrawmt(game)
			local OldIndex = GameMt.__index
			setReadOnly(GameMt, false)
			GameMt.__index = newcclosure(function(Self, Key)
				if string.lower(tostring(Key)) == string.lower(tostring(args[1])) then
					return getstring(2)
				end
				return OldIndex(Self, Key)
			end)
			setReadOnly(GameMt, true)
		else
			notify("Meta Hook", "Missing a Argument")
		end
	end,
}
return plugin
