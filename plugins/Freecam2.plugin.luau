local allowspeedmove = true
wait(1)

local c = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local starterPlayer = game:GetService("StarterPlayer")

local selected = false
local speed = 60
local lastUpdate = 0

local camera = Instance.new("Part", workspace)
camera.CanCollide = false
camera.Anchored = true
camera.Transparency = 1
camera.Name = "FreeCam"
camera.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)

c.Changed:connect(function(property)
	if property == "CoordinateFrame" then
		--		camSync:fire()
	end
end)

function getNextMovement(deltaTime)
	local nextMove = Vector3.new()
	-- Left/Right
	if userInput:IsKeyDown("A") or userInput:IsKeyDown("Left") then
		nextMove = nextMove + Vector3.new(-1, 0, 0)
	end
	if userInput:IsKeyDown("D") or userInput:IsKeyDown("Right") then
		nextMove = nextMove + Vector3.new(1, 0, 0)
	end
	-- Forward/Back
	if userInput:IsKeyDown("W") or userInput:IsKeyDown("Up") then
		nextMove = nextMove + Vector3.new(0, 0, -1)
	end
	if userInput:IsKeyDown("S") or userInput:IsKeyDown("Down") then
		nextMove = nextMove + Vector3.new(0, 0, 1)
	end
	-- Up/Down
	if userInput:IsKeyDown("Space") or userInput:IsKeyDown("E") then
		nextMove = nextMove + Vector3.new(0, 1, 0)
	end
	if userInput:IsKeyDown("Q") then
		nextMove = nextMove + Vector3.new(0, -1, 0)
	end
	return CFrame.new(nextMove * (speed * deltaTime))
end

function onSelected()
	local char = player.Character
	if char then
		local root = camera
		currentPos = root.Position
		selected = true
		lastUpdate = tick()
		c.CameraSubject = root
		player.Character.HumanoidRootPart.Anchored = true
		while selected do
			local delta = tick() - lastUpdate
			local look = (c.Focus.p - c.CoordinateFrame.p).unit
			local move = getNextMovement(delta)
			local pos = root.Position
			root.CFrame = CFrame.new(pos, pos + look) * move
			lastUpdate = tick()
			wait(0.01)
			--	camSync:wait()
		end
		player.Character.HumanoidRootPart.Anchored = false
		c.CameraSubject = player.Character.Humanoid
		root.Velocity = Vector3.new()
	end
end

function onDeselected()
	selected = false
end

local isOn = false

function onKeyPressed()
	isOn = not isOn
	if isOn then
		onSelected()
	else
		onDeselected()
	end
end

local mouse = player:GetMouse()
mouse.Button1Down:Connect(function()
	if allowspeedmove then
		speed = 120
	end
end)
mouse.Button1Up:Connect(function()
	speed = 60
end)

function ResetCamera()
	camera.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
end

local Plugin = {
	["PluginName"] = "Freecam 2",
	["PluginDescription"] = "Another version of the IY Freecam",
	["Commands"] = {
		["freecam2"] = {
			["ListName"] = "freecam2 / fc2",
			["Description"] = "Note : Type command again to disable, Hold LeftClick to move faster",
			["Aliases"] = { "fc2" },
			["Function"] = function(args, speaker)
				onKeyPressed()
			end,
		},

		["resetcam2"] = {
			["ListName"] = "resetcam2 / rc2",
			["Description"] = "Reset Camera to Your Character",
			["Aliases"] = { "rc2" },
			["Function"] = function(args, speaker)
				ResetCamera()
			end,
		},
	},
}

return Plugin
