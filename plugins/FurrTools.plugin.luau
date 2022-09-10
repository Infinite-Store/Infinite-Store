local Plugin = {
	["PluginName"] = "FurrTools",
	["PluginDescription"] = "Client Side Tool Repo. Created by Furrtren.",
	["Commands"] = {
		["fuckball"] = {
			["ListName"] = "fuckball/corrball/sonicball",
			["Description"] = "Spawn the Fuckball. (Client Side Only.)",
			["Aliases"] = { "corrball", "corruptionball", "sonicball" },
			["Function"] = function(args, speaker)
				--ignore shitty indenting--

				print("You've created the Fuckball! Script Created by Furrtren!~ Let's cause some chaos!")
				local tool = Instance.new("Tool")
				tool.Name = "Fuckball"
				tool.Parent = game:GetService("Players").LocalPlayer.Backpack
				tool.ToolTip = "Fuckball: SDC"

				local player = game.Players.LocalPlayer
				local char = player.Character

				-- Construct Corruption Ball Model --
				local corball = Instance.new("Part", tool)
				corball.Name = "Handle"
				corball.Size = Vector3.new(2.066, 2.066, 2.066)
				corball.Color = Color3.new(0, 0, 1)
				corball.Reflectance = -255
				local coreye = Instance.new("Part", tool)
				coreye.Name = "CorBall_Eye"
				coreye.Size = Vector3.new(1.649, 1.649, 1.649)
				local corball_inner = Instance.new("Part", tool)
				corball_inner.Name = "CorBall_Inner"
				corball_inner.Size = Vector3.new(1.649, 1.649, 1.649)
				corball_inner.Color = Color3.new(0, 0, 0)
				corball_inner.Reflectance = -255
				local corball_mesh = Instance.new("SpecialMesh", corball)
				corball_mesh.MeshId = "rbxassetid://7962048236"
				local corball_innermesh = Instance.new("SpecialMesh", corball_inner)
				corball_innermesh.MeshId = "rbxassetid://1185246"
				corball_innermesh.Scale = Vector3.new(2.2, 2.2, 2.2)
				local corball_eyemesh = Instance.new("SpecialMesh", coreye)
				corball_eyemesh.MeshId = "rbxassetid://1185246"
				corball_eyemesh.TextureId = "rbxassetid://1185259"
				corball_eyemesh.Scale = Vector3.new(2, 2, 2)

				-- Create Corruption Ball Welds --

				--
				local weldinner = Instance.new("Weld", corball)
				weldinner.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				weldinner.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				weldinner.Part0 = corball
				weldinner.Part1 = corball_inner
				local weldeye = Instance.new("Weld", corball)
				weldeye.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				weldeye.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				weldeye.Part0 = corball
				weldeye.Part1 = coreye

				-- Create Corruption Ball Sounds --

				local corruptsnd = Instance.new("Sound", corball)
				corruptsnd.Volume = 1
				corruptsnd.SoundId = "rbxassetid://7534241209"
				corruptsnd.Name = "CorruptSound"

				local idlesnd = Instance.new("Sound", corball)
				idlesnd.Volume = 0.75
				idlesnd.SoundId = "rbxassetid://7534243384"
				idlesnd.Name = "Idle"
				idlesnd.Looped = true

				local spawnsnd = Instance.new("Sound", corball)
				spawnsnd.Volume = 1
				spawnsnd.SoundId = "rbxassetid://7534244720"
				spawnsnd.Name = "Spawn"

				-- Create Corruption Ball Particles --

				local atchpnt = Instance.new("Attachment", corball)
				local particles = Instance.new("ParticleEmitter", atchpnt)

				atchpnt.Name = "Waves"

				particles.Brightness = 1
				particles.Texture = "rbxassetid://7534413792"

				local colorKeypoints = {
					-- API: ColorSequenceKeypoint.new(time, color)
					ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), -- At t=0, White
					ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)), -- At t=1, Red
				}

				particles.Color = ColorSequence.new(colorKeypoints)
				particles.LightEmission = 0.25
				particles.LightInfluence = 0

				local numberKeypoints = {
					-- API: NumberSequenceKeypoint.new(time, size, envelop)
					NumberSequenceKeypoint.new(0, 0), -- At t=0, fully transparent
					NumberSequenceKeypoint.new(0.2, 0), -- At t=.1, fully opaque
					NumberSequenceKeypoint.new(0.2, 1), -- At t=.5, mostly opaque
					NumberSequenceKeypoint.new(1, 1), -- At t=1, fully transparent
				}

				particles.Transparency = NumberSequence.new(numberKeypoints)

				local numberKeypoints2 = {
					NumberSequenceKeypoint.new(0, 0), -- At t=0, size of 0
					NumberSequenceKeypoint.new(0.2, 10), -- At t=1, size of 10
					NumberSequenceKeypoint.new(1, 10), -- At t=1, size of 10
				}
				particles.Size = NumberSequence.new(numberKeypoints2)

				particles.EmissionDirection = Enum.NormalId.Top
				particles.Speed = NumberRange.new(0, 0)
				particles.Lifetime = NumberRange.new(1, 1)
				particles.Rate = 0
				particles.Rotation = NumberRange.new(0, 0)
				particles.RotSpeed = NumberRange.new(0, 0)
				particles.Speed = NumberRange.new(0, 0)
				particles.SpreadAngle = Vector2.new(0, 0)
				particles.LockedToPart = true
				particles.TimeScale = 0.5

				particles.Name = "Wave"

				-- Fuck the world code. --
				local cooldown = false

				-- Tween Service Example thanks to DevForum. --
				local tweenService = game:GetService("TweenService")
				local Info = TweenInfo.new(
					0.1, --Length (in seconds, change this number to whatever)
					Enum.EasingStyle.Bounce, --Easing Style (replace Sine to whatever easing style)
					Enum.EasingDirection.Out, --you can use In, Out, and InOut
					0, --Times the Tween repeats. (0 repeats 1 time, 1 repeats 2 times etc)
					false, --If you don't want the TweenService to reverse back to it's previous properties, set this to false.
					0
				)
				-- This Tween plays every time the ball registers a hit on an object.  --

				tool.Equipped:Connect(function()
					corball.Spawn:Play()
					corball.Idle:Play()
					corball.Waves.Wave:Emit(1)
					wait(0.1)
					corball.Waves.Wave:Emit(1)
					wait(0.1)
					corball.Waves.Wave:Emit(1)
					wait(0.1)
					corball.Waves.Wave:Emit(1)
					wait(0.1)
					corball.Corrupt.Disabled = false
				end)

				tool.Unequipped:Connect(function()
					corball.Idle:Stop()
				end)

				while true do
					wait()
					corball.Touched:connect(function(hit)
						if hit and hit.Parent and cooldown == false then
							cooldown = true
							local RandomSizeX = math.random(1, 1000) / 10
							local RandomSizeY = math.random(1, 1000) / 10
							local RandomSizeZ = math.random(1, 1000) / 10
							--hit.Parent.Size = Vector3.new(RandomSize, RandomSize, RandomSize)
							corball.CorruptSound.PlaybackSpeed = math.random(1, 20) / 10
							corball.CorruptSound:Play()
							local part = hit
							local goal = { Size = Vector3.new(RandomSizeX, RandomSizeY, RandomSizeZ) }
							local tween = tweenService:Create(part, Info, goal)
							tween:Play()
							wait(0.07)
							cooldown = false
						end
					end)
				end
			end,
		},
		["boombox"] = {
			["ListName"] = "boombox/music",
			["Description"] = "Spawn the Boombox. (Client Side Only.)",
			["Aliases"] = { "music" },
			["Function"] = function(args, speaker)
				print("Boombox Spawned, Let's play some tunes! Script Created by Furrtren!~")
				local tool = Instance.new("Tool")
				tool.Name = "Boombox"
				tool.Parent = game:GetService("Players").LocalPlayer.Backpack
				tool.ToolTip = "Boombox. Click to play Music. (Client Side Ver.)"

				-- Set Grips --
				tool.GripForward = Vector3.new(1, 0, 0)
				tool.GripPos = Vector3.new(1, -1.25, 0)
				tool.GripRight = Vector3.new(0, 0, 1)
				tool.GripUp = Vector3.new(0, 1, 0)

				local player = game.Players.LocalPlayer
				local char = player.Character

				-- Construct Boombox Model --
				local boombox = Instance.new("Part", tool)
				boombox.Name = "Handle"
				boombox.Size = Vector3.new(0.795, 2.879, 1.746)
				local boomboxback = Instance.new("Part", char)
				boomboxback.Name = "BoomboxBack"
				boomboxback.Size = Vector3.new(0.795, 2.879, 1.746)
				boomboxback.Transparency = 1

				local boomboxmesh = Instance.new("SpecialMesh", boombox)
				boomboxmesh.MeshId = "rbxassetid://212302951"
				boomboxmesh.TextureId = "rbxassetid://212303049"
				boomboxmesh.Scale = Vector3.new(4, 4, 4)
				local boomboxbackmesh = Instance.new("SpecialMesh", boomboxback)
				boomboxbackmesh.MeshId = "rbxassetid://212302951"
				boomboxbackmesh.TextureId = "rbxassetid://212303049"
				boomboxbackmesh.Scale = Vector3.new(4, 4, 4)

				-- Create Boombox Joints (Edited to support R6 games) --

				local boomboxjoint = Instance.new("Motor6D", boomboxback)
				boomboxjoint.C0 = CFrame.new(
					-0.0731658936,
					-0.0738754272,
					0.844371796,
					-0.707134247,
					-0.707079291,
					0,
					-0.707079291,
					0.707134247,
					0,
					-0,
					0,
					-1
				)
				boomboxjoint.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				if char:FindFirstChild("UpperTorso") then
					boomboxjoint.Part0 = char.UpperTorso
				else
					boomboxjoint.Part0 = char.Torso
				end
				boomboxjoint.Part1 = boomboxback

				-- Create Boombox Sounds --

				local audio = Instance.new("Sound", boombox)
				audio.Volume = 1.4
				audio.SoundId = "rbxassetid://"
				audio.Name = "Sound"
				audio.Looped = true

				local audioback = Instance.new("Sound", boomboxback)
				audioback.Volume = 1.4
				audioback.SoundId = "rbxassetid://"
				audioback.Name = "Sound"
				audioback.Looped = true

				-- Boombox code. --

				local songgui

				tool.Equipped:Connect(function()
					boomboxback.Transparency = 1
					boomboxback.Sound.Volume = 0
					boombox.Sound.Volume = 1.4
					if boomboxback:FindFirstChild("Intro") then
						boombox.Intro.Volume = 1.4
						boombox.Sound.Volume = 1.4
						boomboxback.Sound.Volume = 0
						boomboxback.Transparency = 1
						boomboxback.Intro.Volume = 0
					end
				end)

				tool.Unequipped:Connect(function()
					if boomboxback.Sound.IsPaused == false then
						boomboxback.Transparency = 0
						boomboxback.Sound.Volume = 1.4
						boombox.Sound.Volume = 0
					else
						boomboxback.Transparency = 1
						boomboxback.Sound.Volume = 0
					end
					if boomboxback.Sound.IsLoaded == false then
						boomboxback.Transparency = 1
						boomboxback.Sound.Volume = 0
					end
					if boomboxback:FindFirstChild("Intro") then
						if boomboxback.Intro.IsPaused == false then
							boomboxback.Intro.Volume = 1.4
							boomboxback.Sound.Volume = 1.4
							boomboxback.Transparency = 0
							boombox.Intro.Volume = 0
							boombox.Sound.Volume = 0
						end
					end
				end)

				tool.Unequipped:Connect(function()
					if player.PlayerGui:FindFirstChild("ChooseSongGui") then
						player.PlayerGui.ChooseSongGui:Destroy()
					end
				end)

				tool.Activated:Connect(function()
					if player.PlayerGui:FindFirstChild("ChooseSongGui") then
						return
					end

					local sg = Instance.new("ScreenGui")
					sg.Name = "ChooseSongGui"
					sg.Parent = player.PlayerGui

					local frame = Instance.new("Frame")
					frame.Style = "RobloxRound"
					frame.Size = UDim2.new(0.25, 0, 0.25, 0)
					frame.Position = UDim2.new(0.318, 0, 0.375, 0)
					frame.Parent = sg
					frame.Draggable = true

					local text = Instance.new("TextLabel")
					text.Name = "label"
					text.BackgroundTransparency = 1
					text.TextStrokeTransparency = 0
					text.TextColor3 = Color3.new(1, 1, 1)
					text.Size = UDim2.new(1, 0, 0.6, 0)
					text.TextScaled = true
					text.Text =
						"Lay down the beat!\nPut in the ID number for a song you love that's been uploaded to ROBLOX.\nLeave it blank to stop playing music."
					text.Parent = frame

					local input = Instance.new("TextBox")
					input.Name = "input"
					input.BackgroundColor3 = Color3.new(0, 0, 0)
					input.BackgroundTransparency = 0.5
					input.BorderColor3 = Color3.new(1, 1, 1)
					input.TextColor3 = Color3.new(1, 1, 1)
					input.TextStrokeTransparency = 1
					input.TextScaled = true
					input.Text = "142376088"
					input.Size = UDim2.new(1, 0, 0.2, 0)
					input.Position = UDim2.new(0, 0, 0.6, 0)
					input.Parent = frame

					local button = Instance.new("TextButton")
					button.Name = "play"
					button.Style = "RobloxButton"
					button.Size = UDim2.new(0.727, 0, 0.24, 0)
					button.Position = UDim2.new(0.021, 0, 0.801, 0)
					button.TextColor3 = Color3.new(1, 1, 1)
					button.TextStrokeTransparency = 0
					button.Text = "Play!"
					button.TextScaled = true
					button.Parent = frame
					button.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=" .. input.Text
						audioback.SoundId = "http://www.roblox.com/asset/?id=" .. input.Text
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
						sg:Destroy()
					end)

					local button2 = Instance.new("TextButton")
					button2.Name = "close"
					button2.Style = "RobloxButton"
					button2.Size = UDim2.new(0.276, 0, 0.214, 0)
					button2.Position = UDim2.new(0.745, 0, 0.818, 0)
					button2.TextColor3 = Color3.new(1, 1, 1)
					button2.TextStrokeTransparency = 0
					button2.Text = "Close"
					button2.TextScaled = true
					button2.Parent = frame
					button2.MouseButton1Click:connect(function()
						sg:Destroy()
					end)

					-- Sidebar Buttons --
					local buttonpause = Instance.new("TextButton")
					buttonpause.Name = "pause"
					buttonpause.Style = Enum.ButtonStyle.RobloxButton
					buttonpause.Position = UDim2.new(1.689, 0, 0.25, 0)
					buttonpause.Size = UDim2.new(0.158, 0, 0.272, 0)
					buttonpause.TextColor3 = Color3.new(1, 1, 1)
					buttonpause.RichText = true
					buttonpause.Font = Enum.Font.GothamBlack
					buttonpause.TextScaled = true
					buttonpause.TextStrokeTransparency = 0
					buttonpause.Parent = frame
					buttonpause.Text = "II"
					buttonpause.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							if boombox.Intro.IsPlaying == true then
								boombox.Intro:Pause()
								boomboxback.Intro:Pause()
							else
								boombox.Intro.Volume = 0
								boomboxback.Intro.Volume = 0
							end
						end
						audio:Pause()
						audioback:Pause()
					end)

					local buttonplay = Instance.new("TextButton")
					buttonplay.Name = "resume"
					buttonplay.Style = Enum.ButtonStyle.RobloxButton
					buttonplay.Position = UDim2.new(1.689, 0, 0.506, 0)
					buttonplay.Size = UDim2.new(0.158, 0, 0.272, 0)
					buttonplay.TextColor3 = Color3.new(1, 1, 1)
					buttonplay.RichText = true
					buttonplay.Font = Enum.Font.Legacy
					buttonplay.TextScaled = true
					buttonplay.TextStrokeTransparency = 0
					buttonplay.Parent = frame
					buttonplay.Text = "▶"
					buttonplay.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							if boombox.Intro.Volume == 0 then
							else
								boombox.Intro:Resume()
								boomboxback.Intro:Resume()
							end
						end
						audio:Resume()
						audioback:Resume()
					end)

					local buttonreplay = Instance.new("TextButton")
					buttonreplay.Name = "replay"
					buttonreplay.Style = Enum.ButtonStyle.RobloxButton
					buttonreplay.Position = UDim2.new(1.689, 0, 0.766, 0)
					buttonreplay.Size = UDim2.new(0.158, 0, 0.272, 0)
					buttonreplay.TextColor3 = Color3.new(1, 1, 1)
					buttonreplay.RichText = true
					buttonreplay.Font = Enum.Font.Legacy
					buttonreplay.TextScaled = true
					buttonreplay.TextStrokeTransparency = 0
					buttonreplay.Parent = frame
					buttonreplay.Text = ""
					buttonreplay.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro.TimePosition = 0
							boomboxback.Intro.TimePosition = 0
							boombox.Intro.Volume = 1.4
							audio.TimePosition = 0
							audioback.TimePosition = 0
							audio:Stop()
							audioback:Stop()
							boombox.Intro:Play()
							boomboxback.Intro:Play()
							boombox.Intro.Ended:wait()
							audio:Play()
							audioback:Play()
						end
						audio.TimePosition = 0
						audioback.TimePosition = 0
					end)

					local buttonreplayico = Instance.new("ImageLabel")
					buttonreplayico.Name = "replayico"
					buttonreplayico.Position = UDim2.new(1.706, 0, 0.798, 0)
					buttonreplayico.Size = UDim2.new(0.12, 0, 0.211, 0)
					buttonreplayico.BackgroundTransparency = 1
					buttonreplayico.Image = "rbxassetid://8275375081"
					buttonreplayico.Parent = frame

					-- Custom ADX GUI --

					local adxframe = Instance.new("Frame")
					adxframe.Style = "RobloxRound"
					adxframe.Size = UDim2.new(0.393, 0, 0.111, 0)
					adxframe.Position = UDim2.new(0.33, 0, 0.634, 0)
					adxframe.Parent = sg
					adxframe.Draggable = true
					adxframe.Visible = false

					local adxintroinput = Instance.new("TextBox")
					adxintroinput.Name = "input"
					adxintroinput.BackgroundColor3 = Color3.new(0, 0, 0)
					adxintroinput.BackgroundTransparency = 0.5
					adxintroinput.BorderColor3 = Color3.new(1, 1, 1)
					adxintroinput.TextColor3 = Color3.new(1, 1, 1)
					adxintroinput.TextStrokeTransparency = 1
					adxintroinput.TextScaled = true
					adxintroinput.Text = "6193845123"
					adxintroinput.Size = UDim2.new(0.249, 0, 0.261, 0)
					adxintroinput.Position = UDim2.new(0.018, 0, 0.318, 0)
					adxintroinput.Parent = adxframe

					local adxloopinput = Instance.new("TextBox")
					adxloopinput.Name = "input"
					adxloopinput.BackgroundColor3 = Color3.new(0, 0, 0)
					adxloopinput.BackgroundTransparency = 0.5
					adxloopinput.BorderColor3 = Color3.new(1, 1, 1)
					adxloopinput.TextColor3 = Color3.new(1, 1, 1)
					adxloopinput.TextStrokeTransparency = 1
					adxloopinput.TextScaled = true
					adxloopinput.Text = "6276342741"
					adxloopinput.Size = UDim2.new(0.249, 0, 0.261, 0)
					adxloopinput.Position = UDim2.new(0.293, 0, 0.318, 0)
					adxloopinput.Parent = adxframe

					local customadxlabel = Instance.new("TextLabel")
					customadxlabel.BackgroundTransparency = 1
					customadxlabel.TextStrokeTransparency = 0
					customadxlabel.TextColor3 = Color3.new(1, 1, 1)
					customadxlabel.Size = UDim2.new(0.789, 0, 0.287, 0)
					customadxlabel.Position = UDim2.new(0.103, 0, -0.05, 0)
					customadxlabel.TextScaled = true
					customadxlabel.Text = "CustomAdx Menu"
					customadxlabel.Parent = adxframe

					local adxintrolabel = Instance.new("TextLabel")
					adxintrolabel.BackgroundTransparency = 1
					adxintrolabel.TextStrokeTransparency = 0
					adxintrolabel.TextColor3 = Color3.new(1, 1, 1)
					adxintrolabel.Size = UDim2.new(0.238, 0, 0.235, 0)
					adxintrolabel.Position = UDim2.new(0.02, 0, 0.691, 0)
					adxintrolabel.TextScaled = true
					adxintrolabel.Text = "Intro"
					adxintrolabel.Parent = adxframe

					local adxlooplabel = Instance.new("TextLabel")
					adxlooplabel.BackgroundTransparency = 1
					adxlooplabel.TextStrokeTransparency = 0
					adxlooplabel.TextColor3 = Color3.new(1, 1, 1)
					adxlooplabel.Size = UDim2.new(0.238, 0, 0.235, 0)
					adxlooplabel.Position = UDim2.new(0.295, 0, 0.691, 0)
					adxlooplabel.TextScaled = true
					adxlooplabel.Text = "Loop"
					adxlooplabel.Parent = adxframe

					local button = Instance.new("TextButton")
					button.Name = "play"
					button.Style = "RobloxButton"
					button.Size = UDim2.new(0.368, 0, 0.648, 0)
					button.Position = UDim2.new(0.591, 0, 0.217, 0)
					button.TextColor3 = Color3.new(1, 1, 1)
					button.TextStrokeTransparency = 0
					button.Text = "Play!"
					button.TextScaled = true
					button.Parent = adxframe
					button.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=" .. adxintroinput.Text
						introback.SoundId = "http://www.roblox.com/asset/?id=" .. adxintroinput.Text
						audio.SoundId = "http://www.roblox.com/asset/?id=" .. adxloopinput.Text
						audioback.SoundId = "http://www.roblox.com/asset/?id=" .. adxloopinput.Text
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local adxbutton = Instance.new("TextButton")
					adxbutton.Name = "adx"
					adxbutton.Style = Enum.ButtonStyle.RobloxButton
					adxbutton.Position = UDim2.new(-0.178, 0, 0.766, 0)
					adxbutton.Size = UDim2.new(0.158, 0, 0.272, 0)
					adxbutton.TextColor3 = Color3.new(1, 1, 1)
					adxbutton.RichText = true
					adxbutton.Font = Enum.Font.Legacy
					adxbutton.TextScaled = true
					adxbutton.TextStrokeTransparency = 0
					adxbutton.Parent = frame
					adxbutton.Text = "ADX"
					adxbutton.MouseButton1Click:connect(function()
						if adxframe.Visible == false then
							adxframe.Visible = true
						else
							adxframe.Visible = false
						end
					end)

					-- Audio Tools GUI --

					local toolsgui = Instance.new("Frame")
					toolsgui.Style = "RobloxRound"
					toolsgui.Size = UDim2.new(0.478, 0, 0.111, 0)
					toolsgui.Position = UDim2.new(0.283, 0, 0.256, 0)
					toolsgui.Parent = sg
					toolsgui.Draggable = true
					toolsgui.Visible = false

					local toolsplaybackinput = Instance.new("TextBox")
					toolsplaybackinput.Name = "input"
					toolsplaybackinput.BackgroundColor3 = Color3.new(0, 0, 0)
					toolsplaybackinput.BackgroundTransparency = 0.5
					toolsplaybackinput.BorderColor3 = Color3.new(1, 1, 1)
					toolsplaybackinput.TextColor3 = Color3.new(1, 1, 1)
					toolsplaybackinput.TextStrokeTransparency = 1
					toolsplaybackinput.TextScaled = true
					toolsplaybackinput.Text = "1"
					toolsplaybackinput.Size = UDim2.new(0.173, 0, 0.269, 0)
					toolsplaybackinput.Position = UDim2.new(-0, 0, 0.027, 0)
					toolsplaybackinput.Parent = toolsgui

					local playbackbutton = Instance.new("TextButton")
					playbackbutton.Name = "play"
					playbackbutton.Style = "RobloxButton"
					playbackbutton.Size = UDim2.new(0.139, 0, 0.235, 0)
					playbackbutton.Position = UDim2.new(0.015, 0, 0.4, 0)
					playbackbutton.TextColor3 = Color3.new(1, 1, 1)
					playbackbutton.TextStrokeTransparency = 0
					playbackbutton.Text = "Playback Speed"
					playbackbutton.TextScaled = false
					playbackbutton.Parent = toolsgui
					playbackbutton.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro.PlaybackSpeed = toolsplaybackinput.Text
							boomboxback.Intro.PlaybackSpeed = toolsplaybackinput.Text
						end
						audio.PlaybackSpeed = toolsplaybackinput.Text
						audioback.PlaybackSpeed = toolsplaybackinput.Text
					end)

					local toolsvolumeinput = Instance.new("TextBox")
					toolsvolumeinput.Name = "input"
					toolsvolumeinput.BackgroundColor3 = Color3.new(0, 0, 0)
					toolsvolumeinput.BackgroundTransparency = 0.5
					toolsvolumeinput.BorderColor3 = Color3.new(1, 1, 1)
					toolsvolumeinput.TextColor3 = Color3.new(1, 1, 1)
					toolsvolumeinput.TextStrokeTransparency = 1
					toolsvolumeinput.TextScaled = true
					toolsvolumeinput.Text = "1.4"
					toolsvolumeinput.Size = UDim2.new(0.173, 0, 0.269, 0)
					toolsvolumeinput.Position = UDim2.new(0.19, 0, 0.027, 0)
					toolsvolumeinput.Parent = toolsgui

					local volumebutton = Instance.new("TextButton")
					volumebutton.Name = "play"
					volumebutton.Style = "RobloxButton"
					volumebutton.Size = UDim2.new(0.139, 0, 0.235, 0)
					volumebutton.Position = UDim2.new(0.205, 0, 0.4, 0)
					volumebutton.TextColor3 = Color3.new(1, 1, 1)
					volumebutton.TextStrokeTransparency = 0
					volumebutton.Text = "Volume"
					volumebutton.TextScaled = false
					volumebutton.Parent = toolsgui
					volumebutton.MouseButton1Click:connect(function()
						audio.Volume = toolsvolumeinput.Text
						audioback.Volume = toolsvolumeinput.Text
					end)

					local toolsdeviceinput = Instance.new("TextBox")
					toolsdeviceinput.Name = "input"
					toolsdeviceinput.BackgroundColor3 = Color3.new(0, 0, 0)
					toolsdeviceinput.BackgroundTransparency = 0.5
					toolsdeviceinput.BorderColor3 = Color3.new(1, 1, 1)
					toolsdeviceinput.TextColor3 = Color3.new(1, 1, 1)
					toolsdeviceinput.TextStrokeTransparency = 1
					toolsdeviceinput.TextScaled = true
					toolsdeviceinput.Text = "uuhhh.mp3"
					toolsdeviceinput.Size = UDim2.new(0.512, 0, 0.415, 0)
					toolsdeviceinput.Position = UDim2.new(0.433, 0, 0, 0)
					toolsdeviceinput.Parent = toolsgui

					local devicebutton = Instance.new("TextButton")
					devicebutton.Name = "play"
					devicebutton.Style = "RobloxButton"
					devicebutton.Size = UDim2.new(0.406, 0, 0.455, 0)
					devicebutton.Position = UDim2.new(0.484, 0, 0.455, 0)
					devicebutton.TextColor3 = Color3.new(1, 1, 1)
					devicebutton.TextStrokeTransparency = 0
					devicebutton.Text = "Play!"
					devicebutton.TextScaled = true
					devicebutton.Parent = toolsgui
					devicebutton.MouseButton1Click:connect(function()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "rbxasset://sounds//" .. toolsdeviceinput.Text
						audioback.SoundId = "rbxasset://sounds//" .. toolsdeviceinput.Text
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
						sg:Destroy()
					end)

					local toolbutton = Instance.new("TextButton")
					toolbutton.Name = "tool"
					toolbutton.Style = Enum.ButtonStyle.RobloxButton
					toolbutton.Position = UDim2.new(-0.178, 0, 0.506, 0)
					toolbutton.Size = UDim2.new(0.158, 0, 0.272, 0)
					toolbutton.TextColor3 = Color3.new(1, 1, 1)
					toolbutton.Font = Enum.Font.Legacy
					toolbutton.TextScaled = true
					toolbutton.TextStrokeTransparency = 0
					toolbutton.Parent = frame
					toolbutton.Text = "TOOL"
					toolbutton.MouseButton1Click:connect(function()
						if toolsgui.Visible == false then
							toolsgui.Visible = true
						else
							toolsgui.Visible = false
						end
					end)

					local audiotoolslabel = Instance.new("TextLabel")
					audiotoolslabel.BackgroundTransparency = 1
					audiotoolslabel.TextStrokeTransparency = 0
					audiotoolslabel.TextColor3 = Color3.new(1, 1, 1)
					audiotoolslabel.Size = UDim2.new(0.789, 0, 0.287, 0)
					audiotoolslabel.Position = UDim2.new(-0.304, 0, -0.408, 0)
					audiotoolslabel.TextScaled = true
					audiotoolslabel.Text = "Audio Tools"
					audiotoolslabel.Parent = toolsgui

					local pfsoundslabel = Instance.new("TextLabel")
					pfsoundslabel.BackgroundTransparency = 1
					pfsoundslabel.TextStrokeTransparency = 0
					pfsoundslabel.TextColor3 = Color3.new(1, 1, 1)
					pfsoundslabel.Size = UDim2.new(0.339, 0, 0.235, 0)
					pfsoundslabel.Position = UDim2.new(0.522, 0, -0.379, 0)
					pfsoundslabel.TextScaled = true
					pfsoundslabel.Text = "Play Audio from Sounds"
					pfsoundslabel.Parent = toolsgui

					-- Built in Audio GUI --

					local biframe = Instance.new("Frame")
					biframe.Style = "RobloxRound"
					biframe.Size = UDim2.new(0.164, 0, 0.25, 0)
					biframe.Position = UDim2.new(0.566, 0, 0.375, 0)
					biframe.Parent = sg
					biframe.Draggable = true

					local biaudiolabel = Instance.new("TextLabel")
					biaudiolabel.BackgroundTransparency = 1
					biaudiolabel.TextStrokeTransparency = 0
					biaudiolabel.TextColor3 = Color3.new(1, 1, 1)
					biaudiolabel.Size = UDim2.new(0.878, 0, 0.136, 0)
					biaudiolabel.Position = UDim2.new(0.056, 0, 0.006, 0)
					biaudiolabel.TextScaled = true
					biaudiolabel.Text = "Built In Audio"
					biaudiolabel.Parent = biframe

					local audiolist = Instance.new("ScrollingFrame")
					audiolist.BackgroundTransparency = 0.5
					audiolist.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
					audiolist.BorderColor3 = Color3.fromRGB(0, 0, 0)
					audiolist.BorderSizePixel = 2
					audiolist.Size = UDim2.new(0.95, 0, 0.8, 0)
					audiolist.Position = UDim2.new(0.031, 0, 0.172, 0)
					audiolist.Parent = biframe
					audiolist.CanvasSize = UDim2.new(0, 0, 4, 0)

					local uilistlayout = Instance.new("UIListLayout")
					uilistlayout.Parent = audiolist
					uilistlayout.FillDirection = Enum.FillDirection.Vertical
					uilistlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
					uilistlayout.VerticalAlignment = Enum.VerticalAlignment.Top

					local aspectratio = Instance.new("UIAspectRatioConstraint")
					aspectratio.AspectRatio = 8
					aspectratio.AspectType = Enum.AspectType.ScaleWithParentSize
					aspectratio.DominantAxis = Enum.DominantAxis.Width

					local alist_button = Instance.new("TextButton")
					aspectratio.Parent = alist_button
					alist_button.Size = UDim2.new(0, 200, 0, 50)
					alist_button.Style = "RobloxButton"
					alist_button.TextColor3 = Color3.new(1, 1, 1)
					alist_button.TextStrokeTransparency = 0
					alist_button.Font = Enum.Font.SourceSans
					alist_button.TextScaled = false
					alist_button.TextSize = 14

					-- Built in Audio Buttons --

					local alist_PowerPlantADX = alist_button:Clone()
					alist_PowerPlantADX.Parent = audiolist
					alist_PowerPlantADX.Text = "Power Plant (ADX)"
					alist_PowerPlantADX.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=8268367871"
						introback.SoundId = "http://www.roblox.com/asset/?id=8268367871"
						audio.SoundId = "http://www.roblox.com/asset/?id=8159561519"
						audioback.SoundId = "http://www.roblox.com/asset/?id=8159561519"
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local alist_PowerSneakersADX = alist_button:Clone()
					alist_PowerSneakersADX.Parent = audiolist
					alist_PowerSneakersADX.Text = "Power Sneakers (ADX)"
					alist_PowerSneakersADX.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=8201983434"
						introback.SoundId = "http://www.roblox.com/asset/?id=8201983434"
						audio.SoundId = "http://www.roblox.com/asset/?id=8201983710"
						audioback.SoundId = "http://www.roblox.com/asset/?id=8201983710"
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local alist_SevenRingsADX = alist_button:Clone()
					alist_SevenRingsADX.Parent = audiolist
					alist_SevenRingsADX.Text = "Seven Rings in Hand (ADX)"
					alist_SevenRingsADX.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=8155093188"
						introback.SoundId = "http://www.roblox.com/asset/?id=8155093188"
						audio.SoundId = "http://www.roblox.com/asset/?id=8155094094"
						audioback.SoundId = "http://www.roblox.com/asset/?id=8155094094"
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local alist_SevenRings8BitADX = alist_button:Clone()
					alist_SevenRings8BitADX.Parent = audiolist
					alist_SevenRings8BitADX.Text = "SRIH (16 Bit)(ADX)"
					alist_SevenRings8BitADX.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=8154430094"
						introback.SoundId = "http://www.roblox.com/asset/?id=8154430094"
						audio.SoundId = "http://www.roblox.com/asset/?id=8154429652"
						audioback.SoundId = "http://www.roblox.com/asset/?id=8154429652"
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local alist_VolcValADX = alist_button:Clone()
					alist_VolcValADX.Parent = audiolist
					alist_VolcValADX.Text = "Volcano Valley (ADX)"
					alist_VolcValADX.MouseButton1Click:connect(function()
						-- ADX Handle Intro --
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio:Stop()
						audioback:Stop()
						local intro = Instance.new("Sound", boombox)
						local introback = Instance.new("Sound", boomboxback)
						intro.Name = "Intro"
						intro.Volume = 1.4
						introback.Name = "Intro"
						introback.Volume = 0
						intro.SoundId = "http://www.roblox.com/asset/?id=7807933691"
						introback.SoundId = "http://www.roblox.com/asset/?id=7807933691"
						audio.SoundId = "http://www.roblox.com/asset/?id=5269982340"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5269982340"
						intro:Play()
						introback:Play()
						intro.Ended:Wait()
						-- ADX Handle Loop --
						audio:Play()
						audioback:Play()
					end)

					local alist_SummerDay = alist_button:Clone()
					alist_SummerDay.Parent = audiolist
					alist_SummerDay.Text = "Summer Day"
					alist_SummerDay.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=8154889199"
						audioback.SoundId = "http://www.roblox.com/asset/?id=8154889199"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_CodemastersTheme = alist_button:Clone()
					alist_CodemastersTheme.Parent = audiolist
					alist_CodemastersTheme.Text = "Codemaster's Theme"
					alist_CodemastersTheme.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6489332119"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6489332119"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_columndive = alist_button:Clone()
					alist_columndive.Parent = audiolist
					alist_columndive.Text = "Column Dive"
					alist_columndive.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=3070007695"
						audioback.SoundId = "http://www.roblox.com/asset/?id=3070007695"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_thevoidfinal = alist_button:Clone()
					alist_thevoidfinal.Parent = audiolist
					alist_thevoidfinal.Text = "the_void_final"
					alist_thevoidfinal.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=3375948564"
						audioback.SoundId = "http://www.roblox.com/asset/?id=3375948564"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_lobby = alist_button:Clone()
					alist_lobby.Parent = audiolist
					alist_lobby.Text = "Lobby"
					alist_lobby.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5095464524"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5095464524"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_lobby = alist_button:Clone()
					alist_lobby.Parent = audiolist
					alist_lobby.Text = "Look Closely"
					alist_lobby.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5650944938"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5650944938"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_snowday = alist_button:Clone()
					alist_snowday.Parent = audiolist
					alist_snowday.Text = "snow_day"
					alist_snowday.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=7767720401"
						audioback.SoundId = "http://www.roblox.com/asset/?id=7767720401"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_spire = alist_button:Clone()
					alist_spire.Parent = audiolist
					alist_spire.Text = "spire"
					alist_spire.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=3870757920"
						audioback.SoundId = "http://www.roblox.com/asset/?id=3870757920"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_segacdusa = alist_button:Clone()
					alist_segacdusa.Parent = audiolist
					alist_segacdusa.Text = "BIOS USA"
					alist_segacdusa.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5648384323"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5648384323"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_segacdeur = alist_button:Clone()
					alist_segacdeur.Parent = audiolist
					alist_segacdeur.Text = "BIOS PAL"
					alist_segacdeur.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5648385624"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5648385624"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_blastcredits = alist_button:Clone()
					alist_blastcredits.Parent = audiolist
					alist_blastcredits.Text = "blast_credits"
					alist_blastcredits.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=4689304431"
						audioback.SoundId = "http://www.roblox.com/asset/?id=4689304431"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_wiiplay = alist_button:Clone()
					alist_wiiplay.Parent = audiolist
					alist_wiiplay.Text = "Wii Play Main Menu"
					alist_wiiplay.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6945737895"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6945737895"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_snowdayold = alist_button:Clone()
					alist_snowdayold.Parent = audiolist
					alist_snowdayold.Text = "snow_day_old"
					alist_snowdayold.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=4104992126"
						audioback.SoundId = "http://www.roblox.com/asset/?id=4104992126"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_dmdust = alist_button:Clone()
					alist_dmdust.Parent = audiolist
					alist_dmdust.Text = "Diamond Dust"
					alist_dmdust.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=4686859760"
						audioback.SoundId = "http://www.roblox.com/asset/?id=4686859760"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_s3poison = alist_button:Clone()
					alist_s3poison.Parent = audiolist
					alist_s3poison.Text = "S3 Poison"
					alist_s3poison.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=4448778578"
						audioback.SoundId = "http://www.roblox.com/asset/?id=4448778578"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_mgz = alist_button:Clone()
					alist_mgz.Parent = audiolist
					alist_mgz.Text = "Mad Gear Zone"
					alist_mgz.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6594134702"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6594134702"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_shz = alist_button:Clone()
					alist_shz.Parent = audiolist
					alist_shz.Text = "Sunset Dash"
					alist_shz.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6648199444"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6648199444"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_llz = alist_button:Clone()
					alist_llz.Parent = audiolist
					alist_llz.Text = "Lost Labyrinth Zone"
					alist_llz.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6651413216"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6651413216"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_ssr = alist_button:Clone()
					alist_ssr.Parent = audiolist
					alist_ssr.Text = "Super Sonic Racing"
					alist_ssr.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=1448689113"
						audioback.SoundId = "http://www.roblox.com/asset/?id=1448689113"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_inlet = alist_button:Clone()
					alist_inlet.Parent = audiolist
					alist_inlet.Text = "Wave Ocean (The Inlet)"
					alist_inlet.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=2514010664"
						audioback.SoundId = "http://www.roblox.com/asset/?id=2514010664"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_whatuneed = alist_button:Clone()
					alist_whatuneed.Parent = audiolist
					alist_whatuneed.Text = "What U Need"
					alist_whatuneed.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6138566925"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6138566925"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_sdc1 = alist_button:Clone()
					alist_sdc1.Parent = audiolist
					alist_sdc1.Text = "Shades 4 Dogs"
					alist_sdc1.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=7534538713"
						audioback.SoundId = "http://www.roblox.com/asset/?id=7534538713"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_palacefound = alist_button:Clone()
					alist_palacefound.Parent = audiolist
					alist_palacefound.Text = "The Palace That Was Found"
					alist_palacefound.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=250806507"
						audioback.SoundId = "http://www.roblox.com/asset/?id=250806507"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_newday = alist_button:Clone()
					alist_newday.Parent = audiolist
					alist_newday.Text = "A New Day"
					alist_newday.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5864837500"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5864837500"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_back2back = alist_button:Clone()
					alist_back2back.Parent = audiolist
					alist_back2back.Text = "Back 2 Back"
					alist_back2back.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=920407379"
						audioback.SoundId = "http://www.roblox.com/asset/?id=920407379"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_nowaythrough = alist_button:Clone()
					alist_nowaythrough.Parent = audiolist
					alist_nowaythrough.Text = "No Way Through"
					alist_nowaythrough.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=6686718842"
						audioback.SoundId = "http://www.roblox.com/asset/?id=6686718842"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_kotw = alist_button:Clone()
					alist_kotw.Parent = audiolist
					alist_kotw.Text = "Knight of the Wind"
					alist_kotw.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=1154723340"
						audioback.SoundId = "http://www.roblox.com/asset/?id=1154723340"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_fight = alist_button:Clone()
					alist_fight.Parent = audiolist
					alist_fight.Text = "Fight the Knight"
					alist_fight.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=145795186"
						audioback.SoundId = "http://www.roblox.com/asset/?id=145795186"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_fightingonward = alist_button:Clone()
					alist_fightingonward.Parent = audiolist
					alist_fightingonward.Text = "Fighting Onward"
					alist_fightingonward.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=5241903479"
						audioback.SoundId = "http://www.roblox.com/asset/?id=5241903479"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_emeraldbeach = alist_button:Clone()
					alist_emeraldbeach.Parent = audiolist
					alist_emeraldbeach.Text = "Emerald Beach"
					alist_emeraldbeach.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=159950626"
						audioback.SoundId = "http://www.roblox.com/asset/?id=159950626"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_letthespeed = alist_button:Clone()
					alist_letthespeed.Parent = audiolist
					alist_letthespeed.Text = "Let The Speed Mend It"
					alist_letthespeed.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=1486109549"
						audioback.SoundId = "http://www.roblox.com/asset/?id=1486109549"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_sonicheroes = alist_button:Clone()
					alist_sonicheroes.Parent = audiolist
					alist_sonicheroes.Text = "Sonic Heroes"
					alist_sonicheroes.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=686831609"
						audioback.SoundId = "http://www.roblox.com/asset/?id=686831609"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_hisworld = alist_button:Clone()
					alist_hisworld.Parent = audiolist
					alist_hisworld.Text = "His World"
					alist_hisworld.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=2780064247"
						audioback.SoundId = "http://www.roblox.com/asset/?id=2780064247"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)

					local alist_ycda = alist_button:Clone()
					alist_ycda.Parent = audiolist
					alist_ycda.Text = "You Can Do Anything"
					alist_ycda.MouseButton1Click:connect(function()
						sg:Destroy()
						if boombox:FindFirstChild("Intro") then
							boombox.Intro:Destroy()
							boomboxback.Intro:Destroy()
						end
						audio.Volume = 1.4
						audioback.Volume = 0
						audio.SoundId = "http://www.roblox.com/asset/?id=1489947299"
						audioback.SoundId = "http://www.roblox.com/asset/?id=1489947299"
						audio.TimePosition = 0
						audioback.TimePosition = 0
						audio:Play()
						audioback:Play()
					end)
				end)

				-- Create Boombox Back Tween --
				local tweenService = game:GetService("TweenService")
				local Info = TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true, 0)
				while true do
					wait(0.7)
					local part = boomboxback.Mesh
					local goal = { Scale = Vector3.new(4.2, 4.2, 4.2) }
					local tween = tweenService:Create(part, Info, goal)
					tween:Play()
				end
			end,
		},
		["explode"] = {
			["ListName"] = "explode/boom",
			["Description"] = "Explode yourself.",
			["Aliases"] = { "boom" },
			["Function"] = function(args, speaker)
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				local hrp = char.HumanoidRootPart

				-- Kill Player --

				char.Humanoid.Health = 0
				char.Humanoid:RemoveAccessories()
				char:BreakJoints() -- Extra, just incase if the game is fucking stupid and wont let you explode.
				char.Humanoid:Destroy()

				-- Create Explosion Effect --

				local explosion = Instance.new("Explosion", hrp)
				explosion.BlastPressure = 5000
				explosion.BlastRadius = 400
				explosion.DestroyJointRadiusPercent = 0
				if char:FindFirstChild("UpperTorso") then
					explosion.Position = char.UpperTorso.Position
				else
					explosion.Position = char.Torso.Position
				end

				-- Sounds --

				local explodesnd = Instance.new("Sound", hrp)
				explodesnd.Volume = 1.3
				explodesnd.SoundId = "rbxassetid://157878578"
				explodesnd.Name = "Boom"
				explodesnd:Play()

				local splatter = Instance.new("Sound", hrp)
				splatter.Volume = 2
				splatter.SoundId = "rbxassetid://429400881"
				splatter.Name = "Die"
				splatter:Play()

				-- Particles --

				local blood1 = Instance.new("ParticleEmitter")

				blood1.Texture = "rbxassetid://73547327"

				local colorKeypoints = {
					-- API: ColorSequenceKeypoint.new(time, color)
					ColorSequenceKeypoint.new(0, Color3.new(0.666667, 0, 0)), -- At t=0, White
					ColorSequenceKeypoint.new(1, Color3.new(0.423529, 0, 0)), -- At t=1, Red
				}

				blood1.Color = ColorSequence.new(colorKeypoints)
				blood1.LightEmission = 0.4
				blood1.LightInfluence = 1

				local numberKeypoints = {
					-- API: NumberSequenceKeypoint.new(time, size, envelop)
					NumberSequenceKeypoint.new(0, 0.1), -- At t=0, fully transparent
					NumberSequenceKeypoint.new(0.397, 0.144), -- At t=.1, fully opaque
					NumberSequenceKeypoint.new(0.503, 0.494), -- At t=.5, mostly opaque
					NumberSequenceKeypoint.new(1, 1), -- At t=1, fully transparent
				}

				blood1.Transparency = NumberSequence.new(numberKeypoints)

				local numberKeypoints2 = {
					NumberSequenceKeypoint.new(0, 0), -- At t=0, size of 0
					NumberSequenceKeypoint.new(1, 2.87), -- At t=1, size of 10
				}
				blood1.Size = NumberSequence.new(numberKeypoints2)

				blood1.ZOffset = 0
				blood1.EmissionDirection = Enum.NormalId.Front
				blood1.Speed = NumberRange.new(5, 10)
				blood1.Lifetime = NumberRange.new(0.3, 0.5)
				blood1.Rate = 10000000
				blood1.Rotation = NumberRange.new(-360, 360)
				blood1.RotSpeed = NumberRange.new(-40, 270)
				blood1.SpreadAngle = Vector2.new(360, 360)
				blood1.Acceleration = Vector3.new(0, -5, 0)
				blood1.LockedToPart = false
				blood1.TimeScale = 1

				blood1.Name = "Blood"

				local blood2 = Instance.new("ParticleEmitter")

				blood2.Texture = "rbxassetid://134531274"

				local colorKeypoints = {
					-- API: ColorSequenceKeypoint.new(time, color)
					ColorSequenceKeypoint.new(0, Color3.new(0.45098, 0, 0)), -- At t=0, White
					ColorSequenceKeypoint.new(1, Color3.new(0.45098, 0, 0)), -- At t=1, Red
				}

				blood2.Color = ColorSequence.new(colorKeypoints)
				blood2.LightEmission = 0.4
				blood2.LightInfluence = 1

				local numberKeypoints = {
					-- API: NumberSequenceKeypoint.new(time, size, envelop)
					NumberSequenceKeypoint.new(0, 0.3), -- At t=0, fully transparent
					NumberSequenceKeypoint.new(1, 0.3), -- At t=1, fully transparent
				}

				blood2.Transparency = NumberSequence.new(numberKeypoints)

				local numberKeypoints2 = {
					NumberSequenceKeypoint.new(0, 0.125, 0.125), -- At t=0, size of 0
					NumberSequenceKeypoint.new(1, 0, 0), -- At t=1, size of 10
				}
				blood2.Size = NumberSequence.new(numberKeypoints2)

				blood2.ZOffset = 1
				blood2.EmissionDirection = Enum.NormalId.Front
				blood2.Speed = NumberRange.new(5, 14)
				blood2.Lifetime = NumberRange.new(0.5, 1.5)
				blood2.Rate = 100000
				blood2.Rotation = NumberRange.new(0, 0)
				blood2.RotSpeed = NumberRange.new(0, 0)
				blood2.SpreadAngle = Vector2.new(360, 360)
				blood2.Acceleration = Vector3.new(0, -20, 0)
				blood2.LockedToPart = false
				blood2.TimeScale = 1

				blood2.Name = "Blood2"

				local blood3 = Instance.new("ParticleEmitter")

				blood3.Texture = "rbxassetid://241779220"

				local colorKeypoints = {
					-- API: ColorSequenceKeypoint.new(time, color)
					ColorSequenceKeypoint.new(0, Color3.new(0.486275, 0, 0)), -- At t=0, White
					ColorSequenceKeypoint.new(1, Color3.new(0.258824, 0, 0)), -- At t=1, Red
				}

				blood3.Color = ColorSequence.new(colorKeypoints)
				blood3.LightEmission = 0.4
				blood3.LightInfluence = 1

				local numberKeypoints = {
					-- API: NumberSequenceKeypoint.new(time, size, envelop)
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.0976, 0.488),
					NumberSequenceKeypoint.new(0.402, 0.756),
					NumberSequenceKeypoint.new(1, 1),
				}

				blood3.Transparency = NumberSequence.new(numberKeypoints)

				local numberKeypoints2 = {
					NumberSequenceKeypoint.new(0, 0), -- At t=0, size of 0
					NumberSequenceKeypoint.new(1, 2.87), -- At t=1, size of 10
				}
				blood3.Size = NumberSequence.new(numberKeypoints2)

				blood3.ZOffset = 0.5
				blood3.EmissionDirection = Enum.NormalId.Front
				blood3.Speed = NumberRange.new(3, 7)
				blood3.Lifetime = NumberRange.new(0.4, 1)
				blood3.Rate = 3000
				blood3.Rotation = NumberRange.new(-360, 360)
				blood3.RotSpeed = NumberRange.new(-40, 270)
				blood3.SpreadAngle = Vector2.new(360, 360)
				blood3.Acceleration = Vector3.new(0, -20, 0)
				blood3.LockedToPart = false
				blood3.TimeScale = 1

				blood3.Name = "Blood3"

				workspace.CurrentCamera.CameraSubject = char.Head
				-- Velocity & Coloring --
				local child = char:GetChildren()
				for i, v in pairs(child) do
					if v:IsA("BasePart") then
						local VelocityX = math.random(15, 30)
						local VelocityY = math.random(15, 60)
						local VelocityZ = math.random(15, 30)
						v.Velocity = Vector3.new(VelocityX, VelocityY, VelocityZ)
						v.Color = Color3.new(0.458824, 0, 0)
						v.Material = Enum.Material.Pebble
						v.CanCollide = true
					end
				end
				-- Blood --
				local child = char:GetChildren()
				for i, v in pairs(child) do
					if v:IsA("BasePart") then
						local blood1 = blood1:Clone()
						blood1.Parent = v
						local blood2 = blood2:Clone()
						blood2.Parent = v
						local blood3 = blood3:Clone()
						blood3.Parent = v
					end
				end
				wait(0.3)
				-- Disable Blood After 0.3 Seconds. --
				local child = char:GetChildren()
				for i, v in pairs(child) do
					if v:IsA("BasePart") then
						v.Blood.Enabled = false
						v.Blood2.Enabled = false
						v.Blood3.Enabled = false
					end
				end
			end,
		},
		["fuckmap"] = {
			["ListName"] = "fuckmap",
			["Description"] = "Corrupt the workspace.",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				-- Play the sound per part & Call upon the TweenService --
				local corruptsnd = Instance.new("Sound", workspace)
				corruptsnd.Volume = 1
				corruptsnd.SoundId = "rbxassetid://7534241209"
				corruptsnd.Name = "CorruptSound"

				local tweenService = game:GetService("TweenService")
				local Info = TweenInfo.new(0.1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0)

				local child = workspace:GetDescendants()
				for i, v in pairs(child) do
					if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
						if v.Locked == false then
							local RandomSizeX = math.random(1, 1000) / 10
							local RandomSizeY = math.random(1, 1000) / 10
							local RandomSizeZ = math.random(1, 1000) / 10
							corruptsnd.PlaybackSpeed = math.random(1, 20) / 10
							corruptsnd:Play()
							local part = v
							local goal = { Size = Vector3.new(RandomSizeX, RandomSizeY, RandomSizeZ) }
							local tween = tweenService:Create(part, Info, goal)
							tween:Play()
						end
					end
				end
			end,
		},
		["slowmo"] = {
			["ListName"] = "slowmo",
			["Description"] = "Put your character in Slow Motion. (Affects Animations, Particles, and Sounds.) (May cause lag.)",
			["Aliases"] = { "" },
			["Function"] = function(args, speaker)
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				local slowval = Instance.new("BoolValue")
				slowval.Parent = player.Backpack
				slowval.Name = "FurrTools_SlowMo"
				slowval.Value = true

				while true do
					wait()
					if slowval.Value == true then
						local AnimTracks = char.Humanoid:GetPlayingAnimationTracks()
						for i, track in pairs(AnimTracks) do
							local anim = track
							anim:AdjustSpeed(0.5)
							local c = char.HumanoidRootPart:GetChildren()
							for i = 1, #c do
								if c[i].className == "Sound" then
									c[i].PlaybackSpeed = 0.5
								end
								local c = char:GetDescendants()
								for i = 1, #c do
									if c[i].className == "ParticleEmitter" then
										c[i].TimeScale = 0.5
									end
								end
							end
						end
					end
				end
			end,
		},
		["unslowmo"] = {
			["ListName"] = "unslowmo/noslowmo",
			["Description"] = "Reverse Slow Motion Effects.",
			["Aliases"] = { "noslowmo" },
			["Function"] = function(args, speaker)
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character

				if player.Backpack:FindFirstChild("FurrTools_SlowMo") then
					player.Backpack.FurrTools_SlowMo.Value = false
					player.Backpack.FurrTools_SlowMo:Destroy()
					local AnimTracks = char.Humanoid:GetPlayingAnimationTracks()
					for i, track in pairs(AnimTracks) do
						local anim = track
						anim:AdjustSpeed(1)
						local c = char.HumanoidRootPart:GetChildren()
						for i = 1, #c do
							if c[i].className == "Sound" then
								c[i].PlaybackSpeed = 1
							end
							local c = char:GetDescendants()
							for i = 1, #c do
								if c[i].className == "ParticleEmitter" then
									c[i].TimeScale = 1
								end
							end
						end
					end
				end
			end,
		},

		["fuckchar"] = {
			["ListName"] = "fuckchar/fuckme/fuckplr",
			["Description"] = "Corrupt your character.",
			["Aliases"] = { "fuckme", "fuckplr" },
			["Function"] = function(args, speaker)
				local player = game:GetService("Players").LocalPlayer

				-- Play the sound per part & Call upon the TweenService --
				local corruptsnd = Instance.new("Sound", workspace)
				corruptsnd.Volume = 1
				corruptsnd.SoundId = "rbxassetid://7534241209"
				corruptsnd.Name = "CorruptSound"

				local tweenService = game:GetService("TweenService")
				local Info = TweenInfo.new(0.1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0)

				local child = player.Character:GetDescendants()
				for i, v in pairs(child) do
					if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
						if v.Locked == false then
							local RandomSizeX = math.random(1, 1000) / 10
							local RandomSizeY = math.random(1, 1000) / 10
							local RandomSizeZ = math.random(1, 1000) / 10
							corruptsnd.PlaybackSpeed = math.random(1, 20) / 10
							corruptsnd:Play()
							local part = v
							local goal = { Size = Vector3.new(RandomSizeX, RandomSizeY, RandomSizeZ) }
							local tween = tweenService:Create(part, Info, goal)
							tween:Play()
						end
					end
				end
			end,
		},
	},
}

return Plugin
