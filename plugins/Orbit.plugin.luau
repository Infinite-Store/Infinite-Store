local PluginAPI = {}
function PluginAPI:CreatePlugin(name, description)
	local Functions = {}
	local Plugin = {
		["PluginName"] = name,
		["PluginDescription"] = description,
		["Commands"] = {},
	}
	function Functions:AddCommand(Name, ListName, Description, Aliases, Callback)
		Plugin["Commands"][Name] = {
			["ListName"] = ListName,
			["Description"] = Description,
			["Aliases"] = Aliases,
			["Function"] = Callback,
		}
	end
	return { PluginTable = Plugin, Functions = Functions }
end

local Plugin = PluginAPI:CreatePlugin("orbit", "Because Edge removed it long ago, lol -Amokah")
function RemoveFromTable(TABLE, IND)
	for i, v in pairs(TABLE) do
		if v == IND then
			table.remove(TABLE, i)
			v = nil
			return TABLE
		end
	end
	return TABLE
end
local Players = game:GetService("Players")
function GetPlayers(owner, strGet)
	local Group = {}
	if strGet == nil then
		strGet = ""
	end
	strGet = strGet:lower()
	if strGet == "all" then
		return Players:GetPlayers()
	end
	if strGet == "others" then
		return RemoveFromTable(Players:GetPlayers(), owner)
	end
	if strGet == "admins" then
		for i, v in pairs(_G.Admins) do
			table.insert(Group, v)
		end
	end
	if strGet == "nonadmins" then
		local t = Players:GetPlayers()
		for i, v in pairs(_G.Admins) do
			RemoveFromTable(t, v)
		end
		return t
	end
	if strGet == "me" or strGet == "" then
		return { owner }
	end
	for i, v in pairs(Players:GetPlayers()) do
		if v.Name:lower():sub(0, #strGet) == strGet:lower() then
			table.insert(Group, v)
		end
	end
	return Group
end

local Loop = nil
local rot = 0
local orbSpeed = 1
local orbDist = 5

Plugin.Functions:AddCommand("orbit", "orbit [plr]", "orbits a player in a circle", { "orb" }, function(args, speaker)
	local PlayerToOrbit = GetPlayers(speaker, args[1])
	if PlayerToOrbit then
		PlayerToOrbit = PlayerToOrbit[1]
	else
		return Loop:Disconnect()
	end
	if Loop ~= nil then
		Loop:Disconnect()
	end
	local t = tick()
	Loop = game:GetService("RunService").RenderStepped:Connect(function()
		if tick() - t > 0.01035 then
			rot += orbSpeed
			t = tick()
			if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
				for _, g in pairs(speaker.Character:GetDescendants()) do
					pcall(function()
						if g:IsA("BasePart") then
							g.Velocity = Vector3.new(0, 0, 0)
							g.RotVelocity = Vector3.new(0, 0, 0)
						end
					end)
				end
				if PlayerToOrbit ~= speaker then
					if PlayerToOrbit.Character and PlayerToOrbit.Character:FindFirstChild("HumanoidRootPart") then
						speaker.Character.HumanoidRootPart.CFrame = CFrame.new(
							PlayerToOrbit.Character.HumanoidRootPart.Position
						) * CFrame.Angles(0, math.rad(rot), 0) * CFrame.new(0, 0, -orbDist) * CFrame.Angles(
							0,
							math.rad(180),
							0
						)
					end
				else
					Loop:Disconnect()
				end
			end
		end
	end)
end)
Plugin.Functions:AddCommand("unorbit", "unorbit", "unorbits a player", { "unorb" }, function(args, speaker)
	if Loop ~= nil then
		Loop:Disconnect()
	end
end)
Plugin.Functions:AddCommand(
	"orbitspeed",
	"orbitspeed / ospeed [speed]",
	"changes orbit speed",
	{ "ospeed" },
	function(args, speaker)
		if args[1] and tonumber(args[1]) ~= nil and tonumber(args[1]) > 0 then
			local num = tonumber(args[1])
			orbSpeed = math.clamp(num, 0.005, 1000)
		end
	end
)
Plugin.Functions:AddCommand(
	"orbitdist",
	"orbitdist / odist [distance]",
	"changes orbit distance",
	{ "odist" },
	function(args, speaker)
		if args[1] and tonumber(args[1]) ~= nil and tonumber(args[1]) > 0 then
			local num = tonumber(args[1])
			orbDist = math.clamp(num, 0.005, 1000)
		end
	end
)

return Plugin.PluginTable
