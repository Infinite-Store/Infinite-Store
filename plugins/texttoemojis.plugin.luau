local Plugin = {
	["PluginName"] = "Text To Emojis",
	["PluginDescription"] = "edge when will you add boobies.iy to offical iy can i bribe u to please",
	["Commands"] = {
		["texttoemojis"] = {
			["ListName"] = "texttoemojis",
			["Description"] = "sooo swag :sunglass:",
			["Aliases"] = {},
			["Function"] = function(args, speaker)
				local config = {
					["EmojiAutofill"] = true,
					["EmojiReplace"] = true,
				}

				if not game:IsLoaded() then
					game.Loaded:Wait()
				end

				local jsondecode = function(arg)
					return game:GetService("HttpService"):JSONDecode(arg)
				end

				local jsonencode = function(arg)
					return game:GetService("HttpService"):JSONEncode(arg)
				end

				local getchat = function()
					return {
						main = game:GetService("Players").LocalPlayer.PlayerGui.Chat,
						chatbar = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar,
						messages = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller,
					}
				end

				local scroller = function(obj)
					obj.ClipsDescendants = true
					local Scroller = Instance.new("Frame")
					local CopyMessage = Instance.new("TextButton")
					local UIListLayout = Instance.new("UIListLayout")
					local CopyUser = Instance.new("TextButton")
					local DeleteMessage = Instance.new("TextButton")
					local Mute = Instance.new("TextButton")
					local Unmute = Instance.new("TextButton")
					local Tp = Instance.new("TextButton")

					Scroller.Name = "Scroller"
					Scroller.Parent = obj
					Scroller.AnchorPoint = Vector2.new(0.5, 1)
					Scroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Scroller.BackgroundTransparency = 1.000
					Scroller.Position = UDim2.new(0, #obj.TextButton.Text * 14, 6.5, 0)
					Scroller.Size = UDim2.new(0, 206, 0, 99)

					CopyMessage.Name = "CopyMessage"
					CopyMessage.Parent = Scroller
					CopyMessage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					CopyMessage.BackgroundTransparency = 0.500
					CopyMessage.BorderColor3 = Color3.fromRGB(27, 42, 53)
					CopyMessage.BorderSizePixel = 0
					CopyMessage.Position = UDim2.new(0, 49, 0, 50)
					CopyMessage.Size = UDim2.new(0, 200, 0, 15)
					CopyMessage.Font = Enum.Font.SourceSansBold
					CopyMessage.Text = "Copy message"
					CopyMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
					CopyMessage.TextSize = 14.000
					CopyMessage.TextStrokeTransparency = 0.750
					CopyMessage.TextWrapped = true

					UIListLayout.Parent = Scroller
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					UIListLayout.Padding = UDim.new(0, 2)

					CopyUser.Name = "CopyUser"
					CopyUser.Parent = Scroller
					CopyUser.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					CopyUser.BackgroundTransparency = 0.500
					CopyUser.BorderColor3 = Color3.fromRGB(27, 42, 53)
					CopyUser.BorderSizePixel = 0
					CopyUser.Position = UDim2.new(0, 49, 0, 50)
					CopyUser.Size = UDim2.new(0, 200, 0, 15)
					CopyUser.Font = Enum.Font.SourceSansBold
					CopyUser.Text = "Copy username"
					CopyUser.TextColor3 = Color3.fromRGB(255, 255, 255)
					CopyUser.TextSize = 14.000
					CopyUser.TextStrokeTransparency = 0.750
					CopyUser.TextWrapped = true

					DeleteMessage.Name = "DeleteMessage"
					DeleteMessage.Parent = Scroller
					DeleteMessage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					DeleteMessage.BackgroundTransparency = 0.500
					DeleteMessage.BorderColor3 = Color3.fromRGB(27, 42, 53)
					DeleteMessage.BorderSizePixel = 0
					DeleteMessage.Position = UDim2.new(0, 49, 0, 50)
					DeleteMessage.Size = UDim2.new(0, 200, 0, 15)
					DeleteMessage.Font = Enum.Font.SourceSansBold
					DeleteMessage.Text = "Delete (client)"
					DeleteMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
					DeleteMessage.TextSize = 14.000
					DeleteMessage.TextStrokeTransparency = 0.750
					DeleteMessage.TextWrapped = true

					Mute.Name = "Mute"
					Mute.Parent = Scroller
					Mute.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Mute.BackgroundTransparency = 0.500
					Mute.BorderColor3 = Color3.fromRGB(27, 42, 53)
					Mute.BorderSizePixel = 0
					Mute.Position = UDim2.new(0, 49, 0, 50)
					Mute.Size = UDim2.new(0, 200, 0, 15)
					Mute.Font = Enum.Font.SourceSansBold
					Mute.Text = "Mute (client)"
					Mute.TextColor3 = Color3.fromRGB(255, 255, 255)
					Mute.TextSize = 14.000
					Mute.TextStrokeTransparency = 0.750
					Mute.TextWrapped = true

					Unmute.Name = "Unmute"
					Unmute.Parent = Scroller
					Unmute.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Unmute.BackgroundTransparency = 0.500
					Unmute.BorderColor3 = Color3.fromRGB(27, 42, 53)
					Unmute.BorderSizePixel = 0
					Unmute.Position = UDim2.new(0, 49, 0, 50)
					Unmute.Size = UDim2.new(0, 200, 0, 15)
					Unmute.Font = Enum.Font.SourceSansBold
					Unmute.Text = "Unmute (client)"
					Unmute.TextColor3 = Color3.fromRGB(255, 255, 255)
					Unmute.TextSize = 14.000
					Unmute.TextStrokeTransparency = 0.750
					Unmute.TextWrapped = true

					Tp.Name = "Tp"
					Tp.Parent = Scroller
					Tp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Tp.BackgroundTransparency = 0.500
					Tp.BorderColor3 = Color3.fromRGB(27, 42, 53)
					Tp.BorderSizePixel = 0
					Tp.Position = UDim2.new(0, 49, 0, 50)
					Tp.Size = UDim2.new(0, 200, 0, 15)
					Tp.Font = Enum.Font.SourceSansBold
					Tp.Text = "Teleport To Player"
					Tp.TextColor3 = Color3.fromRGB(255, 255, 255)
					Tp.TextSize = 14.000
					Tp.TextStrokeTransparency = 0.750
					Tp.TextWrapped = true
					return Scroller
				end

				local bindable = Instance.new("BindableEvent")
				local cache = {}
				local dependencies = {
					["Emojis"] = jsondecode(game:HttpGet("https://pastebin.com/raw/719UsVji")),
					["Chat"] = getchat(),
				}

				local sendmsg = function(m)
					if dependencies["Chat"] then
						game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
							:FireServer(m, "All")
					end
				end

				local get = function(s)
					if dependencies["Emojis"][s] then
						return dependencies["Emojis"][s]
					else
						return nil
					end
				end

				local fillmatches = function(emojis, object)
					local t = object.Text
					for i, v in pairs(emojis) do
						local emoji = get(v)
						if emoji then
							object.Text = string.gsub(object.Text, ":" .. v .. ":", emoji)
						end
					end
				end

				local last

				local autofill = function(tbl, object)
					local find = tbl[1]
					if #find >= 2 then
					else
						return
					end

					local start = tbl[2]
					last = tbl

					local match

					for i, v in pairs(dependencies["Emojis"]) do
						if i:lower():sub(1, #find) == find:lower() then
							match = i
						end
					end

					object.Parent.AutofillBox.PlaceholderText = ""

					if match then
						local s = object.Text:sub(1, start - 1)
						object.Parent.AutofillBox.PlaceholderText = s .. ":" .. match .. ":"
					end
				end

				local trueautofill = function(tbl, object)
					local find = tbl[1]
					local start = tbl[2]

					local match
					last = nil

					if #find >= 2 then
					else
						return
					end

					for i, v in pairs(dependencies["Emojis"]) do
						if i:lower():sub(1, #find) == find:lower() then
							match = i
						end
					end

					if match then
						local s = object.Text:sub(1, start - 1)
						object.Text = s .. ":" .. match .. ":"
					end
				end

				local match = function(t, obj)
					if t:find(":") then
						local start = 0
						local scan = {}
						local autofills = {}

						for i = 1, #t do
							local s = t:sub(i, i)
							if s == ":" then
								if start >= 1 then
									table.insert(scan, t:sub(start + 1, i - 1))
									start = 0
								else
									start = i
								end
							end
						end

						start = 0

						for i = 1, #t do
							local s = t:sub(i, i)
							if s == ":" then
								if start >= 1 then
									start = 0
								else
									start = i
								end
							end
						end

						obj.Parent.AutofillBox.PlaceholderText = ""

						if start >= 1 then
							table.insert(autofills, t:sub(start + 1, #t))
							if config["EmojiAutofill"] == true then
								autofill({
									autofills[1],
									start,
								}, obj)
							end
						else
							obj.Parent.AutofillBox.PlaceholderText = ""
						end

						if config["EmojiReplace"] == true then
							fillmatches(scan, obj)
						end
					else
						return {}
					end
				end

				spawn(function()
					game:GetService("RunService").Heartbeat:Connect(function()
						if cache[dependencies["Chat"].chatbar] == nil then
							cache[dependencies["Chat"].chatbar] = true
							dependencies["Chat"] = getchat()
							bindable:Fire(dependencies["Chat"])
						end
					end)
				end)

				game:GetService("UserInputService").InputBegan:Connect(function(k)
					if k.KeyCode then
						if k.KeyCode == Enum.KeyCode.Tab then
							if focused then
								if last then
									local object = dependencies["Chat"].chatbar
									trueautofill(last, object)
									wait()
									object.Text = object.Text:sub(1, #object.Text - 1)
								end
							end
						end
					end
				end)

				local getplayer = function(t)
					for i = 1, #t do
						if t:sub(i, i) == "]" then
							return game:GetService("Players"):FindFirstChild(t:sub(2, i - 1))
						end
					end
					return nil
				end

				local getvalue = function(t)
					for i = 1, #t do
						if t:sub(i, i) == " " then
						else
							return t:sub(i, #t)
						end
					end
					return "void"
				end

				local scrollers = {}

				game:GetService("UserInputService").InputBegan:Connect(function(input)
					if dependencies["Chat"] then
						if input.UserInputType == Enum.UserInputType.MouseButton2 then
							local m = game:GetService("Players").LocalPlayer:GetMouse()
							local objs = game:GetService("Players").LocalPlayer.PlayerGui
								:GetGuiObjectsAtPosition(m.X, m.Y)
							for i, v in pairs(objs) do
								if v:FindFirstChild("TextButton") then
									if v:FindFirstChild("Scroller") then
										return
									end
									local s = scroller(v)

									for i, v in pairs(s:GetChildren()) do
										if v:IsA("TextButton") then
											v.ZIndex = 20
										end
									end

									table.insert(scrollers, s)
									if #scrollers >= 2 then
										scrollers[1]:Destroy()
										scrollers = {
											s,
										}
									end
									s.Parent.ClipsDescendants = false
									s.MouseLeave:Connect(function()
										s:Destroy()
									end)

									s.CopyMessage.MouseButton1Click:Connect(function()
										setclipboard(getvalue(v.Text))
										s:Destroy()
									end)

									s.DeleteMessage.MouseButton1Click:Connect(function()
										v:Destroy()
									end)

									s.CopyUser.MouseButton1Click:Connect(function()
										local t = v.TextButton.Text
										for i = 1, #t do
											if t:sub(i, i) == "]" then
												setclipboard(t:sub(2, i - 1))
											end
										end
										s:Destroy()
									end)

									s.Unmute.MouseButton1Click:Connect(function()
										sendmsg("/unmute " .. tostring(getplayer(v.TextButton.Text)))
										s:Destroy()
									end)

									s.Mute.MouseButton1Click:Connect(function()
										sendmsg("/mute " .. tostring(getplayer(v.TextButton.Text)))
										s:Destroy()
									end)

									s.Tp.MouseButton1Click:Connect(function()
										local plr = getplayer(v.TextButton.Text)
										local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
										local them = plr.Character:WaitForChild("HumanoidRootPart")
										hrp.CFrame = CFrame.new(them.Position)
									end)
								end
							end
						end
					end
				end)

				bindable.Event:Connect(function(tbl)
					local bar = tbl.chatbar
					bar.ZIndex = 2
					bar.Parent.TextLabel.ZIndex = 3
					local clone = bar:Clone()
					clone.Name = "AutofillBox"
					clone.Parent = bar.Parent
					clone.TextEditable = false
					clone.ZIndex = 1
					clone.TextTransparency = 0.5
					clone.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)

					bar:GetPropertyChangedSignal("Text"):Connect(function()
						focused = true
						local txt = bar.Text
						if txt == "" then
							clone.PlaceholderText = ""
							return
						end
						match(txt, bar)
					end)

					bar.FocusLost:Connect(function()
						clone.PlaceholderText = ""
						focused = false
					end)
				end)
			end,
		},
	},
}

return Plugin
