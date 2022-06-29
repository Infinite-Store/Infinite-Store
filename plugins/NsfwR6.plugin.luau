-- https://www.roblox.com/catalog/4246228452/International-Fedora-Spain
-- https://www.roblox.com/catalog/4391384843/International-Fedora-Russia
-- https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
-- https://www.roblox.com/catalog/3992084515/International-Fedora-Vietnam
-- https://www.roblox.com/catalog/4094878701/International-Fedora-Mexico
-- https://www.roblox.com/catalog/4489239608/International-Fedora-United-Kingdom
-- https://www.roblox.com/catalog/4324158403/International-Fedora-Japan
-- https://www.roblox.com/catalog/3656493304/International-Fedora-South-Korea
-- https://www.roblox.com/catalog/3409612660/International-Fedora-USA
-- https://www.roblox.com/catalog/4047554959/International-Fedora-Brazil

local Plugin = {
	["PluginName"] = "NSFW",
	["PluginDescription"] = "Made by Bloxxy213 on Infinite Yiff lolololololololo",
	["Commands"] = {
		["NSFWr6"] = {
			["ListName"] = "NSFWr6 / NSFW",
			["Description"] = "Makes you head big",
			["Aliases"] = { "NSFW" },
			["Function"] = function(args, speaker)
				local ClaimedItems = {}

				local function GetHatById(Id)
					for _, Hat in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
						local Handle = Hat:FindFirstChild("Handle")
						if Handle and Handle:IsA("BasePart") and Hat.ClassName == "Accessory" then
							local SpecialMesh = Handle:FindFirstChildOfClass("SpecialMesh")
							if SpecialMesh then
								if tonumber(string.match(SpecialMesh.MeshId, "%d+")) == Id then
									if not ClaimedItems[Hat] then
										ClaimedItems[Hat] = true
										return Hat
									end
								end
							end
						end
					end
				end

				local Hats = {
					Hat11 = GetHatById(3030546036),
					Hat22 = GetHatById(3030546036),
					Hat33 = GetHatById(4094864753),
					Hat44 = GetHatById(3030546036),
					Hat55 = GetHatById(4324138105),
					Hat66 = GetHatById(3030546036),
					Hat77 = GetHatById(4489232754),
					Hat88 = GetHatById(3030546036),
					Hat99 = GetHatById(4246186687),
					--Hat100  = GetHatById(4324138105);
				}

				for Name, Item in pairs(Hats) do
					Item.Handle.SpecialMesh:Destroy()
				end

				local unanchoredparts = {}
				local movers = {}
				local tog = true
				local move = false
				local Player = game:GetService("Players").LocalPlayer
				local Character = Player.Character
				local mov = {}
				local mov2 = {}

				for i, v in next, Hats do
					if v then
						local Handle = v:FindFirstChild("Handle")
						if Handle then
							Handle.AccessoryWeld:Remove()
							for _, mesh in next, v:GetDescendants() do
								if mesh:IsA("Mesh") or mesh:IsA("Mesh") then
									mesh:Destroy()
								end
							end
						end
					end
				end

				local function align(i, v)
					local att0 = Instance.new("Attachment", i)
					att0.Position = Vector3.new(0, 0, 0)
					local att1 = Instance.new("Attachment", v)
					att1.Position = Vector3.new(0, 0, 0)
					local AP = Instance.new("AlignPosition", i)
					AP.Attachment0 = att0
					AP.Attachment1 = att1
					AP.RigidityEnabled = false
					AP.ReactionForceEnabled = false
					AP.ApplyAtCenterOfMass = false
					AP.MaxForce = 9999999
					AP.MaxVelocity = math.huge
					AP.Responsiveness = 65
					local AO = Instance.new("AlignOrientation", i)
					AO.Attachment0 = att0
					AO.Attachment1 = att1
					AO.ReactionTorqueEnabled = false
					AO.PrimaryAxisOnly = false
					AO.MaxTorque = 9999999
					AO.MaxAngularVelocity = math.huge
					AO.Responsiveness = 50
				end

				for Name, Item in pairs(Hats) do
					align(Item.Handle, Character["Torso"])
				end

				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment11"
				Character:WaitForChild("Torso").Attachment11.Position = Vector3.new(0, -1, -2.1)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment22"
				Character:WaitForChild("Torso").Attachment22.Position = Vector3.new(0, -1, -1.2)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment33"
				Character:WaitForChild("Torso").Attachment33.Position = Vector3.new(-0.6, -1.2, -0.8)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment44"
				Character:WaitForChild("Torso").Attachment44.Position = Vector3.new(0.6, -1.2, -0.8)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment55"
				Character:WaitForChild("Torso").Attachment55.Position = Vector3.new(0, -1, -3)

				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment66"
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment77"
				Character:WaitForChild("Torso").Attachment66.Position = Vector3.new(0.475, -1, 0.5)
				Character:WaitForChild("Torso").Attachment77.Position = Vector3.new(-0.475, -1, 0.5)

				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment88"
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment99"
				Character:WaitForChild("Torso").Attachment88.Position = Vector3.new(0.5, 0.5, -0.5)
				Character:WaitForChild("Torso").Attachment99.Position = Vector3.new(-0.5, 0.5, -0.5)

				notify("Now you are sexy af bro")
			end,
		},
	},
}

return Plugin
