-- ESP/Chams from Racist Dolphin's Project Bullshit

local mouseTargetESP = false

local Plugin = {
	["PluginName"] = "Mouse Target",
	["PluginDescription"] = "Shows mouse target",
	["Commands"] = {
		["mousetarget"] = {
			["ListName"] = "mousetarget / mtarget",
			["Description"] = "Toggles showing mouse target",
			["Aliases"] = { "mtarget" },
			["Function"] = function(args, speaker)
				mouseTargetESP = not mouseTargetESP
			end,
		},
	},
}

local ESP = Instance.new("Folder", workspace)

function createLabel()
	local parent = IYMouse.Target

	local bb = Instance.new("BillboardGui")
	bb.Adornee = parent
	bb.AlwaysOnTop = true
	bb.Size = UDim2.new(0, 30, 0, 30)
	bb.Parent = ESP

	local frame = Instance.new("Frame", bb)
	frame.ZIndex = 10
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(1, 0, 1, 0)

	local label = Instance.new("TextLabel", frame)
	label.ZIndex = math.huge
	label.Text = parent:GetFullName()
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.SourceSansBold
	label.TextSize = 30
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextStrokeTransparency = 0
end

function createChams()
	local parent = IYMouse.Target
	local parts

	if parent:IsA("Player") then
		parts = parent:GetChildren()
	else
		parts = parent:GetDescendants()
	end

	function GetSizeOfObject(Obj)
		if Obj.Size then
			return Obj.Size
		elseif Obj:IsA("Model") then
			return Obj:GetExtentsSize()
		end
	end

	for i, part in pairs(parts) do
		if part:IsA("PVInstance") and part.Name ~= "HumanoidRootPart" then
			local Box = Instance.new("BoxHandleAdornment")
			pcall(function()
				Box.Size = GetSizeOfObject(part)
			end)
			Box.Name = ""
			Box.Adornee = parent
			Box.AlwaysOnTop = true
			Box.Color3 = Color3.new(1, 1, 1)
			Box.Parent = ESP
		end
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	if mouseTargetESP then
		pcall(function()
			ESP:ClearAllChildren()
			createLabel()
			createChams()
		end)
	else
		ESP:ClearAllChildren()
	end
end)

return Plugin
