local CmdSuggestion = Instance.new("TextLabel")
CmdSuggestion.Name = "CmdSuggestion"
CmdSuggestion.Parent = Cmdbar
CmdSuggestion.BackgroundTransparency = 1
CmdSuggestion.BorderSizePixel = 0
CmdSuggestion.Position = UDim2.new(0, 0, 0, 0)
CmdSuggestion.Size = UDim2.new(0, 240, 0, 25)
CmdSuggestion.Font = Enum.Font.SourceSans
CmdSuggestion.TextSize = 18
CmdSuggestion.TextXAlignment = Enum.TextXAlignment.Left
CmdSuggestion.TextColor3 = Color3.fromRGB(171, 171, 171)
CmdSuggestion.Text = ""
CmdSuggestion.ZIndex = 10

Match = function(str1, str2)
	return str2 == string.sub(str1, 1, #str2)
end
local matchSearch = function(str1, str2)
	return str1 == string.sub(str2, 1, #str1)
end

local stringFind = function(tbl, str)
	if tbl == nil then
		return
	end
	if type(tbl) == "table" then
		for _, v in ipairs(tbl) do
			if matchSearch(str, v) then
				return v
			end
		end
	end
end

local getPlrArguments = function(argument)
	local arg = string.lower(argument)
	local specialcases = {
		"all",
		"others",
		"random",
		"me",
		"nearest",
		"farthest",
		"allies",
		"enemies",
		"team",
		"nonteam",
		"friends",
		"nonfriends",
		"bacons",
		"nearest",
		"farthest",
		"alive",
		"dead",
		"cursor",
	}
	return stringFind(specialcases, arg)
		or (function()
			for _, v in ipairs(Players:GetPlayers()) do
				local Name = string.lower(v.Name)
				if matchSearch(arg, Name) then
					return Name
				end
			end
		end)()
end

Cmdbar:GetPropertyChangedSignal("Text"):Connect(function()
	if Cmdbar:IsFocused() then
		CmdSuggestion.Text = ""
		local InputText = Cmdbar.Text
		local Args = string.split(InputText, " ")
		local CmdArgs = cargs or {}
		if InputText == "" then
			return
		end
		for _, v in next, cmds do
			local Name = v.NAME
			local Aliases = v.ALIAS
			local FoundAlias = false
			if matchSearch(InputText, Name) then
				CmdSuggestion.Text = Name
				break
			end
			for _, v2 in next, Aliases do
				if matchSearch(InputText, v2) then
					FoundAlias = true
					CmdSuggestion.Text = v2
					break
				end
				if FoundAlias then
					break
				end
			end
		end
		for i, v in next, Args do
			if i > 1 and v ~= "" then
				local Predict = ""
				if #CmdArgs >= 1 then
					Predict = getPlrArguments(v) or Predict
				else
					Predict = getPlrArguments(v) or Predict
				end
				CmdSuggestion.Text = string.sub(InputText, 1, #InputText - #Args[#Args]) .. Predict
				local split = v:split(",")
				if next(split) then
					for i2, v2 in next, split do
						if i2 > 1 and v2 ~= "" then
							local PlayerName = getPlrArguments(v2)
							CmdSuggestion.Text = string.sub(InputText, 1, #InputText - #split[#split])
								.. (PlayerName or "")
						end
					end
				end
			end
		end
	end
end)

Cmdbar.FocusLost:Connect(function()
	if not Cmdbar:IsFocused() then
		CmdSuggestion.Text = ""
	end
end)

tabAllowed = false
local newTabComplete = nil
Cmdbar.Focused:Connect(function()
	newTabComplete = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if Cmdbar:IsFocused() then
			if input.KeyCode == Enum.KeyCode.Tab then
				if CmdSuggestion.Text == ("" or " ") then
				else
					if string.match(CmdSuggestion.Text, " ") then
						Cmdbar.Text = CmdSuggestion.Text
						wait()
						Cmdbar.Text = Cmdbar.Text:gsub("\t", "")
						Cmdbar.CursorPosition = #Cmdbar.Text + 1
					else
						Cmdbar.Text = CmdSuggestion.Text .. " "
						wait()
						Cmdbar.Text = Cmdbar.Text:gsub("\t", "")
						Cmdbar.CursorPosition = #Cmdbar.Text + 1
					end
				end
			end
		else
			newTabComplete:Disconnect()
			newTabComplete = nil
		end
	end)
end)

return {
	["PluginName"] = "Prediction",
	["PluginDescription"] = "Add back the super hot autocomplete from version 5.3.2",
	["Commands"] = {},
}
