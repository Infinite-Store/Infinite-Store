if not isfile("keybinds.keybinds") then
	keybinds = {}
else
	keybinds = game:GetService("HttpService"):JSONDecode(readfile("keybinds.keybinds"))
end

local event
event = game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(input)
	for i, v in pairs(keybinds) do
		if input:lower() == v.KEY and v.TOGGLE then
			execCmd(v.COMMAND_1 .. " " .. v.ARGUMENT_1, speaker)

			v.TOGGLE = false
		elseif input:lower() == v.KEY and not v.TOGGLE then
			execCmd(v.COMMAND_2 .. " " .. v.ARGUMENT_2, speaker)

			v.TOGGLE = true
		end
	end
end)

local Plugin = {
	["PluginName"] = "Keybinds v2",
	["PluginDescription"] = "Allows you to bind any commands and set them to toggle",
	["Commands"] = {
		["bind"] = {
			["ListName"] = "bind {key} {command} [argument] {command} [argument]",
			["Description"] = "Commands can have 1 optional arguments each",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				-- Ugly code incoming
				if #args == 3 then
					keybinds[#keybinds + 1] = {
						KEY = args[1],
						COMMAND_1 = args[2],
						COMMAND_2 = args[3],
						ARGUMENT_1 = "",
						ARGUMENT_2 = "",
						TOGGLE = true,
					}
					writefile("keybinds.keybinds", game:GetService("HttpService"):JSONEncode(keybinds))
					-- ;bind [key] [command 1] [command 2]
				else
					for i = #cmds, 1, -1 do
						if cmds[i].NAME ~= args[3] or not FindInTable(cmds[i].ALIAS, args[3]) and args[5] then
							keybinds[#keybinds + 1] = {
								KEY = args[1],
								COMMAND_1 = args[2],
								COMMAND_2 = args[4],
								ARGUMENT_1 = args[3],
								ARGUMENT_2 = args[5],
								TOGGLE = true,
							}
							writefile("keybinds.keybinds", game:GetService("HttpService"):JSONEncode(keybinds))
							-- ;bind [key] [command 1] [parameter 1] [command 2] [parameter 2]
							break
						elseif
							cmds[i].NAME ~= args[3] or not FindInTable(cmds[i].ALIAS, args[3]) and args[5] == nil
						then
							keybinds[#keybinds + 1] = {
								KEY = args[1],
								COMMAND_1 = args[2],
								COMMAND_2 = args[4],
								ARGUMENT_1 = args[3],
								ARGUMENT_2 = "",
								TOGGLE = true,
							}
							writefile("keybinds.keybinds", game:GetService("HttpService"):JSONEncode(keybinds))
							-- ;bind [key] [command 1] [parameter 1] [command 2]
							break
						elseif cmds[i].NAME == args[3] or FindInTable(cmds[i].ALIAS, args[3]) then
							keybinds[#keybinds + 1] = {
								KEY = args[1],
								COMMAND_1 = args[2],
								COMMAND_2 = args[3],
								ARGUMENT_1 = "",
								ARGUMENT_2 = args[4],
								TOGGLE = true,
							}
							writefile("keybinds.keybinds", game:GetService("HttpService"):JSONEncode(keybinds))
							-- ;bind [key] [command 1] [command 2] [parameter 2]
							break
						end
					end
				end
			end,
		},
		["unbind"] = {
			["ListName"] = "unbind {key}",
			["Description"] = "oui",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				for i = #keybinds, 1, -1 do
					if keybinds[i].KEY == args[1] then
						table.remove(keybinds, i)
						writefile("keybinds.keybinds", game:GetService("HttpService"):JSONEncode(keybinds))
						notify("This bind has been removed")
						return
					else
						notify("This key is not bound")
					end
				end
			end,
		},
	},
}

return Plugin
