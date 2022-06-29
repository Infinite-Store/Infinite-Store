local AntiKill = false
local RunService = game:GetService("RunService")
local Me = game:GetService("Players").LocalPlayer
local Char = Me.Character
local BPack = Me.Backpack
local Humanoid = Char:FindFirstChildWhichIsA("Humanoid")
local ToolTable = BPack:GetChildren()
RunService.Stepped:Connect(function()
	local Tool = Char:FindFirstChildOfClass("Tool")
	if AntiKill and Tool and not table.find(ToolTable, Tool) then
		if
			Humanoid
			and Humanoid.RigType == Enum.HumanoidRigType.R6
			and Char:FindFirstChild("Right Arm")
			and Char["Right Arm"]:FindFirstChild("RightGrip")
		then
			Char["Right Arm"].RightGrip:Destroy()
		elseif
			Humanoid
			and Humanoid.RigType == Enum.HumanoidRigType.R15
			and Char:FindFirstChild("RightHand")
			and Char["RightHand"]:FindFirstChild("RightGrip")
		then
			Char["RightHand"].RightGrip:Destroy()
		end
	end
end)
local GetAntiKill = function(Char)
	local ToolTable1 = BPack:GetChildren()
	Char.ChildAdded:Connect(function(Tool)
		if AntiKill and Tool:IsA("Tool") and not table.find(ToolTable1, Tool) then
			Tool:Destroy()
		end
	end)
end
GetAntiKill(Char)
Me.CharacterAdded:Connect(GetAntiKill)
local Plugin = {
	["PluginName"] = "Anti Kill",
	["PluginDescription"] = "If someone tries to kill you with their script with tools, the plugin stops it",
	["Commands"] = {
		["antikill"] = {
			["ListName"] = "antikill",
			["Description"] = "If someone tries to kill you with their script with tools stops it",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				AntiKill = true
			end,
		},
		["unantikill"] = {
			["ListName"] = "unantikill",
			["Description"] = "stop anti kill",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				AntiKill = false
			end,
		},
		["tantikill"] = {
			["ListName"] = "tantikill",
			["Description"] = "stop true anti kill",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				local Char = speaker.Character
				local Humanoid = Char:WaitForChild("Humanoid")
				if Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R6 then
					if Char:FindFirstChild("Right Arm") then
						Char["Right Arm"]:Destroy()
					end
				elseif Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R15 then
					if Char:FindFirstChild("RightHand") then
						Char.RightHand:Destroy()
					end
					if Char:FindFirstChild("RightUpperArm") then
						Char.RightUpperArm:Destroy()
					end
					if Char:FindFirstChild("RightLowerArm") then
						Char.RightLowerArm:Destroy()
					end
				end
			end,
		},
	},
}
return Plugin
