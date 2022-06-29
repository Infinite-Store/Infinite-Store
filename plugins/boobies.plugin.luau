local Plugin = {
	["PluginName"] = "boobies",
	["PluginDescription"] = "boobies :flushed:",
	["Commands"] = {
		["boobs"] = {
			["ListName"] = "boobs",
			["Description"] = "b o o b s",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				game.Players.LocalPlayer.Character.Stinger77.Handle.Mesh:Remove()
				game.Players.LocalPlayer.Character:WaitForChild("Racing Helmet Flames").Handle.Mesh:Remove()

				local unanchoredparts = {}
				local movers = {}
				local tog = true
				local move = false
				local Player = game:GetService("Players").LocalPlayer
				local Character = Player.Character
				local mov = {}
				local mov2 = {}

				local Hats = {
					Hat1 = Character:WaitForChild("Stinger77"),
					Hat2 = Character:WaitForChild("Racing Helmet Flames"),
					Hat3 = Character:WaitForChild("MeshPartAccessory"),
				}

				for i, v in next, Hats do
					v.Handle.AccessoryWeld:Remove()
					for _, mesh in next, v:GetDescendants() do
						if mesh:IsA("Mesh") or mesh:IsA("Mesh") then
							mesh:Remove()
						end
					end
				end

				function ftp(str)
					local pt = {}
					if str ~= "me" and str ~= "random" then
						for i, v in pairs(game.Players:GetPlayers()) do
							if v.Name:lower():find(str:lower()) then
								table.insert(pt, v)
							end
						end
					elseif str == "me" then
						table.insert(pt, plr)
					elseif str == "random" then
						table.insert(pt, game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())])
					end
					return pt
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

				align(Hats.Hat1.Handle, Character["Torso"])
				align(Hats.Hat2.Handle, Character["Torso"])
				align(Hats.Hat3.Handle, Character["Torso"])

				Hats.Hat1.Handle.Attachment.Rotation = Vector3.new(250, 170, 183)
				Hats.Hat2.Handle.Attachment.Rotation = Vector3.new(250, 170, 183)
				Hats.Hat3.Handle.Attachment.Rotation = Vector3.new(240, 0, 0)

				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment1"
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment2"
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment3"
				Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5, 0.5, -0.5)
				Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.5, 0.5, -0.5)
				Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0, 0.5, -0.9)
			end,
		},
	},
}

return Plugin
