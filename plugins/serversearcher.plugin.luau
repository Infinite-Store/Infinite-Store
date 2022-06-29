local Plugin = {
	["PluginName"] = "Server searcher",
	["PluginDescription"] = "load GUI search for server",
	["Commands"] = {
		["serversearch"] = {
			["ListName"] = "serversearch / ssearch",
			["Description"] = "search server yes",
			["Aliases"] = { "ssearch" },
			["Function"] = function(args, speaker)
				local ServerListGUI = Instance.new("ScreenGui")
				local Background = Instance.new("ImageLabel")
				local refreshButton = Instance.new("TextButton")
				local serverID = Instance.new("TextBox")
				local scrapeAll = Instance.new("TextButton")
				local scrapeServer = Instance.new("TextButton")
				local serverList = Instance.new("ScrollingFrame")
				local UIListLayout = Instance.new("UIListLayout")
				local title = Instance.new("TextLabel")
				local close = Instance.new("ImageButton")
				local players = Instance.new("TextLabel")
				local fps = Instance.new("TextLabel")
				local sortPlayers = Instance.new("TextButton")
				local sortPing = Instance.new("TextButton")
				local sortFPS = Instance.new("TextButton")
				local ping = Instance.new("TextLabel")

				ServerListGUI.Name = "ServerListGUI"
				ServerListGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

				Background.Name = "Background"
				Background.Parent = ServerListGUI
				Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Background.BackgroundTransparency = 1.000
				Background.Position = UDim2.new(0.264210522, 0, 0.216599196, 0)
				Background.Size = UDim2.new(0, 500, 0, 300)
				Background.Image = "rbxassetid://3570695787"
				Background.ImageColor3 = Color3.fromRGB(30, 30, 30)
				Background.ScaleType = Enum.ScaleType.Slice
				Background.SliceCenter = Rect.new(100, 100, 100, 100)
				Background.SliceScale = 0.120

				refreshButton.Name = "refreshButton"
				refreshButton.Parent = Background
				refreshButton.BackgroundColor3 = Color3.fromRGB(0, 36, 116)
				refreshButton.BorderColor3 = Color3.fromRGB(30, 30, 30)
				refreshButton.BorderSizePixel = 5
				refreshButton.Position = UDim2.new(0.0399999991, 0, 0.230000004, 0)
				refreshButton.Size = UDim2.new(0, 102, 0, 30)
				refreshButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
				refreshButton.Font = Enum.Font.SciFi
				refreshButton.Text = "Refresh"
				refreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				refreshButton.TextSize = 14.000

				serverID.Name = "serverID"
				serverID.Parent = Background
				serverID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				serverID.BorderSizePixel = 0
				serverID.Position = UDim2.new(0.0460000001, 0, 0.143333361, 0)
				serverID.Size = UDim2.new(0, 96, 0, 26)
				serverID.Font = Enum.Font.SourceSans
				serverID.Text = game.PlaceId
				serverID.TextColor3 = Color3.fromRGB(0, 0, 0)
				serverID.TextSize = 14.000

				scrapeServer.Name = "scrapeAll"
				scrapeServer.Parent = Background
				scrapeServer.BackgroundColor3 = Color3.fromRGB(0, 36, 116)
				scrapeServer.BorderColor3 = Color3.fromRGB(30, 30, 30)
				scrapeServer.BorderSizePixel = 5
				scrapeServer.Position = UDim2.new(0.0399999991, 0, 0.833333373, 0)
				scrapeServer.Size = UDim2.new(0, 102, 0, 30)
				scrapeServer.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
				scrapeServer.Font = Enum.Font.SciFi
				scrapeServer.Text = "Scrape Server"
				scrapeServer.TextColor3 = Color3.fromRGB(255, 255, 255)
				scrapeServer.TextSize = 14.000

				serverList.Name = "serverList"
				serverList.Parent = Background
				serverList.Active = true
				serverList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				serverList.BorderColor3 = Color3.fromRGB(27, 42, 53)
				serverList.BorderSizePixel = 0
				serverList.Position = UDim2.new(0.285052747, 0, 0.230000004, 0)
				serverList.Size = UDim2.new(0, 350, 0, 217)
				serverList.CanvasPosition = Vector2.new(0, 74.6544647)

				UIListLayout.Parent = serverList
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				title.Name = "title"
				title.Parent = Background
				title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				title.BackgroundTransparency = 1.000
				title.BorderSizePixel = 0
				title.Position = UDim2.new(0.0460000001, 0, 0, 0)
				title.Size = UDim2.new(0, 171, 0, 43)
				title.Font = Enum.Font.SciFi
				title.Text = "Mew's Server Lister"
				title.TextColor3 = Color3.fromRGB(255, 255, 255)
				title.TextSize = 20.000
				title.TextXAlignment = Enum.TextXAlignment.Left

				close.Name = "close"
				close.Parent = Background
				close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				close.BackgroundTransparency = 1.000
				close.Position = UDim2.new(0.957000017, 0, 0.0433333367, 0)
				close.Size = UDim2.new(0, 16, 0, 16)
				close.Image = "rbxassetid://56290972"
				close.ImageColor3 = Color3.fromRGB(170, 0, 0)

				players.Name = "players"
				players.Parent = Background
				players.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				players.BackgroundTransparency = 1.000
				players.BorderSizePixel = 0
				players.Position = UDim2.new(0.504000008, 0, 0.113333337, 0)
				players.Size = UDim2.new(0, 68, 0, 43)
				players.Font = Enum.Font.SciFi
				players.Text = "Players"
				players.TextColor3 = Color3.fromRGB(255, 255, 255)
				players.TextSize = 20.000
				players.TextXAlignment = Enum.TextXAlignment.Left

				fps.Name = "fps"
				fps.Parent = Background
				fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				fps.BackgroundTransparency = 1.000
				fps.BorderSizePixel = 0
				fps.Position = UDim2.new(0.835999966, 0, 0.113333337, 0)
				fps.Size = UDim2.new(0, 34, 0, 43)
				fps.Font = Enum.Font.SciFi
				fps.Text = "FPS"
				fps.TextColor3 = Color3.fromRGB(255, 255, 255)
				fps.TextSize = 20.000
				fps.TextXAlignment = Enum.TextXAlignment.Left

				sortPlayers.Name = "sortPlayers"
				sortPlayers.Parent = Background
				sortPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				sortPlayers.BackgroundTransparency = 1.000
				sortPlayers.Position = UDim2.new(0.483999997, 0, 0.143333331, 0)
				sortPlayers.Size = UDim2.new(0, 86, 0, 26)
				sortPlayers.ZIndex = 10
				sortPlayers.Font = Enum.Font.SourceSans
				sortPlayers.TextColor3 = Color3.fromRGB(0, 0, 0)
				sortPlayers.TextSize = 14.000
				sortPlayers.TextTransparency = 1.000

				sortPing.Name = "sortPing"
				sortPing.Parent = Background
				sortPing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				sortPing.BackgroundTransparency = 1.000
				sortPing.Position = UDim2.new(0.684000015, 0, 0.143333331, 0)
				sortPing.Size = UDim2.new(0, 53, 0, 26)
				sortPing.ZIndex = 10
				sortPing.Font = Enum.Font.SourceSans
				sortPing.TextColor3 = Color3.fromRGB(0, 0, 0)
				sortPing.TextSize = 14.000
				sortPing.TextTransparency = 1.000

				sortFPS.Name = "sortFPS"
				sortFPS.Parent = Background
				sortFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				sortFPS.BackgroundTransparency = 1.000
				sortFPS.Position = UDim2.new(0.815999985, 0, 0.143333331, 0)
				sortFPS.Size = UDim2.new(0, 51, 0, 26)
				sortFPS.ZIndex = 10
				sortFPS.Font = Enum.Font.SourceSans
				sortFPS.TextColor3 = Color3.fromRGB(0, 0, 0)
				sortFPS.TextSize = 14.000
				sortFPS.TextTransparency = 1.000

				ping.Name = "ping"
				ping.Parent = Background
				ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ping.BackgroundTransparency = 1.000
				ping.BorderSizePixel = 0
				ping.Position = UDim2.new(0.698000014, 0, 0.113333337, 0)
				ping.Size = UDim2.new(0, 40, 0, 43)
				ping.Font = Enum.Font.SciFi
				ping.Text = "Ping"
				ping.TextColor3 = Color3.fromRGB(255, 255, 255)
				ping.TextSize = 20.000
				ping.TextXAlignment = Enum.TextXAlignment.Left

				-- Functionality
				local firstdone = false
				local cursortrue = false
				local cursor = ""
				local function scrapefirst()
					local HttpService = game:GetService("HttpService")
					local getServers = syn.request({
						Url = "https://games.roblox.com/v1/games/"
							.. tostring(serverID.Text)
							.. "/servers/Public?sortOrder=Asc&limit=100",
						Method = "GET",
					})
					local serverTable = HttpService:JSONDecode(getServers.Body)

					if serverTable.nextPageCursor == nil then
						cursortrue = false
					else
						cursortrue = true
						cursor = serverTable.nextPageCursor
					end

					for index, table in pairs(serverTable.data) do
						local serverTemplate = Instance.new("Frame")
						local joinButton = Instance.new("TextButton")
						local serverCapacity = Instance.new("TextLabel")
						local ping = Instance.new("TextLabel")
						local fps = Instance.new("TextLabel")

						serverTemplate.Name = "serverTemplate"
						serverTemplate.Parent = game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList
						serverTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						serverTemplate.BackgroundTransparency = 1.000
						serverTemplate.Size = UDim2.new(0, 335, 0, 50)

						joinButton.Name = "joinButton"
						joinButton.Parent = serverTemplate
						joinButton.BackgroundColor3 = Color3.fromRGB(0, 36, 116)
						joinButton.BorderColor3 = Color3.fromRGB(30, 30, 30)
						joinButton.BorderSizePixel = 5
						joinButton.Position = UDim2.new(0.0220895335, 0, 0.189999998, 0)
						joinButton.Size = UDim2.new(0, 80, 0, 30)
						joinButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
						joinButton.Font = Enum.Font.SciFi
						joinButton.Text = "Join"
						joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
						joinButton.TextSize = 14.000
						joinButton.MouseButton1Down:connect(function()
							local player = game.Players.LocalPlayer
							local jobID = table.id
							local placeID = serverID.Text

							local TeleportService = game:GetService("TeleportService")
							TeleportService:TeleportToPlaceInstance(placeID, jobID, player)
						end)

						serverCapacity.Name = "serverCapacity"
						serverCapacity.Parent = serverTemplate
						serverCapacity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						serverCapacity.BackgroundTransparency = 1.000
						serverCapacity.BorderSizePixel = 0
						serverCapacity.Position = UDim2.new(0.324895531, 0, 0.0533333384, 0)
						serverCapacity.Size = UDim2.new(0, 68, 0, 43)
						serverCapacity.Font = Enum.Font.SciFi
						serverCapacity.Text = table.playing .. "/" .. table.maxPlayers
						serverCapacity.TextColor3 = Color3.fromRGB(255, 255, 255)
						serverCapacity.TextSize = 20.000

						ping.Name = "ping"
						ping.Parent = serverTemplate
						ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ping.BackgroundTransparency = 1.000
						ping.BorderSizePixel = 0
						ping.Position = UDim2.new(0.572656751, 0, 0.0533333384, 0)
						ping.Size = UDim2.new(0, 68, 0, 43)
						ping.Font = Enum.Font.SciFi
						ping.Text = table.ping .. " ms"
						ping.TextColor3 = Color3.fromRGB(255, 255, 255)
						ping.TextSize = 20.000

						fps.Name = "fps"
						fps.Parent = serverTemplate
						fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						fps.BackgroundTransparency = 1.000
						fps.BorderSizePixel = 0
						fps.Position = UDim2.new(0.769671679, 0, 0.0533333384, 0)
						fps.Size = UDim2.new(0, 68, 0, 43)
						fps.Font = Enum.Font.SciFi
						fps.Text = string.split(table.fps, ".")[1]
						fps.TextColor3 = Color3.fromRGB(255, 255, 255)
						fps.TextSize = 20.000
					end

					firstdone = true
				end

				local function scrapeservers()
					spawn(scrapefirst)
					repeat
						wait()
					until firstdone == true
					if cursortrue == true then
						while cursortrue == true do
							local HttpService = game:GetService("HttpService")
							local getServers = syn.request({
								Url = "https://games.roblox.com/v1/games/"
									.. tostring(serverID.Text)
									.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
									.. tostring(cursor),
								Method = "GET",
							})
							local serverTable = HttpService:JSONDecode(getServers.Body)
							print(
								"https://games.roblox.com/v1/games/"
									.. tostring(serverID.Text)
									.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
									.. tostring(cursor)
							)

							if serverTable.nextPageCursor == nil then
								cursortrue = false
							else
								cursortrue = true
								cursor = serverTable.nextPageCursor
							end

							for index, table in pairs(serverTable.data) do
								local serverTemplate = Instance.new("Frame")
								local joinButton = Instance.new("TextButton")
								local serverCapacity = Instance.new("TextLabel")
								local ping = Instance.new("TextLabel")
								local fps = Instance.new("TextLabel")

								serverTemplate.Name = "serverTemplate"
								serverTemplate.Parent =
									game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList
								serverTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								serverTemplate.BackgroundTransparency = 1.000
								serverTemplate.Size = UDim2.new(0, 335, 0, 50)

								joinButton.Name = "joinButton"
								joinButton.Parent = serverTemplate
								joinButton.BackgroundColor3 = Color3.fromRGB(0, 36, 116)
								joinButton.BorderColor3 = Color3.fromRGB(30, 30, 30)
								joinButton.BorderSizePixel = 5
								joinButton.Position = UDim2.new(0.0220895335, 0, 0.189999998, 0)
								joinButton.Size = UDim2.new(0, 80, 0, 30)
								joinButton.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
								joinButton.Font = Enum.Font.SciFi
								joinButton.Text = "Join"
								joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
								joinButton.TextSize = 14.000
								joinButton.MouseButton1Down:connect(function()
									local player = game.Players.LocalPlayer
									local jobID = table.id
									local placeID = serverID.Text

									local TeleportService = game:GetService("TeleportService")
									TeleportService:TeleportToPlaceInstance(placeID, jobID, player)
								end)

								serverCapacity.Name = "serverCapacity"
								serverCapacity.Parent = serverTemplate
								serverCapacity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								serverCapacity.BackgroundTransparency = 1.000
								serverCapacity.BorderSizePixel = 0
								serverCapacity.Position = UDim2.new(0.324895531, 0, 0.0533333384, 0)
								serverCapacity.Size = UDim2.new(0, 68, 0, 43)
								serverCapacity.Font = Enum.Font.SciFi
								serverCapacity.Text = table.playing .. "/" .. table.maxPlayers
								serverCapacity.TextColor3 = Color3.fromRGB(255, 255, 255)
								serverCapacity.TextSize = 20.000

								ping.Name = "ping"
								ping.Parent = serverTemplate
								ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ping.BackgroundTransparency = 1.000
								ping.BorderSizePixel = 0
								ping.Position = UDim2.new(0.572656751, 0, 0.0533333384, 0)
								ping.Size = UDim2.new(0, 68, 0, 43)
								ping.Font = Enum.Font.SciFi
								ping.Text = table.ping .. " ms"
								ping.TextColor3 = Color3.fromRGB(255, 255, 255)
								ping.TextSize = 20.000

								fps.Name = "fps"
								fps.Parent = serverTemplate
								fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								fps.BackgroundTransparency = 1.000
								fps.BorderSizePixel = 0
								fps.Position = UDim2.new(0.769671679, 0, 0.0533333384, 0)
								fps.Size = UDim2.new(0, 68, 0, 43)
								fps.Font = Enum.Font.SciFi
								fps.Text = string.split(table.fps, ".")[1]
								fps.TextColor3 = Color3.fromRGB(255, 255, 255)
								fps.TextSize = 20.000
							end
						end
					end
				end

				Background.Active = true
				Background.Selectable = true
				Background.Draggable = true

				close.MouseButton1Down:connect(function()
					game.Players.LocalPlayer.PlayerGui.ServerListGUI:Destroy()
				end)

				refreshButton.MouseButton1Down:connect(function()
					local todestroy =
						game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList:GetChildren()
					for index, destroy in pairs(todestroy) do
						if destroy.Name ~= "UIListLayout" then
							destroy:Destroy()
						end
					end
					spawn(scrapeservers)
				end)

				local scrollframe = serverList
				scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrollframe.UIListLayout.AbsoluteContentSize.Y)
				scrollframe.ChildAdded:Connect(function()
					wait()
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrollframe.UIListLayout.AbsoluteContentSize.Y)
				end)

				scrollframe.ChildRemoved:Connect(function()
					wait()
					scrollframe.CanvasSize = UDim2.new(0, 0, 0, scrollframe.UIListLayout.AbsoluteContentSize.Y)
				end)

				local playerToggle = false
				sortPlayers.MouseButton1Down:connect(function()
					local torename =
						game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList:GetChildren()
					if playerToggle == false then
						for index, rename in pairs(torename) do
							if rename.Name ~= "UIListLayout" then
								local playersOn = string.split(rename.serverCapacity.Text, "/")[1]
								rename.LayoutOrder = playersOn
							end
						end
						playerToggle = true
					else
						if playerToggle == true then
							for index, rename in pairs(torename) do
								if rename.Name ~= "UIListLayout" then
									local playersOn = string.split(rename.serverCapacity.Text, "/")[1]
									rename.LayoutOrder = -playersOn
								end
							end
							playerToggle = false
						end
					end
				end)

				local pingToggle = false
				sortPing.MouseButton1Down:connect(function()
					local torename =
						game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList:GetChildren()
					if pingToggle == false then
						for index, rename in pairs(torename) do
							if rename.Name ~= "UIListLayout" then
								local ping = string.split(rename.ping.Text, " ")[1]
								rename.LayoutOrder = ping
							end
						end
						pingToggle = true
					else
						if pingToggle == true then
							for index, rename in pairs(torename) do
								if rename.Name ~= "UIListLayout" then
									local ping = string.split(rename.ping.Text, " ")[1]
									rename.LayoutOrder = -ping
								end
							end
							pingToggle = false
						end
					end
				end)

				local fpsToggle = false
				sortFPS.MouseButton1Down:connect(function()
					local torename =
						game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background.serverList:GetChildren()
					if fpsToggle == false then
						for index, rename in pairs(torename) do
							if rename.Name ~= "UIListLayout" then
								local fps = rename.fps.Text
								rename.LayoutOrder = fps
							end
						end
						fpsToggle = true
					else
						if fpsToggle == true then
							for index, rename in pairs(torename) do
								if rename.Name ~= "UIListLayout" then
									local fps = rename.fps.Text
									rename.LayoutOrder = -fps
								end
							end
							fpsToggle = false
						end
					end
				end)

				scrapeServer.MouseButton1Down:connect(function()
					local clipboard = ""
					Players = game:GetService("Players")
					for i, player in pairs(Players:GetPlayers()) do
						clipboard = clipboard .. "\n" .. player.Name
					end
					setclipboard(clipboard)
				end)

				local mouse = game.Players.LocalPlayer:GetMouse()
				local gui = game.Players.LocalPlayer.PlayerGui.ServerListGUI.Background
				local open = false

				mouse.KeyDown:connect(function(key)
					if open == false then
						open = true
						if key:lower() == "l" then
							gui.Visible = false
						end
					else
						open = false
						if key:lower() == "l" then
							gui.Visible = true
						end
					end
				end)
			end,
		},
	},
}

return Plugin
