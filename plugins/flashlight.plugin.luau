local a = {}
a.__index = a
local typeof = typeof
local assert = assert
function a:CreatePlugin(b, c)
	local self = setmetatable({}, a)
	self.PluginName = b
	self.PluginDescription = c
	self.Commands = {}
	return self
end
function a:AddCommand(d, e, c, f, g)
	assert(typeof(d) == "string", "CommandName must be a string.")
	assert(typeof(e) == "string", "List must be a string.")
	assert(typeof(c) == "string", "Description must be a string.")
	assert(typeof(g) == "function", "Func must be a function.")
	assert(typeof(f) == "table", "Alias must be a table.")
	self.Commands[d] = {
		ListName = e,
		Description = c,
		Aliases = f,
		Function = function(h, i)
			g(h, i)
		end,
	}
end

local flash = a:CreatePlugin("Flashlight", "LOL GIVES U A FLASHLIGHT")
flash:AddCommand("flashlight", "flashlight", "gives you a- what? a flashlight?!", { "fl" }, function(Args, Speaker)
	Brightness1 = 1
	Brightness2 = 0.75
	Range1 = 32
	Range2 = 60

	Players = game:GetService("Players")
	LocalPlayer = Players.LocalPlayer
	Backpack = LocalPlayer.Backpack
	StarterGui = game:GetService("StarterGui")

	local Flashlight = Instance.new("Tool", Backpack)
	Flashlight.GripPos = Vector3.new(0.1, -0.4, 0)
	Flashlight.Name = "Flashlight"
	Flashlight.TextureId = "http://www.roblox.com/asset/?id=115955232"

	local Handle = Instance.new("Part", Flashlight)
	Handle.BrickColor = BrickColor.new("Bright yellow")
	Handle.Color = Color3.fromRGB(245, 205, 48)
	Handle.Name = "Handle"
	Handle.Locked = true
	Handle.Size = Vector3.new(0.5, 0.5, 2)
	Handle.CanCollide = true

	local LightPart = Instance.new("Part", Flashlight)
	LightPart.BrickColor = BrickColor.new("Mid gray")
	LightPart.Color = Color3.fromRGB(205, 205, 205)
	LightPart.Transparency = 1
	LightPart.Name = "LightPart"
	LightPart.CanCollide = false
	LightPart.Locked = true
	LightPart.Size = Vector3.new(0.2, 0.2, 0.2)

	local Motor = Instance.new("Motor", Flashlight)
	Motor.Part0 = Handle
	Motor.Part1 = LightPart

	local Sound = Instance.new("Sound", Handle)
	Sound.SoundId = "http://www.roblox.com/asset/?id=115959318"
	Sound.Volume = 1

	local Mesh = Instance.new("SpecialMesh", Handle)
	Mesh.Name = "Mesh"
	Mesh.MeshId = "http://www.roblox.com/asset/?id=115955313"
	Mesh.MeshType = "FileMesh"
	Mesh.Scale = Vector3.new(0.7, 0.7, 0.7)
	Mesh.TextureId = "http://www.roblox.com/asset?id=115955343"

	local SpotLight = Instance.new("SpotLight", LightPart)
	SpotLight.Name = "SpotLight"
	SpotLight.Angle = 70
	SpotLight.Brightness = Brightness1
	SpotLight.Color = Color3.fromRGB(244, 255, 233)
	SpotLight.Enabled = false
	SpotLight.Face = "Front"
	SpotLight.Range = Range1

	local SpotLight2 = Instance.new("SpotLight", LightPart)
	SpotLight2.Name = "SpotLight2"
	SpotLight2.Angle = 70
	SpotLight2.Brightness = Brightness2
	SpotLight2.Color = Color3.fromRGB(244, 255, 233)
	SpotLight2.Enabled = false
	SpotLight2.Range = Range2

	sp = Flashlight

	cooldown = 0.35

	lightontexture = 115984370
	lightofftexture = 115955343

	local weld = sp:WaitForChild("Motor")
	local lp = sp:WaitForChild("LightPart")
	local handle = sp:WaitForChild("Handle")
	local spotlight = lp:WaitForChild("SpotLight")
	local spotlight2 = lp:WaitForChild("SpotLight2")
	local mesh = handle:WaitForChild("Mesh")
	local sound = handle:WaitForChild("Sound")
	lastclick = 0

	sp.Equipped:connect(function(mouse)
		equipped = true
		if mouse ~= nil then
			themouse = mouse
			mouse.Button1Down:connect(function()
				if lastclick + cooldown < tick() then
					spotlight.Enabled = not spotlight.Enabled
					spotlight2.Enabled = spotlight.Enabled
					mesh.TextureId = "http://www.roblox.com/asset?id="
						.. tostring((spotlight.Enabled and lightontexture) or lightofftexture)
					sound:Play()
					lastclick = tick()
				end
			end)
		end
		if weld ~= nil then
			weld.Parent = sp
		end
		while equipped and sp.Parent ~= nil do
			local head = sp.Parent:FindFirstChild("Head")
			if spotlight.Enabled and themouse and handle and weld and head then
				local vec = themouse.Hit.p - head.Position
				local pos = (handle.CFrame * CFrame.new(0, 0, -1)).p
				local cf = CFrame.new(pos, pos + vec)
				--lp.CFrame=cf
				weld.C0 = handle.CFrame:toObjectSpace(cf)
			end
			wait()
		end
	end)

	sp.Unequipped:connect(function()
		if weld ~= nil then
			weld.Parent = sp
		end
		equipped = false
	end)

	local Flashlight2 = Flashlight:clone()
	Flashlight2.Parent = StarterGui
end)

return flash
