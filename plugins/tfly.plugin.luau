TFlyEnabled = false

local Plugin = {
	["PluginName"] = "Tween Fly",
	["PluginDescription"] = "Basically smooth flying",
	["Commands"] = {
		["tfly"] = {
			["ListName"] = "tfly [speed]",
			["Description"] = "Enables tween fly",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				TFlyEnabled = true

				local speed, e1, e2
				local Hum, mouse = speaker.Character:FindFirstChildOfClass("Humanoid"), speaker:GetMouse()

				local Core = Instance.new("Part", workspace)
				Core.Size, Core.CanCollide = Vector3.new(0.05, 0.05, 0.05), false
				local Trs = Core

				local keys = { a = false, d = false, w = false, s = false }
				e1 = mouse.KeyDown:Connect(function(key)
					if not Trs or not Trs.Parent then
						e1:disconnect()
						e2:disconnect()
						return
					end
					if key == "w" then
						keys.w = true
					elseif key == "s" then
						keys.s = true
					elseif key == "a" then
						keys.a = true
					elseif key == "d" then
						keys.d = true
					end
				end)
				e2 = mouse.KeyUp:Connect(function(key)
					if key == "w" then
						keys.w = false
					elseif key == "s" then
						keys.s = false
					elseif key == "a" then
						keys.a = false
					elseif key == "d" then
						keys.d = false
					end
				end)

				local Weld = Instance.new("Weld", Core)
				Weld.Part0, Weld.Part1, Weld.C0 = Core, Hum.RootPart, CFrame.new(0, 0, 0)

				local pos, gyro = Instance.new("BodyPosition", Trs), Instance.new("BodyGyro", Trs)
				pos.maxForce, pos.position = Vector3.new(math.huge, math.huge, math.huge), Trs.Position
				gyro.maxTorque, gyro.cframe = Vector3.new(9e9, 9e9, 9e9), Trs.CFrame

				repeat
					wait()
					Hum.PlatformStand = true
					local new = gyro.cframe - gyro.cframe.p + pos.position
					if not keys.w and not keys.s and not keys.a and not keys.d then
						if not args[1] then
							speed = 2
						else
							speed = args[1]
						end
					end
					if keys.w then
						new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed = speed + 0
					end
					if keys.s then
						new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed = speed + 0
					end
					if keys.d then
						new = new * CFrame.new(speed, 0, 0)
						speed = speed + 0
					end
					if keys.a then
						new = new * CFrame.new(-speed, 0, 0)
						speed = speed + 0
					end

					pos.position = new.p
					if keys.w then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame
							* CFrame.Angles(-math.rad(speed * 0), 0, 0)
					elseif keys.s then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
					else
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until TFlyEnabled == false
				if gyro then
					gyro:Destroy()
				end
				if pos then
					pos:Destroy()
				end
				Hum.PlatformStand = false
				speed = 10
			end,
		},

		["untfly"] = {
			["ListName"] = "untfly",
			["Description"] = "Disables tween fly",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				TFlyEnabled = false
				for i, v in pairs(Core:GetChildren()) do
					v:Destroy()
				end
			end,
		},
	},
}

return Plugin
