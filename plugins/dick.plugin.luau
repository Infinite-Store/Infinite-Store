-- https://www.roblox.com/catalog/451220849/Lavender-Updo
-- https://www.roblox.com/catalog/11679229/Motocross-62-Fire
-- https://www.roblox.com/catalog/11142504/Motocross-48-Old-Skool
-- https://www.roblox.com/catalog/63690008/Pal-Hair

local Plugin = {
	["PluginName"] = "dick",
	["PluginDescription"] = "edge doesnt have a dick :troll:",
	["Commands"] = {
		["dick"] = {
			["ListName"] = "dick",
			["Description"] = "trust me this plugin fucking sucks ass",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				game.Players.LocalPlayer.Character:WaitForChild("LavanderHair").Handle.Mesh:Remove()
				game.Players.LocalPlayer.Character:WaitForChild("Pal Hair").Handle.Mesh:Remove()
				game.Players.LocalPlayer.Character:WaitForChild("Racing Helmet Flames").Handle.Mesh:Remove()
				game.Players.LocalPlayer.Character:WaitForChild("Racing Helmet").Handle.Mesh:Remove()

				local unanchoredparts = {}
				local movers = {}
				local tog = true
				local move = false
				local Player = game:GetService("Players").LocalPlayer
				local Character = Player.Character
				local mov = {}
				local mov2 = {}

				local Hats = {
					Hat11 = Character:WaitForChild("LavanderHair"),
					Hat22 = Character:WaitForChild("Pal Hair"),
					Hat33 = Character:WaitForChild("Racing Helmet Flames"),
					Hat44 = Character:WaitForChild("Racing Helmet"),
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

				align(Hats.Hat11.Handle, Character["Torso"])
				align(Hats.Hat22.Handle, Character["Torso"])
				align(Hats.Hat33.Handle, Character["Torso"])
				align(Hats.Hat44.Handle, Character["Torso"])

				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment11"
				Character:WaitForChild("Torso").Attachment11.Position = Vector3.new(0, -1, -2.1)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment22"
				Character:WaitForChild("Torso").Attachment22.Position = Vector3.new(0, -1, -1.2)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment33"
				Character:WaitForChild("Torso").Attachment33.Position = Vector3.new(-0.6, -1.2, -0.8)
				Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment44"
				Character:WaitForChild("Torso").Attachment44.Position = Vector3.new(0.6, -1.2, -0.8)
			end,
		},
	},
}

return Plugin
