return {
	["PluginName"] = "Minion Meme",
	["PluginDescription"] = "this is funny (Empire#4946)",
	["Commands"] = {
		["minionmeme"] = {
			["ListName"] = "minionmeme / minionm / minm",
			["Description"] = "Opens up a GUI that is minion memes",
			["Aliases"] = { "minionm", "minm" },
			["Function"] = function(args, speaker)
				local ScreenGui = Instance.new("ScreenGui")
				local ImageLabel = Instance.new("ImageLabel")

				ScreenGui.Name =
					". Ç¤Ò‰Ì·Ò‰ÌµÒ‰Ì¸Ò‰Ì·Ò‰ÌµÒ‰Ì¸Ò‰Ì¡Ò‰Ì¡Ò‰Ì¼Ò‰Ì±Ò‰ÍŽÒ‰ÍŽÒ‰ÌžÒ‰Ì¼Ò‰Ì±Ò‰ÍŽÒ‰ÍŽÒ‰ÌžÒ‰Í¤Ò‰Í¬Ò‰Ì…Ò‰Í¤Ò‰Í¬"
				ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				ScreenGui.ResetOnSpawn = false

				ImageLabel.Parent = ScreenGui
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.Position = UDim2.new(0.211329371, 0, 0.317738771, 0)
				ImageLabel.Size = UDim2.new(0.347921491, 0, 0.48174721, 0)
				ImageLabel.Image = "rbxassetid://7047935045"
				ImageLabel.Draggable = true

				local function NXVDBZN_fake_script()
					local script = Instance.new("Script", ImageLabel)

					while true do
						script.Parent.Image = "rbxassetid://7047935045"
						wait(5)
						script.Parent.Image = "rbxassetid://8671458138"
						wait(5)
						script.Parent.Image = "rbxassetid://3352204149"
						wait(5)
						script.Parent.Image = "rbxassetid://8671265876"
						wait(5)
						script.Parent.Image = "rbxassetid://8177142940"
						wait(5)
						script.Parent.Image = "rbxassetid://8795689695"
						wait(5)
						script.Parent.Image = "rbxassetid://8455303389"
						wait(5)
					end
				end
				coroutine.wrap(NXVDBZN_fake_script)()
				local function RFRPI_fake_script() -- ImageLabel.Smooth GUI Dragging
					local script = Instance.new("LocalScript", ImageLabel)

					local UserInputService = game:GetService("UserInputService")
					local runService = (game:GetService("RunService"))

					local gui = script.Parent

					local dragging
					local dragInput
					local dragStart
					local startPos

					function Lerp(a, b, m)
						return a + (b - a) * m
					end

					local lastMousePos
					local lastGoalPos
					local DRAG_SPEED = 8 -- // The speed of the UI darg.
					function Update(dt)
						if not startPos then
							return
						end
						if not dragging and lastGoalPos then
							gui.Position = UDim2.new(
								startPos.X.Scale,
								Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
								startPos.Y.Scale,
								Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
							)
							return
						end

						local delta = (lastMousePos - UserInputService:GetMouseLocation())
						local xGoal = (startPos.X.Offset - delta.X)
						local yGoal = (startPos.Y.Offset - delta.Y)
						lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
						gui.Position = UDim2.new(
							startPos.X.Scale,
							Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
							startPos.Y.Scale,
							Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
						)
					end

					gui.InputBegan:Connect(function(input)
						if
							input.UserInputType == Enum.UserInputType.MouseButton1
							or input.UserInputType == Enum.UserInputType.Touch
						then
							dragging = true
							dragStart = input.Position
							startPos = gui.Position
							lastMousePos = UserInputService:GetMouseLocation()

							input.Changed:Connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									dragging = false
								end
							end)
						end
					end)

					gui.InputChanged:Connect(function(input)
						if
							input.UserInputType == Enum.UserInputType.MouseMovement
							or input.UserInputType == Enum.UserInputType.Touch
						then
							dragInput = input
						end
					end)

					runService.Heartbeat:Connect(Update)
				end
				coroutine.wrap(RFRPI_fake_script)()
			end,
		},
		["minionmemeDESTROY"] = {
			["ListName"] = "minionmemeDESTROY / minionmdestroy / minmdestroy",
			["Description"] = "Destroys The Minion Meme.",
			["Aliases"] = { "minionmdestroy", "minmdestroy" },
			["Function"] = function(args, speaker)
				game:GetService("Players").LocalPlayer.PlayerGui[". Ç¤Ò‰Ì·Ò‰ÌµÒ‰Ì¸Ò‰Ì·Ò‰ÌµÒ‰Ì¸Ò‰Ì¡Ò‰Ì¡Ò‰Ì¼Ò‰Ì±Ò‰ÍŽÒ‰ÍŽÒ‰ÌžÒ‰Ì¼Ò‰Ì±Ò‰ÍŽÒ‰ÍŽÒ‰ÌžÒ‰Í¤Ò‰Í¬Ò‰Ì…Ò‰Í¤Ò‰Í¬"]
					:Destroy()
			end,
		},
	},
}
